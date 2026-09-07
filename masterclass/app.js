    lucide.createIcons();

    let currentSlide = 0;
    const slides = document.querySelectorAll('.slide');
    const totalSlides = slides.length;
    let isNotesOpen = false;
    let isOverviewOpen = false;
    let timerSeconds = 0;
    let timerInterval = null;

    let conditionChartInstance = null;
    let expectancyChartInstance = null;
    let maeChartInstance = null;
    let holdingChartInstance = null;

    const activeConditions = {
      Monday: true,
      ATR: true,
      RSI: false,
      SPY: false
    };

    function initPresentation() {
      if (window.lucide) {
        try { lucide.createIcons(); } catch (e) {}
      }

      showSlide(0);
      document.getElementById("overviewModal").inert = true;
      document.getElementById("presenterDrawer").inert = true;
      if (window.Chart && matchMedia("(prefers-reduced-motion: reduce)").matches) Chart.defaults.animation = false;
      buildOverviewGrid();
      startTimer();

      try { renderExitDetail(0); } catch (e) {}
      try { initHeatmaps(); } catch (e) {}
      try { initAllCharts(); } catch (e) {}
      try { showAgentStep(1); } catch (e) {}

      // Header button handlers
      const btnNotes = document.getElementById('btnNotesToggle');
      if (btnNotes) btnNotes.onclick = togglePresenterNotes;

      const btnOverview = document.getElementById('btnOverviewToggle');
      if (btnOverview) btnOverview.onclick = toggleOverview;

      const btnFull = document.getElementById('btnFullscreen');
      if (btnFull) btnFull.onclick = toggleFullScreen;

      const prev = document.getElementById('prevBtn');
      if (prev) prev.onclick = () => changeSlide(-1);

      const next = document.getElementById('nextBtn');
      if (next) next.onclick = () => changeSlide(1);

      document.addEventListener('keydown', (e) => {
        if (e.target.closest('input, textarea, select, [contenteditable=true]')) return;
        if (e.key === ' ' && e.target.closest('button, a')) return;
        if (e.key === 'Tab' && isOverviewOpen) {
          const items = [...document.querySelectorAll('#overviewModal button, #overviewModal [tabindex="0"]')];
          const first = items[0], last = items[items.length - 1];
          if (e.shiftKey && document.activeElement === first) { e.preventDefault(); last?.focus(); }
          else if (!e.shiftKey && document.activeElement === last) { e.preventDefault(); first?.focus(); }
          return;
        }
        if (isOverviewOpen && e.key !== 'Escape') return;
        if (e.key === 'ArrowRight' || e.key === ' ' || e.key === 'PageDown') {
          e.preventDefault();
          changeSlide(1);
        } else if (e.key === 'ArrowLeft' || e.key === 'PageUp') {
          e.preventDefault();
          changeSlide(-1);
        } else if (e.key.toLowerCase() === 'n') {
          togglePresenterNotes();
        } else if (e.key.toLowerCase() === 'o') {
          toggleOverview();
        } else if (e.key.toLowerCase() === 'f') {
          toggleFullScreen();
        } else if (e.key === 'Escape') {
          if (isOverviewOpen) toggleOverview();
          if (isNotesOpen) togglePresenterNotes();
        }
      });
    }

    function showSlide(index) {
      if (index < 0 || index >= totalSlides) return;
      slides[currentSlide].classList.remove('active');
      currentSlide = index;
      slides[currentSlide].classList.add('active');
      slides.forEach((slide, i) => { slide.inert = i !== currentSlide; slide.setAttribute('aria-hidden', String(i !== currentSlide)); });

      document.getElementById('slideCounter').textContent = `Diapositiva ${String(currentSlide + 1).padStart(2, '0')} / ${String(totalSlides).padStart(2, '0')}`;
      const progressPercent = ((currentSlide + 1) / totalSlides) * 100;
      document.getElementById('progressBar').style.width = `${progressPercent}%`;

      document.getElementById('prevBtn').disabled = (currentSlide === 0);
      document.getElementById('nextBtn').disabled = (currentSlide === totalSlides - 1);

      updatePresenterNotes();
      updateOverviewSelection();

      setTimeout(() => {
        if (conditionChartInstance) conditionChartInstance.resize();
        if (expectancyChartInstance) expectancyChartInstance.resize();
        if (maeChartInstance) maeChartInstance.resize();
        if (holdingChartInstance) holdingChartInstance.resize();
      }, 80);
    }

    function changeSlide(direction) {
      showSlide(currentSlide + direction);
    }

    function startTimer() {
      timerInterval = setInterval(() => {
        timerSeconds++;
        const mins = String(Math.floor(timerSeconds / 60)).padStart(2, '0');
        const secs = String(timerSeconds % 60).padStart(2, '0');
        document.getElementById('timerText').textContent = `${mins}:${secs}`;
      }, 1000);

      document.getElementById('deckTimer').onclick = () => {
        timerSeconds = 0;
        document.getElementById('timerText').textContent = "00:00";
      };
    }

    function togglePresenterNotes() {
      isNotesOpen = !isNotesOpen;
      const drawer = document.getElementById('presenterDrawer');
      const btn = document.getElementById('btnNotesToggle');
      drawer.setAttribute('aria-hidden', String(!isNotesOpen));
      drawer.inert = !isNotesOpen;
      btn.setAttribute('aria-expanded', String(isNotesOpen));
      if (isNotesOpen) {
        drawer.classList.add('open');
        btn.classList.add('active');
        updatePresenterNotes();
      } else {
        drawer.classList.remove('open');
        btn.classList.remove('active');
      }
    }

    function updatePresenterNotes() {
      const activeSlideEl = slides[currentSlide];
      const title = activeSlideEl.getAttribute('data-title') || 'Notas';
      const notes = activeSlideEl.getAttribute('data-notes') || 'Sin notas añadidas.';
      
      const formatted = notes.replace(/\n/g, '<br><br>').replace(/"(.*?)"/g, '<blockquote>"$1"</blockquote>');
      document.getElementById('presenterNotesBody').innerHTML = `
        <div style="font-size:0.8rem; color:var(--accent-primary); font-weight:700; margin-bottom:8px;">${title}</div>
        <div>${formatted}</div>
      `;
    }

    function buildOverviewGrid() {
      const grid = document.getElementById('overviewGrid');
      grid.innerHTML = '';
      slides.forEach((s, idx) => {
        const card = document.createElement('button');
        card.type = 'button';
        card.className = `overview-card ${idx === currentSlide ? 'current' : ''}`;
        card.onclick = () => {
          showSlide(idx);
          toggleOverview();
        };
        const title = s.getAttribute('data-title') || `Slide ${idx + 1}`;
        card.innerHTML = `
          <div class="slide-num">SLIDE ${String(idx + 1).padStart(2, '0')}</div>
          <div class="slide-name">${title}</div>
        `;
        grid.appendChild(card);
      });
    }

    function updateOverviewSelection() {
      const cards = document.querySelectorAll('.overview-card');
      cards.forEach((c, idx) => {
        if (idx === currentSlide) c.classList.add('current');
        else c.classList.remove('current');
      });
    }

    function toggleOverview() {
      isOverviewOpen = !isOverviewOpen;
      const modal = document.getElementById('overviewModal');
      const btn = document.getElementById('btnOverviewToggle');
      modal.setAttribute('aria-hidden', String(!isOverviewOpen));
      modal.inert = !isOverviewOpen;
      document.getElementById('deckContainer').inert = isOverviewOpen;
      btn.setAttribute('aria-expanded', String(isOverviewOpen));
      if (isOverviewOpen) {
        modal.classList.add('open');
        modal.querySelector('button')?.focus();
        btn.classList.add('active');
      } else {
        modal.classList.remove('open');
        btn.focus();
        btn.classList.remove('active');
      }
    }

    function toggleFullScreen() {
      if (!document.fullscreenElement) {
        document.documentElement.requestFullscreen().catch(() => {});
      } else {
        if (document.exitFullscreen) document.exitFullscreen();
      }
    }

    document.getElementById('btnNotesToggle').onclick = togglePresenterNotes;
    document.getElementById('btnOverviewToggle').onclick = toggleOverview;
    document.getElementById('btnFullscreen').onclick = toggleFullScreen;

    // ================= SLIDE 3: XYZ Case Selector =================
    const xyzCases = {
      1: {
        x: "Apertura con salto fuerte (Gap)",
        y: "El precio regresa a cerrar el salto",
        z: "Los grandes operadores reequilibran sus órdenes de la noche",
        valid: true,
        verdict: " <strong>HIPÓTESIS CLARA:</strong> 'Cuando el precio abre con un salto fuerte, espero que vuelva atrás, porque los grandes participantes necesitan equilibrar sus posiciones.'"
      },
      2: {
        x: "Último día del mes al cierre",
        y: "Subida fuerte en acciones líderes",
        z: "Los fondos de inversión reajustan carteras por obligación",
        valid: true,
        verdict: " <strong>FLUJO REAL:</strong> 'Este patrón no es casualidad: los grandes fondos tienen la obligación de comprar o vender para cerrar el mes.'"
      },
      3: {
        x: "Un indicador marca 'sobreventa' (ej. RSI bajo)",
        y: "El precio sube de inmediato",
        z: "",
        valid: false,
        verdict: " <strong>SIN RAZÓN REAL (SÓLO NÚMEROS):</strong> 'Un indicador no mueve el mercado. Si buscas combinaciones mágicas sin un motivo económico real detrás, el sistema fallará en real.'"
      }
    };

    function showEntryTab(tab) {
      ['a','b','c'].forEach(t => {
        const panel = document.getElementById('epanel-' + t);
        const btn = document.getElementById('etab-' + t);
        if (panel) panel.style.display = (t === tab) ? 'block' : 'none';
        if (btn) btn.classList.toggle('active', t === tab);
      });
    }

    function selectXYZCase(caseNum) {
      document.querySelectorAll('#caseBtn1, #caseBtn2, #caseBtn3').forEach((b, idx) => {
        if (idx === caseNum - 1) b.classList.add('active');
        else b.classList.remove('active');
      });

      const data = xyzCases[caseNum];
      document.getElementById('flowX').textContent = data.x;
      document.getElementById('flowY').textContent = data.y;
      
      const zBox = document.getElementById('stepZBox');
      const flowZ = document.getElementById('flowZ');
      const verdict = document.getElementById('flowVerdict');

      if (data.valid) {
        flowZ.textContent = data.z;
        flowZ.style.color = '#15803d';
        zBox.style.borderColor = 'var(--border-light)';
        zBox.style.background = '#ffffff';
        verdict.className = 'badge-success';
        verdict.innerHTML = `<i data-lucide="check-circle" style="width:15px;height:15px;"></i><span>${data.verdict}</span>`;
      } else {
        flowZ.textContent = " [¡SIN CAUSA ESTRUCTURAL!]";
        flowZ.style.color = '#dc2626';
        zBox.style.borderColor = 'var(--border-light)';
        zBox.style.background = '#ffffff';
        verdict.className = 'badge-alert';
        verdict.innerHTML = `<i data-lucide="alert-octagon" style="width:15px;height:15px;"></i><span>${data.verdict}</span>`;
      }
      lucide.createIcons();
    }

    // ================= SLIDE 4: Interactive Filter Chips =================
    function toggleConditionChip(type) {
      activeConditions[type] = !activeConditions[type];
      const chip = document.getElementById(`chip${type}`);
      if (activeConditions[type]) chip.classList.add('active');
      else chip.classList.remove('active');

      updateConditionState();
    }

    function updateConditionState() {
      let trades = 400;
      let conditions = 1;

      if (activeConditions.Monday) { trades *= 0.25; conditions++; }
      if (activeConditions.ATR) { trades *= 0.40; conditions++; }
      if (activeConditions.RSI) { trades *= 0.50; conditions++; }
      if (activeConditions.SPY) { trades *= 0.60; conditions++; }

      trades = Math.round(trades);

      document.getElementById('tradesCount').textContent = trades;
      document.getElementById('degreesCount').textContent = conditions;

      const badge = document.getElementById('sampleBadge');
      const text = document.getElementById('conditionWarningText');

      if (trades >= 200) {
        badge.className = 'badge-success';
        badge.style.background = 'transparent';
        badge.style.border = 'none';
        badge.style.color = '#15803d';
        badge.textContent = 'Muestra Robusta';
        text.innerHTML = ' Muestra suficiente para inferencia estadística inicial.';
        text.style.color = '#15803d';
      } else if (trades >= 60) {
        badge.className = 'badge-alert';
        badge.style.background = 'transparent';
        badge.style.border = 'none';
        badge.style.color = '#b45309';
        badge.textContent = 'Muestra Reducida (Cuidado)';
        text.innerHTML = ' Muestra en zona de riesgo. Mayor propensión a p-hacking.';
        text.style.color = '#b45309';
      } else {
        badge.className = 'badge-alert';
        badge.style.background = 'transparent';
        badge.style.border = 'none';
        badge.style.color = '#dc2626';
        badge.textContent = ' Ajuste Puro / Anécdota';
        text.innerHTML = ' <strong>¡Anécdota con Equity Curve!</strong> Muestra ínfima sin validez estadística.';
        text.style.color = '#dc2626';
      }

      if (conditionChartInstance) {
        const samplePoints = [400, 300, 180, 80, trades];
        conditionChartInstance.data.datasets[0].data = samplePoints.map((v, i) => Math.min(v, trades + i * 10));
        conditionChartInstance.update();
      }
    }

    // ================= SLIDE 6: Expectancy Simulator =================
    let currentExpOption = 2;
    function setExpectancyPreset(option) {
      currentExpOption = option;
      document.querySelectorAll('#cardExit1, #cardExit2, #cardExit3').forEach((r, idx) => {
        if (idx === option - 1) r.classList.add('selected');
        else r.classList.remove('selected');
      });
      runMonteCarlo(option);
    }

    function runMonteCarlo(selectedOption = currentExpOption) {
      let winRate = 0.32;
      let winSize = 3.0;
      let lossSize = 1.0;

      if (selectedOption === 1) { winRate = 0.55; winSize = 1.0; lossSize = 1.0; }
      else if (selectedOption === 3) { winRate = 0.38; winSize = 2.2; lossSize = 1.0; }

      let equity = [0];
      let current = 0;
      for (let i = 1; i <= 100; i++) {
        const isWin = Math.random() < winRate;
        current += isWin ? winSize : -lossSize;
        equity.push(Number(current.toFixed(2)));
      }

      if (expectancyChartInstance) {
        expectancyChartInstance.data.datasets[0].data = equity;
        expectancyChartInstance.data.datasets[0].label = `Equity Curve (${Math.round(winRate * 100)}% Win Rate)`;
        expectancyChartInstance.data.datasets[0].borderColor = (selectedOption === 2) ? '#2563eb' : (selectedOption === 1 ? '#64748b' : '#0ea5e9');
        expectancyChartInstance.update();
      }
    }

    // ================= SLIDE 7: Exit Types =================
    const exitData = [
      {
        title: "a) Salida por Tiempo (Holding Period)",
        quote: "Si tu señal predice algo, lo predice en un plazo. Un gap tiene una ventana; una noticia tiene una ventana. Nada predice para siempre.",
        bullets: [
          "<strong>Un solo parámetro:</strong> Casi imposible de sobreajustar.",
          "<strong>Te mide el edge desnudo:</strong> Sin stop ni target, el retorno a N barras es la verdadera esperanza matemática de la entrada.",
          "<strong>Test diagnóstico brutal:</strong> Si la estrategia no gana con salida pura por tiempo, el edge no estaba en la entrada, sino en una propiedad de la volatilidad del stop.",
          " <strong>Definición de sesiones:</strong> Define la sesión con una zona IANA y conviértela a UTC para cada fecha. Un offset fijo no representa correctamente los cambios de horario de verano."
        ]
      },
      {
        title: "b) Stop y Target (Puntos vs ATR)",
        quote: "Un stop de 30 pts con VIX 12 está lejísimos. El mismo stop con VIX 35 te saca por puro ruido.",
        bullets: [
          "<strong>ATR normaliza el régimen:</strong> 2 ATR significa lo mismo en 2018 que en 2024. Hace comparables los trades a través de los años.",
          "<strong>Trailing Stop:</strong> Sube el profit factor, pero baja el win rate. Solo sirve si los trades tienen recorrido de cola larga (medido con MFE).",
          " <strong>Ambigüedad Intrabar:</strong> Si una vela de 5m tocó tu Stop y tu Target, ¿cuál ocurrió primero? <code>backtesting.py</code> asume el pesimista; otras librerías asumen el optimista inflando los resultados."
        ]
      },
      {
        title: "c) Salida por Reversa (Stop & Reverse)",
        quote: "Siempre estás dentro del mercado. Cierras y abres en la dirección opuesta.",
        bullets: [
          "<strong>1. Sin stop duro:</strong> Un gap o movimiento vertical sin señal contraria puede liquidar la cuenta.",
          "<strong>2. Doble costo de comisiones & slippage:</strong> Cada reversa son dos órdenes consecutivas.",
          "<strong>3. Hueco de ejecución real:</strong> El backtest asume ejecución instantánea simultánea perfecta; en la realidad hay slippage severo.",
          "<strong>4. Dependencia de trayectoria (Path Dependence):</strong> El resultado final varía drásticamente según el orden exacto de los ticks."
        ]
      },
      {
        title: "d) Salida por Invalidación",
        quote: "Sales porque la razón de entrar dejó de existir, no porque el precio tocó una línea.",
        bullets: [
          "<strong>Ejemplo de uso:</strong> Entraste porque la volatilidad estaba en compresión; la volatilidad explota en contra → sales inmediatamente.",
          " <strong>Conceptualmente la más honesta y rigurosa.</strong>",
          " <strong>La más difícil de codificar:</strong> Requiere monitoreo en tiempo real del estado de mercado, por lo que casi ningún retail la implementa."
        ]
      }
    ];

    function selectExitType(idx) {
      document.querySelectorAll('#exitTab0, #exitTab1, #exitTab2, #exitTab3').forEach((el, i) => {
        if (i === idx) el.classList.add('selected');
        else el.classList.remove('selected');
      });
      renderExitDetail(idx);
    }

    function renderExitDetail(idx) {
      const item = exitData[idx];
      const box = document.getElementById('exitDetailBox');
      if (!box || !item) return;
      box.innerHTML = `
        <div>
          <h3 style="font-size:1.05rem; color:#0f172a; margin-bottom:4px; font-weight:700;">${item.title}</h3>
          <div class="quote-box" style="font-size:0.85rem; padding:8px 12px; margin:6px 0 8px 0;">"${item.quote}"</div>
          <ul style="padding-left:1.2rem; font-size:0.8rem; color:#334155; line-height:1.5;">
            ${item.bullets.map(b => `<li style="margin-bottom:4px;">${b}</li>`).join('')}
          </ul>
        </div>
      `;
    }

    // ================= SLIDE 9: Heatmaps Generator =================
    function initHeatmaps() {
      const peakGrid = document.getElementById('heatmapPeak');
      if (!peakGrid) return;
      peakGrid.innerHTML = '';
      for (let r = 0; r < 7; r++) {
        for (let c = 0; c < 7; c++) {
          const cell = document.createElement('div');
          cell.className = 'heatmap-cell';
          let val = (Math.random() * 0.3 + 0.1).toFixed(1);
          let bg = '#eff6ff';
          let color = '#1e3a8a';

          if (r === 3 && c === 3) {
            val = '1.4';
            bg = '#2563eb';
            color = '#ffffff';
            cell.style.border = '2px solid #09090b';
            cell.title = 'Pico Aislado (Sharpe 1.4) - ¡Sobreajuste!';
          } else {
            cell.title = `Sharpe: ${val} (Ruido circundante)`;
          }

          cell.style.background = bg;
          cell.style.color = color;
          cell.textContent = val;
          peakGrid.appendChild(cell);
        }
      }

      const plateauGrid = document.getElementById('heatmapPlateau');
      if (!plateauGrid) return;
      plateauGrid.innerHTML = '';
      for (let r = 0; r < 7; r++) {
        for (let c = 0; c < 7; c++) {
          const cell = document.createElement('div');
          cell.className = 'heatmap-cell';
          let val = (Math.random() * 0.2 + 0.85).toFixed(1);
          let bg = '#f0f9ff';
          let color = '#0369a1';

          if (r >= 2 && r <= 4 && c >= 2 && c <= 4) {
            val = (Math.random() * 0.15 + 0.95).toFixed(1);
            bg = '#0284c7';
            color = '#ffffff';
          }

          cell.style.background = bg;
          cell.style.color = color;
          cell.textContent = val;
          cell.title = `Sharpe: ${val} (Meseta robusta)`;
          plateauGrid.appendChild(cell);
        }
      }
    }

    // ================= Chart.js Setup (Minimal Light Theme) =================
    function initAllCharts() {
      // Condition Chart
      const condEl = document.getElementById('conditionChart');
      if (condEl) {
        const ctxCond = condEl.getContext('2d');
        conditionChartInstance = new Chart(ctxCond, {
          type: 'line',
          data: {
            labels: ['Base (400)', '+Lunes', '+ATR', '+RSI', '+SPY'],
            datasets: [{
              label: 'Muestra de Trades',
              data: [400, 100, 40, 20, 12],
              borderColor: '#2563eb',
              backgroundColor: 'rgba(37, 99, 235, 0.08)',
              fill: true,
              tension: 0.3
            }]
          },
          options: {
            responsive: true,
            maintainAspectRatio: false,
            plugins: { legend: { display: false } },
            scales: {
              x: { grid: { color: 'rgba(0,0,0,0.04)' }, ticks: { color: '#64748b', font: { size: 9 } } },
              y: { grid: { color: 'rgba(0,0,0,0.04)' }, ticks: { color: '#64748b', font: { size: 9 } }, min: 0, max: 450 }
            }
          }
        });
        updateConditionState();
      }

      // Expectancy Monte Carlo Chart
      const expEl = document.getElementById('expectancyChart');
      if (expEl) {
        const ctxExp = expEl.getContext('2d');
        expectancyChartInstance = new Chart(ctxExp, {
          type: 'line',
          data: {
            labels: Array.from({length: 101}, (_, i) => i),
            datasets: [{
              label: 'Equity (Target 3R, Win Rate 32%)',
              data: [],
              borderColor: '#2563eb',
              borderWidth: 2,
              pointRadius: 0,
              fill: false,
              tension: 0.2
            }]
          },
          options: {
            responsive: true,
            maintainAspectRatio: false,
            plugins: { legend: { display: false } },
            scales: {
              x: { grid: { color: 'rgba(0,0,0,0.04)' }, ticks: { color: '#64748b', font: { size: 9 } } },
              y: { grid: { color: 'rgba(0,0,0,0.04)' }, ticks: { color: '#64748b', font: { size: 9 } } }
            }
          }
        });
      }
      runMonteCarlo(2);

      // MAE Histogram Chart
      const maeEl = document.getElementById('maeChart');
      if (maeEl) {
        const ctxMae = maeEl.getContext('2d');
        maeChartInstance = new Chart(ctxMae, {
          type: 'bar',
          data: {
            labels: ['0.4', '0.8', '1.2', '1.4 (95%)', '1.8', '2.2', '2.6', '3.0 ATR'],
            datasets: [{
              label: 'Ganadores',
              data: [35, 45, 18, 5, 2, 1, 0, 0],
              backgroundColor: ['#c7d2fe', '#c7d2fe', '#c7d2fe', '#059669', '#fca5a5', '#fca5a5', '#fca5a5', '#fca5a5'],
              borderRadius: 4
            }]
          },
          options: {
            responsive: true,
            maintainAspectRatio: false,
            plugins: { legend: { display: false } },
            scales: {
              x: { grid: { display: false }, ticks: { color: '#64748b', font: { size: 9 } } },
              y: { grid: { color: 'rgba(0,0,0,0.04)' }, ticks: { color: '#64748b', font: { size: 9 } } }
            }
          }
        });
      }

      // Holding Period Chart
      const holdEl = document.getElementById('holdingChart');
      if (holdEl) {
        const ctxHold = holdEl.getContext('2d');
        holdingChartInstance = new Chart(ctxHold, {
          type: 'line',
          data: {
            labels: ['Barra 1', 'Barra 3', 'Barra 6 (Pico)', 'Barra 9', 'Barra 12', 'Barra 15'],
            datasets: [{
              label: 'Retorno Medio Acumulado',
              data: [0.3, 0.8, 1.45, 1.48, 1.42, 1.40],
              borderColor: '#2563eb',
              backgroundColor: 'rgba(37, 99, 235, 0.08)',
              fill: true,
              tension: 0.3
            }]
          },
          options: {
            responsive: true,
            maintainAspectRatio: false,
            plugins: { legend: { display: false } },
            scales: {
              x: { grid: { display: false }, ticks: { color: '#64748b', font: { size: 9 } } },
              y: { grid: { color: 'rgba(0,0,0,0.04)' }, ticks: { color: '#64748b', font: { size: 9 } } }
            }
          }
        });
      }
    }

    // ================= SLIDE AGENT FLOW: Simulador Didáctico de Interacción Agente =================
    const agentStepData = {
      1: {
        traderMsg: "«Un activo abrió con un gap fuerte y creo que seguirá subiendo. ¿Creamos un bot para comprar en la apertura?»",
        agentMsg: "«¡Cuidado! Un gap por sí solo no garantiza nada. Si compramos a ciegas, podemos quedar atrapados en un retroceso. Primero definamos la causa: ¿Por qué va a subir? ¿Qué volatilidad hay? Te propongo analizar 3 variantes antes de programar.»",
        lesson: "<strong>Clave:</strong> No pidas código de inmediato. El diálogo ilustra cómo formular una hipótesis; no garantiza evitar pérdidas ni encontrar una ventaja."
      },
      2: {
        traderMsg: "«De acuerdo. ¿Qué opciones me propones?»",
        agentMsg: "«Evaluando el mercado, te planteo 3 opciones claras:<br><br>• <strong>Variante A (Momentum):</strong> Comprar si la volatilidad es alta. Stop de 1.0x ATR y Objetivo de 1.5x ATR.<br>• <strong>Variante B (Tendencia):</strong> Igual que la A, pero confirmando que el precio esté sobre la EMA 200.<br>• <strong>Variante C (Reversión):</strong> Buscar el rebote contrario si el movimiento fue exagerado.<br><br>¿Cuál prefieres que programemos?»",
        lesson: "<strong>Clave:</strong> El agente estructura tu idea en opciones concretas con riesgo medido para que tú tomes la decisión final."
      },
      3: {
        traderMsg: "«Me gusta la Variante B. Vamos a programarla.»",
        agentMsg: "«La hipótesis ya tiene reglas explícitas. El siguiente paso es revisar el contrato, implementar las plataformas elegidas y compilar sus fuentes.<br><br>✔ Reglas identificadas.<br>✔ Barras y parámetros declarados.<br>○ Compilación y paridad requieren pruebas.»",
        lesson: "<strong>Código:</strong> El código se revisa cuando la lógica está clara, con equivalencia numérica pendiente de pruebas independientes."
      }
    };

    function showAgentStep(step) {
      [1, 2, 3].forEach(s => {
        const btn = document.getElementById(`agentStepBtn${s}`);
        if (btn) {
          if (s === step) btn.classList.add('active');
          else btn.classList.remove('active');
        }
      });

      const data = agentStepData[step];
      const chatBox = document.getElementById('agentChatContent');
      if (chatBox && data) {
        chatBox.innerHTML = `
          <div style="display: flex; flex-direction: column; gap: 10px;">
            <!-- Trader Message -->
            <div style="align-self: flex-start; max-width: 92%; background: #f4f4f5; padding: 10px 14px; border-radius: 6px; border: 1px solid var(--border-light);">
              <div style="font-family: var(--font-mono); font-size: 0.68rem; text-transform: uppercase; color: var(--text-muted); font-weight: 600; margin-bottom: 4px;">
                TRADER (USUARIO)
              </div>
              <div style="font-size: 0.84rem; color: #09090b; line-height: 1.45;">
                ${data.traderMsg}
              </div>
            </div>

            <!-- Agent Message -->
            <div style="align-self: flex-end; max-width: 92%; background: #ffffff; padding: 10px 14px; border-radius: 6px; border: 1px solid var(--border-light); border-left: 2px solid #09090b;">
              <div style="font-family: var(--font-mono); font-size: 0.68rem; text-transform: uppercase; color: var(--text-muted); font-weight: 600; margin-bottom: 4px; display: flex; justify-content: space-between;">
                <span>AGENTE CUANTITATIVO (QRT COPILOT)</span>
                <span style="color: #16a34a; font-weight: 700;">EJEMPLO</span>
              </div>
              <div style="font-size: 0.84rem; color: #09090b; line-height: 1.45;">
                ${data.agentMsg}
              </div>
            </div>

            <!-- Didactic Takeaway -->
            <div style="background: #f9fafb; padding: 8px 12px; border-radius: 4px; border: 1px solid var(--border-light); font-size: 0.78rem; color: #475569; line-height: 1.4;">
              ${data.lesson}
            </div>
          </div>
        `;
        lucide.createIcons();
      }
    }

    window.addEventListener('DOMContentLoaded', initPresentation);
