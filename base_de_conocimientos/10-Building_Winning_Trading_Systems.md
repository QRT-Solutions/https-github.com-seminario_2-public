Building Winning Trading Systems 
with TradeStation R©
Founded in 1807, John Wiley & Sons is the oldest independent publishing company in the United States. With offices in North America, Europe, Australia and Asia, Wiley is globally committed to developing and marketing print and electronic products and services for our customers’ professional and personal knowledge and understanding. 
The Wiley Trading series features books by traders who have survived the mar-ket’s ever changing temperament and have prospered—some by reinventing systems, others by getting back to basics. Whether a novice trader, professional or somewhere in-between, these books will provide the advice and strategies needed to prosper today and well into the future. 
For a list of available titles, please visit our Web site at www.WileyFinance.com.
Building Winning Trading Systems 
with TradeStation R© 
Second Edition 
GEORGE PRUITT JOHN R. HILL 
John Wiley & Sons, Inc.
Copyright C© 2012 by George Pruitt and John R. Hill. All rights reserved. 
Published by John Wiley & Sons, Inc., Hoboken, New Jersey. Published simultaneously in Canada. 
No part of this publication may be reproduced, stored in a retrieval system, or transmitted in any form or by any means, electronic, mechanical, photocopying, recording, scanning, or otherwise, except as permitted un-der Section 107 or 108 of the 1976 United States Copyright Act, without either the prior written permission of the Publisher, or authorization through payment of the appropriate per-copy fee to the Copyright Clearance Center, Inc., 222 Rosewood Drive, Danvers, MA 01923, (978) 750-8400, fax (978) 646-8600, or on the Web at www.copyright.com. Requests to the Publisher for permission should be addressed to the Permissions Depart-ment, John Wiley & Sons, Inc., 111 River Street, Hoboken, NJ 07030, (201) 748-6011, fax (201) 748-6008, or online at http://www.wiley.com/go/permissions. 
Limit of Liability/Disclaimer of Warranty: While the publisher and author have used their best efforts in prepar-ing this book, they make no representations or warranties with respect to the accuracy or completeness of the contents of this book and specifically disclaim any implied warranties of merchantability or fitness for a par-ticular purpose. No warranty may be created or extended by sales representatives or written sales materials. The advice and strategies contained herein may not be suitable for your situation. You should consult with a professional where appropriate. Neither the publisher nor author shall be liable for any loss of profit or any other commercial damages, including but not limited to special, incidental, consequential, or other damages. 
TradeStation R© and EasyLanguage R© are registered trademarks of TradeStation Technologies, Inc., an affiliate of TradeStation, the use of which has been licensed to TradeStation. 
For general information on our other products and services or for technical [[Support|support]], please contact our Cus-tomer Care Department within the United States at (800) 762-2974, outside the United States at (317) 572-3993 or fax (317) 572-4002. 
Wiley also publishes its books in a variety of electronic formats. Some content that appears in print may not be available in electronic books. For more information about Wiley products, visit our web site at www.wiley.com. 
Library of Congress Cataloging-in-Publication Data: 
Pruitt, George, 1967– Building winning trading systems with TradeStation [electronic resource] / George Pruitt and John R. Hill. – 
2nd ed. 1 online resource. – (Wiley trading series) 
Includes index. Description based on print version record and CIP data provided by publisher; resource not viewed. ISBN 978-1-118-26431-7 (mobipocket) – ISBN 978-1-118-23972-8 (epub) – ISBN 978-1-118-22643-8 (pdf) – 
ISBN 978-1-118-16827-1 (cloth) (print) 1. Investments–Data processing. 2. Stocks–Data processing. I. Hill, John R., 1926– II. Title. 
HG4515.95 332.64′2028553–dc23 
2012017829 
Printed in the United States of America 
10 9 8 7 6 5 4 3 2 1
I dedicate this book to all of the struggling traders; I hope it provides insight and 
guidance to their efforts. 
J. H. 
   
I dedicate this book to Mary, Cliff, Butch, and Marilyn for their eternal courage and 
[[Support|support]]. Even though they may not all still be with us, their memories carry on. I 
would also like to thank my successful and loving wife, Leslie, and my wonderful 
children, Brandon and Emily. 
G. P.
Contents 
Foreword xi 
Preface xvii 
Acknowledgments xix 
CHAPTER 1 Fundamentals—What Is EasyLanguage? 1 
Variables and Data Types 2 
Operators and Expressions 4 
TradeStation 2000i vs TradeStation 9.0 7 
Conclusions 32 
CHAPTER 2 EasyLanguage Program Structure 33 
Structured Programming 33 
Program Header 34 
Calculation Module: MyRSIsystem 35 
Conclusions 40 
CHAPTER 3 Program Control Structures 41 
Conditional Branching with If-Then 41 
Conditional Branching with If-Then-Else 45 
Repetitive Control Structures 50 
Conclusions 53 
CHAPTER 4 TradeStation Analysis Techniques 55 
Indicators 55 
PaintBar and ShowMe Studies 62 
Functions 68 
vii
viii CONTENTS 
Strategies 72 
Conclusions 77 
CHAPTER 5 Measuring Trading System Performance and System Optimization 79 
TradeStation’s Summary Report 80 
Trade Analysis 90 
Optimization Old School Style 95 
Conclusions 126 
CHAPTER 6 Trading Strategies That Work (or the Big Damn Chapter on Trading Strategies) 127 
The King Keltner Trading Strategy 128 
The Bollinger Bandit Trading Strategy 131 
The Thermostat Trading Strategy 134 
The Dynamic Break Out II Strategy 141 
The Super Combo [[Day Trading]] Strategy 147 
The Ghost Trader Trading Strategy 165 
The Money Manager Trading Strategy 168 
Bonus Trading Strategies 171 
Conclusions 174 
CHAPTER 7 Debugging and Output 175 
Logical versus Syntax Errors 176 
Debugging with the Print Statement and the Print Log 176 
Debugging with the Built-In Debugger 178 
Table Creator 184 
Conclusions 190 
CHAPTER 8 TradeStation as a Research Tool 191 
Commitment of Traders Report 191 
Conclusions 210 
CHAPTER 9 Using TradeStation’s Percent Change Charts to Track Relative Performance 211 
Working with Percent Change Charts 213 
Conclusions 217
Contents ix 
CHAPTER 10 Options: Introduction and Strategies 219 
Part A: Getting Started with Options Trading 219 
Part B: Real-Life Options Strategies and Trades 242 
Conclusions 250 
CHAPTER 11 Interviews with Developers 251 
APPENDIX A TradeStation 2000i Source Code of Select Programs 295 
Bollinger Bandit 295 
Dynamic Break Out II by George Pruitt 296 
DBS II Fade by George Pruitt 297 
King Keltner Program by George Pruitt 298 
MyAdxSys 299 
MyMomRsi 300 
MyMovAvgSys 301 
MyTrailPrcntStop 302 
Seasonal Soybean 303 
Super Combo by George Pruitt 304 
Thermostat by George Pruitt 307 
The Ghost Trader by George Pruitt 309 
The Money Manager by George Pruitt 311 
APPENDIX B Reserved Words Quick Reference 313 
About the Website 389 
Index 391
Foreword 
I t absolutely astounds me that someone who has become so important to me—both 
personally and professionally—was unknown to me just three years ago. I met George Pruitt in 2009, and even then, our first encounter was not in person, but elec-
tronic, through an exchange of emails—an omen of things to come. Ever since 2007, I have found the markets all-consuming, and trading, my greatest passion. I spent my first two years as a trader studying just two instruments and trading them solely on a dis-cretionary, shorter-term, day-trading basis. Eventually I was able to break into the small percentage of profitable traders. 
In 2009, I became fascinated with systems development, longer time frames, and the ability simultaneously to trade baskets of markets empirically. I was eager to assemble a circle of the most experienced advisors I could find to guide me in developing a sys-tematic approach to the market. The only things I knew about George Pruitt at the time I reached out to him were that he was highly respected in the world of futures trading and that he was the editor of the renowned Futures Truth magazine. To me this meant that he had gained the trust of the overall trading community and was intimately acquainted with practically every kind of system, method, and program that traders were constantly coming up with in the race to find a winning combination. As it happened, the reality of his skill surpassed anything my initial instincts told me. 
I still haven’t met John Hill personally. But I know John very well, at least in what is arguably the most important way. He is both the legendary systems trading pioneer and the founder of the Futures Truth Company. He is also George’s friend, coauthor, and mentor; and by the student ye shall know the teacher. That sounds like a quotation, and if it isn’t, it certainly should be. 
The first edition of How to Build Winning Trading Systems with TradeStationTM 
was already a success well before I met George or even knew about John. From the start, George seemed unusually generous in agreeing to take me on as my on-the-job trainer, a position that quickly evolved into mentor and then friend and then very good friend. I learned that not only did George know how to build a winning system, but he was equally capable of developing a winning systems trader. Two years later, when he told me that the book was going to give birth to a second edition, I practically begged George for a chance to write this foreword; I felt that I could shed great light on what it is like to learn from him, based on my personal experience with how he had enhanced and elevated my trading to levels I never could have imagined. 
xi
xii FOREWORD 
I won’t dwell here at too much length about the purely personal things I have learned about him, such as the fact that George lives on a mountaintop in North Carolina, or more accurately, that he lives about halfway up the mountain but embraces the lofty view of a mountaintop in all of his professional activities. Either way, the important point is that George balances his lofty view with the most practical, down-to-earth pragmatism that a successful trader would ever want to have working for him on a day-to-day, sink-or-swim basis. He virtually embodies the perfect blend of big picture and detail that is so elusive for most of us, a quality well illustrated in the following story. 
The Lone Ranger and Tonto were camping in the desert. The first night, they crawled into the tent they were sharing and went to sleep. A few hours later, Tonto poked the Lone Ranger awake and said to him: 
“Look up at the sky, Kemo Sabe. What do you see?” “I see millions of stars.” “And what does this tell you, Kemo Sabe?” The Lone Ranger pondered for a moment and then replied: “Astronomically speak-
ing, it tells me there are millions of galaxies and potentially billions of planets. Astrologi-cally, it tells me that Saturn is in Leo. Timewise, it appears to be approximately a quarter past three in the morning. Theologically, the Lord is all-powerful and we are small and insignificant. Meteorologically, it seems we will have a beautiful day tomorrow. But what does it tell you, Tonto?” 
“You think too much,” Tonto replied. “It tells me that someone stole the tent.” When I think of a teacher who best embodies the right blend of the macro and micro 
views, I can think of none better than George. His abundant spirit with paying all that he has been gifted forward and without constantly worrying about who might steal his tent is what makes him so remarkable. 
   
George Pruitt is a man of great integrity, outstanding for his many capabilities, both busi-ness and personal. He serves simultaneously as a research director, fund manager, pub-lished author, and magazine publisher. At the same time, his devotion to his family has him recurrently rushing off to a track meet to watch his children compete; to a social event with Leslie, his wife of many years, on his arm; or to a sickroom to lend a loving presence at the bedside of an ailing parent. And from the standpoint of one anxious new-comer struggling to put all of George into these words, hardly a day has gone by when he has not carved out enough time from his hectic schedule to exchange emails, lending his market wisdom and experience to help me acquire the skills I will need to survive in the world of systematic trading. On top of it all, he is an avid reader of literary classics and a student of history—two seemingly unrelated penchants that can be so important when analyzing markets that call for history as a teacher. 
Almost three years have gone by since George and I began our correspondence, which incidentally has turned into the most cherished part of my day. My circle of advi-sors has now grown robust and helpful, peopled by a variety of experts and tutors. But few have I found who are as objective and candid as George, who have his unique blend
Foreword xiii 
of technical genius and creative imagination, who can articulate abstruse points in sim-ple language to all manner of audiences, never showing impatience or speaking down to anyone, however silly the question or naı̈ve the questioner may be. 
I have found George to be as persistent in pursing his work and continuous develop-ment as the proverbial duck who walked into a bar one day and said to the bartender, “Do you have any grapes?” 
The bartender said, “No, we sell only liquor.” The next day the duck walked into the bar and asked the bartender, “Do you have 
any grapes?” The bartender said, “I already told you we sell only liquor. If you ask me again I’m 
going to nail your beak to the bar!” The next day the duck walked into the bar and asked the bartender, “Do you have 
any nails?” The bartender said, “No!” The duck said, “Do you have any grapes?” If every systems developer were as persistent as that duck, George would have plenty 
of company. But as it is, George is a bird of an entirely different feather, standing out for the tenacity with which he will pursue an idea through the twists and turns of research, testing, development, and into the real-time trading. 
   
Right from the start, George was very helpful in setting me straight about what to expect from systems. In my own isolated studies, I had found myself mired in the illusory claims of the purveyors of selective data and distorted claims that so abound in our industry. These were illusions that George was quick to dispel and I was happy to discard. He put a name to the doubts I had already developed and helped me understand the integral nuances and accidents that can happen at each phase of the development of a fledgling system. He taught me to recognize and avoid the many subtle treacheries with which the trader’s path abounds and which can wreak such havoc, even among the experienced minority. There are, after all, so many trappings and biases that exist, each of them re-quiring diligent awareness and seasoned knowledge, not to mention adroit skill, if one is to survive in this turbulent business called trading. 
Amid a chorus of opacities, George has been crystal clear in articulating these wisdoms, passing on the many points he inherited from his own mentor, John Hill— professionally my intellectual grandfather, so to speak. The one-two punch of George’s nature and John’s nurture have led me to new levels of understanding, awareness, and confidence as a systems trader. I wish the same to all readers of this book. 
As a matter of publishing categories, one could describe the book as a guide to build-ing successful trading systems; and this, of course, is the description under which it is being marketed. But it is many other things as well, not the least of which is a kind of encyclopedic litmus test for identifying the smoke and mirrors with which so much salesmanship is cloaked in the world of trading. 
Consider, for example, the tale of the penguin standing on an ice floe beside another penguin.
xiv FOREWORD 
“You look like you’re wearing a tuxedo,” the first penguin observed. The other penguin answered, “What makes you think I’m not?” The reader who can absorb this book will be one step further away from having to 
face the uncertainty of that confused penguin, stuck on that bobbing ice floe, pondering the response of his enigmatic neighbor. 
   
All that being said, the book itself tells exactly what its title proclaims: Building 
Winning Trading Systems with TradeStation R© is, in effect, a manual for designing and developing systems for trading using the TradeStation R© platform. It is abrim with lucid explanations, practical examples, interviews with leading systems developers and traders, EasyLanguage R© programming language, the essentials of programming, and sys-tems design tips. It covers such subjects as system performance, strategy optimization, coding, testing, debugging, and development research. 
That’s a lot of ground to cover, and covering it takes time. But it’s time especially well spent and phenomenally well rewarded, for the experienced trader and the neophyte alike. George Pruitt and John Hill form a relationship with their readers, moving from authors to gentle tutors and patient friends as the book progresses. 
There is yet another dimension to the value of this book. Futures Truth tracks al-most every system of technical analysis out there, almost as soon as it has appeared. In point of fact, this is one of the main functions of Futures Truth and a major reason for its following. One can really learn from people who know so much about so many systems, who have gained this knowledge from professional activities on which part of their livelihoods and much of their reputations depend, and who have the desire and the generosity to pass on this wealth of knowledge to all who are willing to make the effort of absorbing it. 
Throughout the three years of my daily correspondence with George, I have mar-veled at his straightforwardness, not to mention his accuracy. I simply cannot think of a single instance in which he ever stretched or manipulated the truth to suit his ego, even unintentionally—the common occupational hazard for those who teach complicated and controversial subjects, as George does. 
This is not to say that he is anything less than passionate in matters of trading sys-tems and their development. But he somehow manages to put aside his own passion with the scalpel of fastidious articulation and absolute clarity of meaning. He once jokingly re-marked to me that the greatest vacation anyone could ever give him would be to cast him away on a deserted island with his family, his computer, and a year’s supply of batteries. 
   
In the final analysis, the ultimate value of this book depends on the confidence the reader feels that the authors have given careful consideration to the accuracy and integrity of every detail, that the “how-to” descriptions are usable and practical, and that the
Foreword xv 
instructions are clear and correct. To this utility, even greater value accrues from the updated edition, which reflects the many changes in technology that have occurred since the first publication, as well as the ever-growing understanding of subject matter that the authors have experienced through their own personal and professional growth. 
These authors are experts by even the most rigorous definition, which requires an unswerving commitment to keep learning, growing, and sharing the fruits of their knowl-edge, on a daily basis, year after year, for as long as they remain active. And there is another criterion for true expertise—the ability to learn from their students, however vast the gulf of knowledge that separates them. It is my hope—and my faith—that after so many hours of correspondence, leading to so much learning and professional growth and confidence for me, I have somehow managed to repay some small portion of this endowment with a grain or two of experience to be added to what my teachers will henceforth teach. 
It is a sad truth that experts do sometimes get it wrong. But I have yet to detect George or John in anything like the following gaff. 
A man at a banquet found himself sitting next to a woman who looked very familiar. “Pardon me,” he said, “but is your name Emily?” “Yes, it is,” she replied. “Emily Post?” “Yes, I’m Emily Post.” “Emily Post the etiquette expert?” “Yes, that’s me. Do you have a question?” “As a matter of fact, I do. Why do you have my fork and why are you eating my salad?” Not you, George. Never you. Never John. However long or difficult the road, you 
know how to recognize the right fork when you see it! 
MICHAEL RUSSAK 
New York City 
December 2011
Preface 
M any things have changed in the trading industry since we wrote the first edi-
tion of Building Winning Trading Systems with TradeStation in 2002. The pit sessions of most futures markets have all but disappeared and their electronic 
counterparts have made trading much more efficient. Traders are now plugged into the information superhighway and want instantaneous gratification 24 hours a day. Trading systems are even more of an absolute necessity in today’s trading environment; and the tools used to design, optimize, and implement them have evolved at nearly the same pace as the markets. The most popular and powerful platform, TradeStation, has kept pace with technology and has moved from version 6.0 in 2002 to 9.0 in 2011. In 2002, TradeStation was a pioneer in providing data, testing, implementation, and execution in one tidy package. Since then the landscape has become more populated with similar all-in-one software/data platforms; however, since TS has had such a huge head start and cultivated an enormous user base, it is still, in our opinion, head and shoulders above its competitors. 
The primary objective of the first edition of Building Winning Trading Systems 
with TradeStation was to teach its readers how to effectively code their trading ideas into TradeStation’s EasyLanguage, and this will carry on in this edition. Fortunately, thanks to TradeStation engineers, TS users have not been required to learn very much in the way of new language syntax throughout the software’s developmental cycle. This isn’t to say things haven’t changed at all. There have been sufficient additions to EasyLanguage’s library of functions and to TS’s available data universe, and beginning with version 8.8, a much improved Integrated Development Environment, to merit the writing of a second edition. 
The framework of the first edition was modeled after a college-level textbook that was used to teach the Pascal programming language, and this framework will be followed again. However, some concepts will be more elaborated upon and additional examples will be added this time through. Also, the original chapter describing self-contained trad-ing systems will include updated performance results of those systems and will introduce some new trading ideas and systems. 
The way we trade and the tools we use to effect our trading have changed over the past nine years, but the market principles, indicators, and robust trading systems have more or less stayed the same. Let’s see if we can use the latest iteration of TradeStation and EasyLanguage to uncover some of these time-tested nuggets of knowledge. 
xvii
Acknowledgments 
W e would like to thank TradeStation Securities, OptionVue software, and Jan 
Arps and Len Yates for their contributions. Joe Bobek was also instrumental in running many of the computer simulations. 
xix
C H A P T E R 1 
Fundamentals—What Is EasyLanguage? 
W hen you code (slang for writing your ideas into a programming language) an 
analysis technique, you are directing the computer to follow your instructions to the T. A computer program is nothing but a list of instructions. A computer is 
obedient and speedy, but it is only as smart as its programmer. In addition, the computer requires that its instructions be in an exact format. A programmer must follow certain syntax rules. 
EasyLanguage is the medium used by traders to convert a trading idea into a form that a computer can understand. Fortunately for nonprogrammers, EasyLanguage is a high-level language; it looks like the written English language. It is a compiled language; programs are converted to computer code when the programmer deems it necessary. The compiler then checks for syntactical correctness and translates your source code into a program that the computer can understand. If there is a problem, the compiler alerts the programmer and sometimes offers advice on how to fix it. This is different from a translated language, which evaluates every line as it is typed. 
All computer languages, including EasyLanguage, have several things in common. They all have: 
 Reserved words. Words that the computer language has set aside for a specific pur-pose. You can use these words only for their predefined purposes. Using these words for any other purpose may cause severe problems. (See the list of reserved words in Appendix B.) 
 Remarks. Words or statements that are completely ignored by the compiler. Remarks are placed in code to help the programmer, or other people who may reuse the code, understand what the program is designed to do. EasyLanguage also utilizes skip 
words. These words are included in a statement to make the programming easier to read. For example, Buy on next bar at myPrice stop is the same as Buy next 
1
2 BUILDING WINNING TRADING SYSTEMS WITH TRADESTATION 
bar myPrice stop. The words “on” and “at” are completely ignored. (See the list of skip words in Appendix B.) 
 Variables. User-defined words or letters that are used to store information.  Data types. Different types of storage; variables are defined by their data types. 
EasyLanguage has three basic data types: Numeric, Boolean, and String. A variable that is assigned a numeric value, or stored as a number, would be of the Numeric type. A variable that stores a true or false value would be of the Boolean type. Finally, a variable that stores a list of characters would be of the String type. 
VARIABLES AND DATA TYPES 
Programmers must understand how to use variables and their associated data types be-fore they can program anything productive. Let’s take a look at a snippet of code. 
mySum = 4 + 5 + 6; 
myAvg = MySum/3; 
The variables in this code are mySum and myAvg and they are of the Numeric data type; they are storage places for numbers. EasyLanguage is liberal concerning variable names, but there are a few requirements. A variable name cannot 
 Start with a number or a period (.)  Be a number  Be more than 20 alphanumeric characters long  Include punctuation other than the period (.) or underscore ( ) 
Correct Incorrect 
myAvg 1MyAvg mySum .sum sum val+11 val1 the//sum the.sum my?sum my val 1234 
Variable naming is up to the style of the individual programmer. EasyLanguage is not case sensitive (you can use uppercase or lowercase letters in the variable names). (Note: This is our preference—it may not be everybody’s.) Lowercase letters are preferred for names that contain only one syllable. For variable names that have more than one sylla-ble, we begin the name with a lowercase letter and then capitalize the beginning of each subsequent syllable. 
sum, avg, total, totalSum, myAvg, avgValue, totalUpSum, totDnAvg 
Still referring to the previous snippet of code, mySum is assigned the value of 15 and myAvg is assigned the value of 15/3, or 5. If a variable name is created, it must be
Fundamentals—What Is EasyLanguage? 3 
declared ahead of time. The declaration statement defines the initial value and data type of the variable. The compiler needs to know how much space to reserve in memory for all variables. The following code is a complete EasyLanguage program. (Note: Most of the code that you will see in this book will be particular to EasyLanguage and will probably not work in any other language.) 
Vars: mySum(0),myAvg(0); 
mySum = High + Low + Close; 
myAvg = mySum/3; 
The Vars: (or Variables:) statement tells the computer what variables are being declared and initialized. We declare the variables by simply listing them in the Vars state-ment, and we initialize them by placing an initial value in parentheses following the vari-able name. In this case, mySum and myAvg are to be equal to zero. EasyLanguage is smart enough to realize that these variables should be of the Numeric data type, since we initialized them with numbers. Variable names should be self-descriptive and long enough to be meaningful. Which of the following is more self-explanatory? 
mySum = High+Low+Close; or k = High + Low + Close; 
myAvg = mySum/3; or j = k/3; 
BuyPt = Close + myAvg; or l = Close+j; 
Variables of Boolean and String types are declared in a similar fashion. 
Vars: myCondition(false),myString("abcdefgh"); 
The variable myCondition was initialized to false. The word “false” is a reserved word that has the value of zero. This word cannot be used for any other purpose. The variable myString was initialized to “abcdefgh.” Sometimes you will need to use a vari-able for temporary purposes, and it is difficult to declare and initialize all of your vari-ables ahead of time. In the case of a temporary variable (one that holds a value for a short period of time), EasyLanguage has declared and initialized several variables for your use; value0 through value99 have been predefined and initialized to zero and are ready for usage in your programs. The following is a complete EasyLanguage program: 
value1 = High + Low + Close; 
value2 = (High + Low)/2.0; 
Notice there isn’t a Vars statement. Since value1 and value2 are predefined, the statement isn’t needed. You have probably noticed the semicolon (;) at the end of each line of code. The semicolon tells the compiler that we are done with this particular in-struction. In programming jargon, instructions are known as statements. Statements are made up of expressions, which are made up of constants, variables, operators, functions, and parentheses. Some languages need a termination symbol and others do not. EasyLan-guage needs the statement termination symbol. Remember to put a semicolon at the end of each line to prevent a syntax error.
4 BUILDING WINNING TRADING SYSTEMS WITH TRADESTATION 
Inputs are similar to variables. They follow the same naming protocol and are de-clared and initialized. However, an input remains constant throughout an analysis tech-nique. An input cannot start a statement (a line of instruction) and cannot be modified within the body of the code. One of the main reasons for using inputs is that you can change input values of applied analysis techniques without having to edit the actual EasyLanguage code. Inputs would be perfect for a [[Moving Average|moving average]] indicator. When you plot this indicator on a chart, you simply type the length of the [[Moving Average|moving average]] into the Input box of the dialog box. You don’t want to have to go back to the [[Moving Average|moving average]] source code and change it and then verify it. Also, when used in trading strategies, inputs allow you to optimize your strategies. This is discussed in Chapter 5. 
Notice how inputs and variables are declared in similar style. 
Inputs: length1(10),length2(20),flag(false); 
Vars: myLength1(10),myAvgVal(30); 
However, notice how they are used differently in coding. 
Variables 
myLength1 = myAvgVal + myLength1; {Correct} 
Inputs 
length1 = myAvgVal + length1; {Incorrect} 
myLength1 = length1*2; {Correct} 
Variables can start a statement and can be assigned another value. Since inputs are constants and cannot be assigned new values, they cannot start a statement. 
In a strongly typed language, such as C, Pascal, or C++, if you assign a real value such as 3.1456 to an integer typed variable, the decimal portion is truncated and you end up with the number 3. As we all know, precision is important when it comes to trading, so EasyLanguage includes only one Numeric type. All numbers are stored with a whole and a fractional part. In the old days, when CPUs were slow, noninteger arithmetic took too much time and it was advised to use integer variables whenever possible. 
OPERATORS AND EXPRESSIONS 
Previously, we discussed statements and how they are made up of expressions. To re-view, an expression consists of a combination of identifiers, functions, variables, and values, which result in a specific value. Operators are a form of built-in functions and come in two forms: unary and binary. A binary operator requires two operands, whereas a unary operator requires only one. Most of your dealings with operators in EasyLan-guage will be of the binary variety. Some of the more popular ones are: + − / ∗ < = > 
>= <= <> AND OR. These binary operators can be further classified into two more categories: arithmetic and logical.
Fundamentals—What Is EasyLanguage? 5 
Expressions come in three forms: arithmetic, logical, and string. The type of opera-tor used determines the type of expression. An arithmetic expression includes + – / ∗, whereas a logical or Boolean expression includes < = > >= <= <> AND OR. 
Arithmetic Expressions Logical Expressions 
myValue = myValue + 1; myCondition1 = sum > total; 
myValue = sum - total; myCondition1 = sum <> total; 
myResult = sum*total+20; cond1 = cond1 AND cond2 
Arithmetic expressions always result in a number, and logical expressions always result in true or false. True is equivalent to 1, and False is equivalent to 0. String expres-sions deal with a string of characters. You can assign string values to string variables and compare them. 
myName1 = "George Pruitt"; 
myName2 = "John Hill"; 
cond1 = (myName1 <> myName2); 
myName3 = myName1 + " " + myName2; 
Concatenation occurs when two or more strings are added together. Basically, you create one new string from the two that are being added together. 
Precedence of Operators 
It is important to understand the concept of precedence of operators. When more than one operator is in an expression, the operator with the higher precedence is evaluated first, and so on. This order of evaluation can be modified with the use of parentheses. EasyLanguage’s order of precedence is as follows: 
1. Parentheses 
2. Multiplication or division 
3. Addition or subtraction 
4. <, >, =, <=, >=, <> 
5. AND 
6. OR 
Here are some expressions and their results: 
1. 20 - 15/5 equals 17 not 1 
20 - 3 division first, then subtraction 
2. 10 + 8/2 equals 14 not 9 
10 + 4 division first, then addition
6 BUILDING WINNING TRADING SYSTEMS WITH TRADESTATION 
3. 5 * 4/2 equals 10 
20/2 division and multiplication are equal 
4. (20 - 15)/5 does equal 1 
5/5 parentheses overrides order 
5. (10 + 8)/2 equals 9 
18/2 parentheses overrides order 
6. 6 + 2 > 3 true 
8 > 3 
7. 2 > 1 + 10 false 
2 < 11 
8. 2 + 2/2 * 6 equals 8 not 18 
2 + 1 * 6 division first 
2 + 6 then multiplication 
8 then addition 
These examples have all the elements of an arithmetic expression—numeric val-ues and operators—but they are not complete EasyLanguage statements. An expression must be part of either an assignment statement—myValue = mySum + myTot—or a logical statement—cond1 = cond2 OR cond3. 
The overall purpose of EasyLanguage is to translate an idea and perform an analysis on a price data series over a specific time period. A price chart consists of bars built from historical price data. Each individual bar is a graphical representation of the range of prices over a certain period of time. A 5-minute bar would have the opening, high, low, and closing prices of an instrument over a five-minute time frame. A daily bar would graph the range of prices over a daily interval. Bar charts are most often graphed in an Open, High, Low, and Close format. Sometimes the opening price is left off. A [[Candlestick|candlestick]] chart represents the same data but in a different format. It provides an easier way to see the relationship between the opening and closing prices of a bar chart. Other bar data such as the date and time of the bar’s close, volume, and open interest is also available for each bar. Since EasyLanguage works hand-in-hand with the charts that are created by TradeStation, there are many built-in reserved words to interface with the data. These reserved words were derived from commonly used verbiage in the trading industry. You can interface with the data by using the following reserved words. (Note: Each word has an abbreviation that can be used as a substitute.) 
Reserved Word Abbreviation Description 
Date D Date of the close of the bar. Time T Time of the close of the bar. Open O Open price of the bar. High H High price of the bar. Low L Low price of the bar. Close C Close price of the bar. Volume V Number of contracts/shares traded. OpenInt OI Number of outstanding contracts.
Fundamentals—What Is EasyLanguage? 7 
If you wanted to determine that the closing price of a particular instrument was greater than its opening price, you would simply type “Close > Open,” or “C > O.” The beauty of EasyLanguage is its ability to have all of the data of an instrument at your fingertips. The reserved words that we use to access the different prices of the current bar are also used to access historical data. You do this by adding an index to the reserved word. The closing price of yesterday would be: Close [1]. The closing price two days ago would be: Close [2], and so on. The number inside the bracket determines the number of bars to look back. The larger the number, the further you go back in history. If you wanted to compare today’s closing price with the closing price 10 days prior, you would type “Close > Close[10].” 
Before we move on, we should discuss how TradeStation stores dates and times. January 1, 2001, is stored as 1010101 instead of 20010101 or 010101. When the millennium changed, instead of incorporating the century into the date, TradeStation simply added a single digit to the year. The day after 991231 was 1000101 according to TradeStation. Time is stored as military time. For example, one o’clock in the afternoon is 1300 and one o’clock in the morning is 100. 
After that brief introduction to the world of programming, let’s go ahead and set up and program a complete trading strategy. The EasyLanguage Editor is where all of the magic takes place. This is your interface between your ideas and their applications. Your entire coding takes place here, and a thorough understanding of this editor will reduce headaches and increase productivity. In the older TradeStations 4.0 and 2000i, and now in versions greater than 8.8, the PowerEditor (a.k.a. TradeStation Development Environment) is basically a stand-alone application; it is an independent program and can be run with or without TradeStation. In versions 6.0 through 8.7, the PowerEditor is more of a component program; it runs within the confines of TradeStation. 
TRADESTATION 2000I VS TRADESTATION 9.0 
As of the original writing of this book in 2002, there were two versions of TradeStation being used: 2000i and 6.0. At this time there are basically three versions available (2000i, 8.x, and 9.0), but by the time this book is published there may be just two. TradeSta-tion 2000i is no longer supported, and the majority of users have migrated to the later versions, but there are still some holdouts. In some countries where data is not readily available via an Internet connection, 2000i is still being used. For this reason, the remain-der of this chapter will be broken into two main sections: 2000i and version 9.0. (Beyond this chapter, however, we will include the EasyLanguage code for 2000i in Appendix A. We will concentrate on version 9.0 in the remaining chapters, as it is the latest itera-tion.) TradeStation 9.0 is TradeStation Group’s (formerly known as Omega Research) current all-inclusive trading tool. Everything that you need to design, test, monitor, and execute an analysis technique is in one slick and complete package. TradeStation Group
8 BUILDING WINNING TRADING SYSTEMS WITH TRADESTATION 
and TradeStation Securities are now software/brokerage companies, and equities and futures trades can be executed through direct access with TradeStation. 
TradeStation 2000i 
PowerEditor Once this program is up and running, go under the File menu and select New. A dialog box titled New will open. If the General tab is not selected, go ahead and select it. Your screen should look like Figure 1.1. 
Once your screen looks like Figure 1.1, select the icon with the title Signal and click OK. We will ignore the other tabs in this dialog box at the moment. Another dialog box titled Create a New Signal will open and ask for a name and notes about the signal that you are creating. In the Name field go ahead and type “MySignal-1” and in the Notes field type “Donchian Break Out” and then click OK. A window titled MySignal-1 should open. This is your clean sheet of paper on which to type your wonderful ideas. Before we do some coding, let’s briefly take a look at some of the menus. Table 1.1 details the selections that are available under the File menu. Table 1.2 details the selections under the Edit menu. Table 1.3 details the selections under the View menu. Table 1.4 details the selections under the Tools menu. 
FIGURE 1.1 New Dialog—TradeStation 2000i
Fundamentals—What Is EasyLanguage? 9 
TABLE 1.1 File Menu 
Menu Item Action 
New Creates a new blank analysis technique. Open Opens an existing analysis technique. Close Pretty straightforward. Save Saves the current analysis technique. Save As Allows renaming of the current analysis technique. Save As Template Saves the current analysis technique as a template for future use. Save All Saves all currently open analysis techniques. Import and Export Imports existing analysis techniques from other sources or exports 
analysis techniques to other sources. Protect Password protects the analysis technique. Verify Verifies the analysis technique. Checks for syntax errors in code. Verify All Verifies all functions and analysis techniques. Properties Shows the Name and Notes of the analysis technique. Allows the user 
to change these. Page Setup Allows changing of the page setup. Print Prints the code. Print Preview Shows what will be printed. Exit Exits out of PowerEditor. 
TABLE 1.2 Edit Menu 
Menu Item Action 
Undo Undoes the last action. Redo Redoes the last action. Cut Cuts the selected text. Copy Copies the selected text. Paste Pastes the selected text. Clear Clears the selected text. Select All Selects all text in the analysis technique. Find Finds a specific string of text. Find Next Finds the next occurrence of the specified string of text. Find in Files Powerful multifile search tool. Replace Replaces a string of text with another string of text. 
TABLE 1.3 View Menu 
Menu Item Action 
Toolbars Customizes the tool bars. Status Bar Hides/shows the Status bar. Output Bar Hides/shows the Output bar. This little window will 
become very important when we start debugging. Bookmarks Adds a marker to a line of code so that you can 
quickly move between marked lines. Font Sets the PowerEditor’s font. Options Displays options for the PowerEditor.
10 BUILDING WINNING TRADING SYSTEMS WITH TRADESTATION 
TABLE 1.4 Tool Menus 
Menu Item Action 
EasyLanguage Dictionary Inserts EasyLanguage components into an analysis technique. Errors Window Options Change the look of the Errors window. Find In Files Window Options Change the look of the Find In Files window. Debug Window Change the attributes of the Debug window. 
A Simple Program Now that we are familiar with the menus and their functions, let’s go ahead and code a simple program. We don’t need to know everything about the selections in the menus to start coding. Jump in headfirst and type the following text exactly as you see it here: 
Inputs: longLength(40), shortLength(40); 
Buy tomorrow at Highest(High,longLength) stop; 
Sell tomorrow at Lowest(Low,shortLength) stop; 
(Note: For those of you who may be moving to TradeStation 9.0, you must type “Sell Short” to initiate a short position.) 
After you have typed this, go under the File menu and select Verify or hit the F3 key. Many of the commands in the menus have keyboard equivalents or shortcuts. You can determine the shortcuts by selecting the menu and then the menu item. (The keyboard shortcut is listed to the far right of the menu item.) If you look at the Verify menu item on the File menu, you will see F3. You should get a small dialog box that first says “Verifying” and then “Excellent.” If you get an error, simply check your code for any typos and verify again. Congratulations, you have just written an analysis technique in the form of a signal! Now let’s break down each line of code so that we can fully understand what is going on. 
Inputs: longLength(40), shortLength(40); 
By typing this line you have created two constant variables of the numeric data type. These two variables, longLength and shortLength, have been initiated with the value of 40. These variables cannot be changed anywhere in the body of the analysis technique. They can be changed only from the user interface of this signal or in the program heading. This will be discussed later in this chapter. 
Buy tomorrow at Highest(High,longLength) stop; 
This line instructs the computer to place a buy stop tomorrow at the highest high of the last 40 days. Highest is a function call. Functions are subprograms that are designed for a specific purpose and return a specific value. To communicate with a function, you must give it the information it needs. An automatic teller machine is like a function;
Fundamentals—What Is EasyLanguage? 11 
you must give it your PIN before it will give you any money. In the case of the Highest function, it needs two bits of information: what to look at and how far to look back. We are instructing this function to look at the highs of the last 40 bars and return the highest of those highs. For now, just accept that High means high prices and Low means low prices. (This is yet another subject that will be touched on later.) When an order is instructed through EasyLanguage, you must tell the computer the type of order. In this case, we are using a stop order. Orders that are accepted by EasyLanguage are: 
 Stop. Requires a price and is placed above the market to buy and below the market to sell. 
 Limit. Requires a price and is placed below the market to buy and above the market to sell. 
 Market. Buys/sells at the current market price. 
So, if the market trades at a level that is equal to or greater than the highest high of the past 40 days, the signal would enter long at the stop price. 
Sell tomorrow at Lowest(Low,shortLength) stop; 
The instructions for entering a short position are simply the opposite for entering a long position. 
TradeStation StrategyBuilder Now let’s create a trading strategy with our sim-ple Donchian Break Out signal. The StrategyBuilder is a program that asks all of the pertinent information concerning a trading strategy. It helps to organize all of the dif-ferent trading ideas and makes sure all of the parameters are set before the signal is evaluated. Under the Go menu, select TradeStation StrategyBuilder. A dialog box titled TradeStation StrategyBuilder should open and look similar to Figure 1.2. 
Click on the New button. Another dialog box opens and asks for a name and notes for this strategy. In the Name field type “MyStrategy-1,” and in the Notes field type “A simple Donchian Break Out.” After typing the information into these fields, click the Next button. The next dialog box asks for the signal to be used in this strategy. Click on the Add button. The next dialog box should look similar to Figure 1.3. 
Scroll up/down and find MySignal-1. You will notice that the boxes under the Long Entry and Short Entry column headings are checked, but the boxes underneath the Long Exit and Short Exit are not. This tells us that the system only enters the market; it is never flat—the system is either long or short. Long positions are liquidated when a short position is initiated, and vice versa. Our simple Donchian Break Out is a pure stop-and-reverse system. Select MySignal-1 and click on the OK button. Click the Next button, and a dialog box like the one in Figure 1.4 will open. 
This dialog is informing us that there are two input variables for our signal. You can change the inputs now, but let’s wait until later. If you did want to change the input values, you would simply select the Name of the input and edit the Value. Right now,
12 BUILDING WINNING TRADING SYSTEMS WITH TRADESTATION 
FIGURE 1.2 TradeStation 2000i—StrategyBuilder 
FIGURE 1.3 TradeStation StrategyBuilder—Add
Fundamentals—What Is EasyLanguage? 13 
FIGURE 1.4 TradeStation StrategyBuilder—Input Values 
simply click the Next button. The Pyramiding dialog box opens and asks if you would like to add positions in the same direction. Adding positions in the same direction occurs when our entry logic issues another buy signal and we are already long. We know that we will buy at the highest high of the past 40 days. This dialog is asking if we would like to continue adding positions at each subsequent 40-day high. If the market is trending, a new 40-day high could be made several times in succession. In this book, we will almost always take only one position per trade signal. 
Click on the Next button. The Position Information dialog now opens and asks for the maximum number of open entries per position and the maximum number of contracts/shares per position. Maximum number of open entries per position limits the number of positions you can add as a result of pyramiding. Maximum number of con-tracts/shares per position limits the number of total contracts/shares that can be put on per position. The dialog box also asks if you would like it to send a notification to the Tracking Center when our strategy generates a new order. For now, let’s accept the de-fault values for the first two fields and make sure the box asking to send a notification to the Tracking Center is checked, and then click Next. 
The Data Referencing dialog opens and asks for the maximum number of bars the study will reference. Our strategy needs only 40 days of data to generate a signal.
14 BUILDING WINNING TRADING SYSTEMS WITH TRADESTATION 
Remember, we are looking back 40 days to find the highest high and lowest low. Always keep in mind how much data the strategy that you are working on requires and make sure that you tell the computer, via this dialog box, that number. Make sure there is 40 or more in the field and click Finish. Congratulations again! You have just created your first strategy. Seems like a lot of work, doesn’t it? TradeStation is just making sure that all the parameters are correct before testing a signal. Most of the time, these parameters don’t change and you can simply click Next, Next, Next, Next, and finally, Finish without paying much attention. Okay, now let’s apply our strategy. This book assumes the reader knows how to create daily and intraday charts in TradeStation. Create a daily bar chart of a continuous Japanese Yen contract going back 500 days. When this chart has been plotted, go under the Insert menu and select Strategy. A dialog box titled Insert Analy-
sis Technique should open. Click on the Strategy tab and select MyStrategy-1 from the list of available strategies and click on OK. Another dialog box titled Format Strategy: 
MyStrategy-1 appears. Click on the Inputs tab, and you will see the two inputs that we have coded in our Donchian Break Out signal. By using the following line in our code, we have given the user of the strategy, be it ourselves or someone else, the ability to change the longLength and shortLength inputs of MySignal-1. 
Inputs: longLength(40), shortLength(40); 
You do not need to change the code to change the system from a 40- to a 50-day Donchian Break Out strategy. These inputs can be edited at any time—before the analysis technique is inserted or after. You will notice that the values of these inputs default to those values that we had initiated when we programmed the signal in the PowerEditor. If you change these inputs from this dialog, they do not permanently change; they will only change during this session. If you want to change the inputs permanently, then change the value and click on the Set Default button. If you do change these inputs, always make sure you change the maximum number of bars the analysis technique will reference parameter. You can do this by selecting the Properties tab in our dialog box and changing the parameter. Let’s take a look at the Properties dialog. Click on the Properties tab. Your dialog window should change and look like the one in Figure 1.5. 
This dialog box allows the user to observe and change the current properties for MyStrategy-1. We initialized these properties when we first created the Strategy with the StrategyBuilder. You should be familiar with all of the property parameters except for the back-testing resolution. TradeStation enables you to specify the resolution or data compression to use for back-testing your trading strategy. When you create a chart using data that has already been collected, TradeStation must make certain assumptions about price movement. If you are back-testing on daily bars, TradeStation does not know when the high or the low of the day was made. In some strategies, this information may be important. TradeStation calculates the chronological order of the high and low by using a formula. This formula is not always accurate and may lead to inaccuracies. (This concept will be discussed in further depth in Chapter 6, but for right now, let’s ignore this option.) Click on the Costs tab and you will be presented with the Commission and
Fundamentals—What Is EasyLanguage? 15 
FIGURE 1.5 Format Strategy—TradeStation 2000i 
Slippage $ values deducted for each trade. We all know what a commission is. Slippage is the dollar value expected when the actual fill price minus the calculated fill price is calculated on each trade. Slippage is either positive or negative; it is positive when you get in at a better price and negative when you get in at a worse price. Most of the time, slippage is negative. These costs can be charged on a per-contract/share basis or on a per-transaction basis. If you trade 300 shares of AOL, you can have TradeStation charge a commission/slippage on each share or for the entire trade. In addition, you will see the number of contracts/shares your strategy will assume with each new trade signal. If you select Fixed Unit, then this will be the fixed number of contracts/shares that will be traded throughout a historic back-test. If you choose Dollars per Transaction and type in a value in the associated text box, the number of shares or contracts will be calculated by dividing the input amount by the price of the stock or by the margin of the futures contract. Go ahead and accept all of the default values by clicking the OK button.
16 BUILDING WINNING TRADING SYSTEMS WITH TRADESTATION 
FIGURE 1.6 Tracking Center—TradeStation 2000i 
Since MyStrategy-1 is a pure stop-and-reverse system, you will probably get a New 
Open Position dialog box that states that the market position has changed for JY. Let’s close this dialog box by clicking on the Close button. When this dialog window disappears, there should be one underneath it titled New Active Order. This dialog box lets you know that an order needs to be placed today. It will either say “Buy 1 at a certain price stop” or “Sell 1 at a certain price stop.” We need to learn more about the Tracking Center, so click on the Go to Tracking Center button. You may get another dialog box that states “No Open Tracking Center windows were found. Would you like to create one?” Go ahead and click Yes. Your Tracking Center should look similar to one in Figure 1.6. 
Click on the Open Positions tab and you will see the symbol we are currently testing, current position, entry price, entry time, open profit, and various other statistics. Click on the Active Orders tab and you should see an LE (Long Entry) order to Buy 1 at a certain price stop and an SX (Short Exit) order to Sell 1 at a certain price stop, if you are currently short. 
If you are currently long, you would see an SE (Short Entry) order to Sell 1 at a certain price stop and an LX (Long Exit) order to Buy 1 at a certain price stop. In real-life order placement, you would simply place a single order to Buy/Sell 2 at whatever price was issued on a stop. Reduce this window and the chart of the Japanese Yen with buy and sell signals should now be the only window on the screen. If you like, you can go under the View menu and select Strategy Performance Report and look at how well the system performed over the test period. We will go much further in detail concerning the reports that TradeStation creates for the analysis of trading strategies in Chapter 5.
Fundamentals—What Is EasyLanguage? 17 
TradeStation 9.0 
TradeStation Development Environment Since the TradeStation Development Environment can run independent of TradeStation 9.0, you can launch it by finding it under the Start menu or double clicking its icon. This is helpful sometimes when you simply want to modify some code or start a new strategy or analysis technique and don’t need to see the results of your work. However, if you do want to see the results of your coding instantaneously, then you should have both running. Let’s do the latter and launch TradeStation 9.0. For this exercise let’s go ahead and log on by typing in your User Name and Password. Your screen should look somewhat similar to Figure 1.7. 
The TradeStation Development Environment, TDE for short, can also be accessed through the useful Shortcut bar. If your screen doesn’t show the Shortcut bar (labeled Tools), go under the View menu and make sure the Shortcut bar is checked. Once the bar is open, click on the EasyLanguage button. The TDE should launch momentarily. Once the TDE is up and running, select New from the File menu. A new submenu similar to the one in Figure 1.8 should now be on your screen. All the different types of analysis techniques that can be created by EasyLanguage are now at your disposal. 
Slide down the menu and select Strategy. A New Strategy dialog box like the one in Figure 1.9 will open and ask for a name and notes about the strategy that you are creating. 
FIGURE 1.7 Shortcut Bar—TradeStation 9.0
18 BUILDING WINNING TRADING SYSTEMS WITH TRADESTATION 
FIGURE 1.8 New File Submenu—TradeStation 9.0 
In the Name field go ahead and type “MyStrategy-1” and in the Notes field type “Donchian Break Out.” In the Select Template field, leave it at “none” and then click OK. A blank window will open and a tab associated with this strategy will also appear. This is your clean sheet of paper on which to type your wonderful ideas. It is also known as the EasyLanguage Editor and is part of the TDE. Also, the title of the TDE window will reflect the name of the analysis technique or function you are currently working on. Make sure your screen looks like Figure 1.10. 
You have successfully started a new trading strategy. Before we do some program-ming, let’s briefly take a look at some of the menus. 
 Table 1.5 details the selections that are available under the File menu.  Table 1.6 details the selections under the Edit menu.  Table 1.7 details the selections under the View menu.  Table 1.8 details the selections under the Tools menu.
Fundamentals—What Is EasyLanguage? 19 
FIGURE 1.9 New Dialog—TradeStation 9.0 
FIGURE 1.10 Our MyStrategy-1 Blank Sheet
20 BUILDING WINNING TRADING SYSTEMS WITH TRADESTATION 
TABLE 1.5 File Menu 
Menu Item Action 
New Creates many different types of analysis techniques. Open Opens an existing analysis technique. Close Closes window. Save Saves the current analysis technique. Save As Allows renaming the current analysis technique. Save As Template Saves the current analysis technique as a template for future use. Save All Saves all the currently opened analysis techniques. Import/Export Imports existing analysis techniques from other sources or exports 
analysis techniques to other sources. (Note: You can import from previous versions but you cannot export to previous versions.) 
Protect Allows you to password protect your analysis technique. Verify Verifies the analysis technique. Checks for syntax errors in 
the code. Verify All Verifies every function and analysis technique in your library. This 
can take a very long time, so make sure this is what you want to do. 
Properties Gives certain information pertaining to the current analysis technique. You can view/edit the Short Name, Notes, Max. number of look-back bars, Position Sizing, and Pyramiding. 
Print Prints the code of the current analysis technique. Exit Closes the EasyLanguage Editor. 
TABLE 1.6 Edit Menu 
Menu Item Action 
Undo Undoes the last action. Redo Redoes the last action. Cut Cuts the selected text. Copy Copies the selected text. Paste Pastes the selected text. Clear Clears the selected text. Select All Selects all text in the analysis technique. Find Finds a specific string of text. Find Next Finds the next occurrence of the specified string of text. Replace Replaces a string of text with another string of text. Find in Files Powerful multifile search tool. Outlining Outlining is a feature in the EasyLanguage Code Editor that allows 
you to manage whether blocks of code collapse or expand. Advanced Converts to uppercase/lowercase. Also allows quick commenting of 
selected code. Bookmarks Bookmarking is an EasyLanguage Code Editor feature that allows you 
add a marker to a line of code so that you can quickly move between marked lines in larger EasyLanguage documents.
Fundamentals—What Is EasyLanguage? 21 
TABLE 1.7 View Menu 
Menu Item Action 
Tool Bars Hides/shows different tool bars. Status Bar Hides/shows the Status Bar. Dictionary Hides/shows the EasyLanguage Dictionary. Very handy when 
looking for the correct reserved word. When found, the word can be dragged directly into your source code. 
Designer Generated Code Advanced feature, which will not be discussed in this book. Launch TradeStation Platform Launches TradeStation Platform if not already opened. 
A Simple Program Now that we are familiar with some of the menus and their func-tions, let’s code a simple program. We don’t need to know everything about the selections in the menus to start coding. Type the following text exactly as you see it here: 
Inputs: longLength(40), shortLength(40); 
Buy tomorrow at Highest(High,longLength) stop; 
Sell Short tomorrow at Lowest(Low,shortLength) stop; 
After you have typed this in, go under the File menu and select Verify or press F3. You should get a small dialog box that says, “If this analysis technique/strategy is cur-rently applied, it will automatically be recalculated.” Click the OK button. If you typed ev-erything properly, you will see 0 error(s), 0 warning(s) in the output pane of the EasyLan-guage Editor. If you get an error, simply check your code for any typos and verify again. Congratulations, you have just written an analysis technique in the form of a strategy! Now let’s break down each line of code so that we can fully understand what is going on. 
Inputs: longLength(40), shortLength(40); 
By typing this line you have created two constant variables of the numeric data type. These two variables, longLength and shortLength, have been initiated with the value of 40. These variables cannot be changed anywhere in the body of the analysis technique. They can be changed from the user interface of this signal or in the program header. These will be discussed later in this chapter. 
Buy tomorrow at Highest(High,longLength) stop; 
TABLE 1.8 Tool Menu 
Menu Item Action 
Customize You can change the look/actions of the menus, toolbars, commands, and keyboard with this menu item. 
Options Sets the EasyLanguage Editor’s font, background color, syntax coloring, and enables/disables the new Autocomplete.
22 BUILDING WINNING TRADING SYSTEMS WITH TRADESTATION 
This line instructs the computer to place a buy stop tomorrow at the highest high of the last 40 days. Highest is a function call. Functions are subprograms that are designed for a specific purpose and return a specific value. To communicate with a function, you must give it the information it needs. An automatic teller machine is like a function; you must give it your PIN before it will give you any money. In the case of the Highest function, it needs two bits of information: what to look at and how far to look back. We are instructing this function to look at the highs of the last 40 bars and return the highest of those highs. When an order is instructed through EasyLanguage, you must tell the computer the type of order. In this case, we are using a stop order. Orders that are accepted by EasyLanguage are: 
 Stop. Requires a price and is placed above the market to buy and below the market to sell. 
 Limit. Requires a price and is placed below the market to buy and above the market to sell. 
 Market. Buys/sells at the current market price. 
So, if the market trades at a level that is equal to or greater than the highest high of the past 40 days, the signal would enter long at the stop price. 
Sell Short tomorrow at Lowest(Low,shortLength) stop; 
The instructions for entering a short position are simply the opposite for entering a long position. 
For those of you who are moving from TradeStation 2000i to a new version, you will be pleasantly surprised by the elimination of the StrategyBuilder. Version 6.0 and greater create strategies on the fly by accepting default values for the strategy’s properties. For those of you who are not familiar with the StrategyBuilder, it was an additional compo-nent that required the user to click through several dialog boxes and change property values before one could create a strategy. Most of the time the default values were suf-ficient and this was an act of futility. Version 9.0 allows the strategy properties to be changed when needed. 
This book assumes the reader knows how to create daily and intraday charts in TradeStation. If you are not sure how to do this, we refer you to your TradeStation man-uals. Let’s start by creating a daily bar chart of the Japanese Yen going back 500 or more days in the TradeStation Platform. When this chart has been plotted, go under the Insert 
menu and select Strategy. A dialog box titled Insert Analysis Techniques and Strategies 
should open and look similar to the one in Figure 1.11. This dialog box is very informative: It lists the different strategies and also informs 
the user if the strategy has been verified and if the strategy has a long entry, short en-try, long exit, and short exit. Scroll through the list until you find MyStrategy-1. You will notice that the boxes under the Long Entry and Short Entry column headings are checked, but the boxes underneath the Long Exit and Short Exit are not. This tells us
Fundamentals—What Is EasyLanguage? 23 
FIGURE 1.11 Insert Analysis Techniques and Strategies 
that the system only enters the market; it is never flat—the system is either long or short. Long positions are liquidated when a short position is initiated, and vice versa. Our sim-ple Donchian Break Out is a pure stop-and-reverse system. You will also notice a small check box titled Prompt for Format. Make sure this box is checked, and then select MyStrategy-1 from the list of available strategies and click on OK. Another dialog box titled Format Strategy appears and should look similar to Figure 1.12. 
Click on the Inputs button. You will see the two inputs that we have coded in our Donchian Break Out strategy. By using the following line of code, we have given the user of the strategy, be it ourselves or someone else, the ability to change the longLength 
and shortLength inputs of MyStrategy-1. 
Inputs: longLength(40), shortLength(40); 
You do not need to change the code to change the system from a 40- to a 50-day Donchian Break Out. These inputs can be edited at any time—before the analysis tech-nique is inserted or after. You will notice that the values of these inputs default to those values that we had initiated. If you change these inputs from this dialog, they do not
24 BUILDING WINNING TRADING SYSTEMS WITH TRADESTATION 
FIGURE 1.12 Format Strategy 
permanently change; they will change only during this session. You can permanently change the default input values for MyStrategy-1 by changing the values and then clicking on the Set Default button. If you do change these inputs, always make sure you change the maximum number of bars the analysis technique will reference parameter. We will show you how to reference this parameter when we discuss the Format dialog box. You will notice that there are several other buttons in this dialog box; however, we will ignore these for now and accept our inputs as they are by clicking on the OK button. Click on the Format button. A dialog box should open titled Format Strategy. It should look like Figure 1.13. 
You will notice several different parameters that TradeStation takes into account when testing a strategy. Let’s examine each option and its purpose. 
Commission per share/contract $. The dollar value that will be deducted from each trade as a commission charge. Let’s set this to $0. 
Slippage per share/contract $. The dollar value that you expect the strategy will be slipped on each trade. Slippage is the actual fill price minus the calculated fill price. Slippage is either positive or negative; it is positive when you get in at a better price and negative when you get in at a worse price. Most of the time, the slippage is negative. Let’s set this to $0.
Fundamentals—What Is EasyLanguage? 25 
FIGURE 1.13 Format Strategy after Clicking the Format Button 
Trade size (if not specified by strategy). Fixed unit. The number of shares or contracts that are put on at the initiation of a 
trade. Change this value to 1, if it isn’t already so. Dollars per transaction. The fixed dollar value used to determine the number of 
shares/contracts. Trade size is calculated by dividing the price of the instrument into this value. 
Go ahead and click OK, and you return to the Format Strategy dialog box. Before we close this dialog box and proceed with the application of the strategy to the chart, make sure the box that says Generate strategy orders for display in Account Manager’s 
Strategy Order Tab is checked. Since MyStrategy-1 is a pure stop-and-reverse system, you will get a Strategy New Order or a Strategy Active Order dialog box that states that
26 BUILDING WINNING TRADING SYSTEMS WITH TRADESTATION 
you should buy or sell short at a certain price. If one of these dialog boxes does indeed open, just close it by clicking on the Close button. 
We need to learn more about the TradeManager. Go to the File menu and select New 
and then select Window. A dialog window will open. Select the Tools tab. Click on the TradeManager icon and then click the OK button. We could have accomplished this by using the Shortcut bar and clicking on the TradeManager icon. We have simply fallen in love with the Shortcut bar. Once you click the icon, a window like the one in Figure 1.14 will open. 
This window keeps track of all real orders and positions (if you have an actual trading account with TradeStation securities) and all simulated orders and positions. Since we are working with simulated trades that were generated by our strategy, click on the Strategy Positions tab. Your window will change and should look like the one in Figure 1.15. 
This spreadsheet shows the symbol we are currently testing, current strategy posi-tion, entry price, entry time, and various other statistics. Click on the Strategy Orders 
tab, and your window will change to look like the one in Figure 1.16. Since our strategy is in the market all of the time, you will have two rows (possibly 
more if you are currently tracking more than one system) of information. The top row will be the order to initiate a new position and the second row will be 
the order to cover the existing position. If the order is a stop order, the stop price will be located under the Stop header. If it is a limit order, the limit price will be under the Limit header. If today’s market action causes a fill to occur, the fill price will be under the 
FIGURE 1.14 Account Manager and Strategy Tracking—Today’s Orders
Fundamentals—What Is EasyLanguage? 27 
FIGURE 1.15 Account Manager and Strategy Tracking—Strategy Positions 
Filled header. You will notice other tabs in the TradeManager window. These tabs are used only if you have an account set up at TradeStation’s brokerage company. Basically, these other tabs give the same information as the Strategy tabs, but with real execution statistics. You can use TradeStation 9.0 without a trading account, but you will need to keep track of your real live positions and fills yourself. This in no way takes away from the back-testing and research capabilities of this product. 
FIGURE 1.16 Account Manager and Strategy Tracking—Strategy Orders
28 BUILDING WINNING TRADING SYSTEMS WITH TRADESTATION 
Reduce this window, and the chart of the Japanese Yen with buy and sell signals will now be the only window on the screen. If you like, you can go under the View menu and select Strategy Performance Report and look at how well the system performed over the test period. We will go into much further detail concerning the reports that TradeStation creates for the analysis of Trading Strategies in Chapter 5. 
TradeStation 9.0 EasyLanguage Editor With version 8.8, TradeStation finally developed a powerful IDE (Integrated Development Environment). It is now similar to other professional program authoring tools. It is so much better that we felt a brief tuto-rial on the EasyLanguage Editor should be included in this introductory chapter. If you are experienced with the new editor, then you might want to skip this section and go on to Chapter 2. 
An impressive feature of this editor is the ability to quickly and easily move from the source code of one program (the word “program” will be interchangeable with “strategy and analysis technique” throughout the rest of this book) to another. When you open to edit more than one analysis technique, each program or file is opened underneath its own tab very similar to the way Microsoft Excel uses tabs for different worksheets. This is a nice feature because it makes copying existing code from one strategy, function, indicator, or paintbar to another very easy. You will find out that programming is like building with building blocks. After programming for a while, you will develop a library of ideas that you use and reuse again and again. So it’s nice to be able to program a new idea with bits and pieces of old ideas. The multiple tab concept makes this much simpler than the way the old TradeStation cobbled the program source code windows along with any other window. 
The uncoupling of the editor and the charting/trading platform has made all of this possible. Now you can launch the EL Editor independent of the TradeStation platform. If you simply want to make some modifications to existing programs or begin new ones that do not need to be immediately applied to a chart, then you can do so without the overhead of the testing/trading platform. 
Outlining is a feature where blocks of source code can be grouped together to make readability much easier. This also helps make programs much more modular. We discuss the concept of modular programming in the next chapter. A portion of the strategy that we will work on later in the book is shown in Figure 1.15. You can easily see how the blocks of code are outlined. There’s a small box with a “-” symbol and a vertical line connecting the related blocks of code together. Outlining also allows you to hide the blocks of code if you wish to do so, again adding to the readability of the code. 
EasyLanguage has a huge library of reserved words and it is very difficult if not im-possible to remember them all. The new editor has a really cool feature called Auto-completing. Let’s say you want to code an idea that incorporates an average true range calculation and you can’t remember the name of the function that does the calculation. You could, of course, stop what you are doing and go to Help and look up the function. However, this is time-consuming, so the new EL Editor monitors what you are typing and provides all the possible reserved words that might match what has thus been typed.
Fundamentals—What Is EasyLanguage? 29 
It does this by creating a drop-down menu with all of the reserved words and placing you in the general area of words that begin with what you have typed. In the case of our example, all you need to do is type what you might think is the name of the function, and the list appears. By typing “av” the list pops up and places you at the word “average.” You can simply scroll down to find the function AvgTrueRange. 
Let’s play around with the EL Editor a bit before moving on to Chapter 2. If you haven’t downloaded the companion code for this book, it would be advisable to do so now. The editor should still be open from our previous exercise. If not, then go ahead and launch it. From the File menu select Open and when the Open Easy Language Doc-
ument dialog box appears, select Strategy in the Select Analysis Type drop-down menu. All of the strategies in your library are now presented to you. Scroll down and select Thermostat and click on the Open button. The source code for Thermostat should now be in your editor window and look similar to Figure 1.17. 
FIGURE 1.17 The Thermostat Strategy Opened in the EL Editor
30 BUILDING WINNING TRADING SYSTEMS WITH TRADESTATION 
FIGURE 1.18 An Example of How Code Is Outlined 
Scroll down until you find this line of code: 
if(buyEasierDay = 1) then 
You should see a little box with a “-” at the start of the following line of code. You will also see a line running vertically to the left that signifies a group of related code. Figure 1.18 shows how this block of code is outlined. If you don’t see the box or the vertical line, then make sure your outlining is turned on. You do this by go-ing up under Edit in the menu bar and selecting Enable Outlining in the Outlining 
submenu. Click on the “-” in the box and you will notice the code that was included in this 
particular outline is collapsed and the “-” in the box is replaced with a “+” symbol. It should look like Figure 1.19. 
You can toggle back and forth by simply clicking in the small box with either the “-” or “+” symbol. This is a neat feature when you are dealing with larger programs and want to hide blocks of code that are not being currently modified. It helps with the readability of the code. The outline also helps you see blocks of related information. Don’t worry about how the editor selects the outline at this time because we will discuss this in Chapters 2 and 3. 
Refer back to the source code of the Thermostat strategy and take a look at the beginning of the code. You will see the following snippet: 
{Thermostat by George Pruitt 
Two systems in one. If the ChoppyMarketIndex is less than 20, 
then we are in a swing mode. If it is greater than or equal 
to 20, then we are in a trend mode. Swing system is an open range 
[[Breakout|breakout]] incorporating a buy easier/sell easier concept. The trend 
following system is based on [[Bollinger Bands|bollinger bands]] and is similar to the 
BollingerBandit program} 
This information briefly describes how the strategy works. This description is to-tally optional, but coming from a professional programmer, you should explain as much as possible in English what you’re trying to accomplish. Again this helps to remind or explain to the reader of the code what it does. You will notice the “{” bracket at the beginning of the text and the “}” bracket at the end of text. The “{}” brackets are
Fundamentals—What Is EasyLanguage? 31 
FIGURE 1.19 An Example of How Code Is Collapsed 
telling the computer to ignore the text that is encapsulated. This is known as a com-ment block and we discuss how this works in Chapter 2. But for right now we want to show yet another cool feature of this editor. Find the following snippet of code in the Thermostat strategy: 
buyEasierDay = 0; 
sellEasierDay = 0; 
trendLokBuy = Average(Low,3); 
trendLokSell= Average(High,3); 
Go ahead and highlight these four lines by holding down your left mouse button and dragging to capture just these lines. Once they are highlighted, go up under the Edit menu and select Comment Selection from the Advanced submenu. You will notice the text will be enclosed by curly brackets. 
{buyEasierDay = 0; 
sellEasierDay = 0; 
trendLokBuy = Average(Low,3); 
trendLokSell= Average(High,3);} 
This is known as “commenting out” a piece of code from the entire program. Again, don’t worry about what this means; we just want you to get familiar with some of the neat features of the EasyLanguage Editor. 
The last feature we want to highlight is the editor’s dictionary capabilities. Go back to the EasyLanguage editor and scroll down until you see these two lines of code: 
trendBuyPt = BollingerBand(Close,bollingerLengths,numStdDevs); 
trendSellPt= BollingerBand(Close,bollingerLengths,-numStdDevs); 
Click on the word “BollingerBand” with the right mouse button and select Definition 
of BollingerBand from the pop-up menu. The dictionary will quickly open and the exact definition of BollingerBand will be presented. If you select a word that is not recognized by the dictionary, it will tell you, “Requested topic not found.” 
Continue navigating around the editor and play with some of the features we have mentioned. There are a lot of tools and options we haven’t discussed, so just ignore them. Some of these tools will be covered in later chapters. When you are done, simply close out the editor but do not save changes to the Thermostat strategy.
32 BUILDING WINNING TRADING SYSTEMS WITH TRADESTATION 
CONCLUSIONS 
The objective of this chapter is to introduce the fundamentals necessary to become a productive EasyLanguage programmer. We discussed data types, expressions, and statements. We reviewed how to declare variables and inputs, call built-in functions, and verify (compile) our code. In addition, we can create a strategy from a simple signal and insert that strategy into a chart. In the next chapter, we will build on this foundation and create much more complex programs (“analysis techniques,” in EasyLanguage vernacular).
C H A P T E R 2 
EasyLanguage Program Structure 
STRUCTURED PROGRAMMING 
Structured programming was introduced in the early 1970s. This concept stressed break-ing a program down into manageable modules and then connecting those modules to-gether into a coherent and logical flow of instructions. The modular concept was so important that the creator of the Pascal programming language, Niklaus Wirth, created a new programming language built primarily on this concept and named it Modula-2. We know that the readers of this book will probably not become professional program-mers, but structured programming is necessary for the accurate transfer of ideas into action. Any time you add structure to anything, you are always better off. EasyLanguage was developed as an easy-to-learn language for traders. It was not intended to produce professional programmers but instead to get traders to write some simple programs. Through our years of programming with EasyLanguage, we have discovered that most analysis techniques programs can be broken down into three different modules: a pro-gram header, a calculation module, and an order placement module. This modularization is not necessary to program analysis techniques. In fact, since EasyLanguage has so many shortcuts, many programmers prefer quick-and-dirty “spaghetti” code (code that is as dis-organized as a plate of spaghetti). This quick programming is fine for simple brainstorm-ing, but when your analysis techniques become complicated, structured programming will save you time in the long run. It is also necessary for debugging purposes, and you will be doing some debugging. It is very rare for a trader’s first attempt at programming a trading idea to work right off the bat. 
33
34 BUILDING WINNING TRADING SYSTEMS WITH TRADESTATION 
PROGRAM HEADER 
The header of an EasyLanguage program is the portal for communication between the internals of the program and the outside world. As in Chapter 1, the input statement al-lows the user of the analysis technique to modify particular parameters without having to rewrite and reverify the technique. The header also declares and initializes variables that will be used later in the analysis technique. This is the starting point of our structured program. The program header is an excellent place to describe the objective of our pro-gramming through the use of comments. The following is a good example of a structured program heading: 
{MyRsiSystem - trading strategy by George Pruitt 09/24/2011 
Version 1.00 initial testing of my idea 
Version 1.01 added [[RSI]] retracement component 
Version 1.02 added trailing stop mechanism 
Version 1.03 changed the overbought/-sold parameter 
This trading signal is designed to buy when the [[RSI]] has dipped into the 
oversold territory and sells when the [[RSI]] has risen into overbought territory. 
Once a position is initiated an initial money management stop is invoked 
and then a trailing stop takes over after a certain threshold of profit is 
attained.} 
Inputs: rsiLength(14), overSold(40), overBought(60), moneyManStop(1000); 
Vars: myRsiVal(0),longProtStop(0),shortProtStop(99999),obCount(0), 
osCount(0),longProfitStop(99999),shortProfitStop(0),takeProfitStop(2000); 
The header starts out with the name of the analysis technique, the author, and the date. Notice that remarks or comments are sandwiched between curly brackets ({}). The curly brackets inform the compiler to ignore these statements. These brackets can also be used to “comment out” code that you may want to keep in your program, but don’t want to necessarily use at this time. Keeping track of changes is always important, especially when designing trading techniques. There have been a number of times that we have come up with a good basic idea, only to forget and lose it after changing it umpteen times. If we had only kept track of the revisions, we could get back to the original idea. In this program header, we have recorded the additions and changes by applying different version numbers. This is similar to the method that large software companies incorporate into their own software development. A simple explanation of the analysis technique follows. After you have developed many different strategies, indicators, and so on, it becomes difficult to differentiate your ideas by simply looking at the name of the analysis technique. By putting a brief description of the analysis technique at the top of your program, you can quickly figure out what this particular program is attempting to do. This is also helpful if you are going to share the code with others. Most programmers hate to put comments in their code; they feel that it is a big waste of time. Most traders are programming for themselves and do not need to share their code with others. This may be the case, but we all need reminders and explanations of our ideas, especially
EasyLanguage Program Structure 35 
after some time has elapsed. This type of program heading is appropriate for any analysis technique, be it a Strategy, PaintBar, Indicator, or ShowMe. 
Since we are discussing readability, you should always save your analysis techniques with good, self-descriptive names. Saving an idea under the name of MyTradingSys1 will create confusion. After a couple of weeks of coding, we guarantee you will forget the main theme behind MyTradingSys1. Reusing code is one of the main reasons for building a library, and if you don’t label your ideas correctly, you will waste time searching for them. It would be like trying to find a book in a large public library without the card catalog. Some good file names that give a general idea of what code is designed to do are: MyRSIsystem, BreakOutSys, ChannelStrat, MyStochIdea, or BollingerTrader. 
The inputs and vars declaration statements come next. Notice how the inputs and variables are named; they all are self-descriptive. 
CALCULATION MODULE: MYRSISYSTEM 
This module is where the variables and inputs are put to work. When we talk about mod-ules, we mean a grouping of similar code. A module isn’t a function or a subroutine; it could be, but in our examples, modules are just separate areas of code. By separat-ing the code, we can easily read and understand the thought process that went into the coding. Take a look at the following snippet of code from the calculation module of the MyRSIsystem. 
myRsiVal = [[RSI]](close,rsiLength); 
if (myRsiVal > overBought and myRsiVal[1] < overBought) then 
begin 
obCount = obCount + 1; 
osCount = 0; 
end; 
if (myRsiVal < overSold and myRsiVal[1] > overSold) then 
begin 
osCount = osCount + 1; 
obCount = 0; 
end; 
You may not fully understand what is going on at this point. That’s okay. There are a few important ideas that are introduced in this code that we really do need to under-stand before we can go on, and we will explain them completely. Before we explain these new concepts, notice how we indented some of the program statements. This is for readability. If a particular statement controls the execution of a line or lines of code, then those lines should be indented so that it is easy to see which statements control which statements. Notice that the lines of code that start with osCount and obCount are indented. The if-then statements control the execution of these lines of code. Again, these indentations are not necessary; it just makes your code easier to read
36 BUILDING WINNING TRADING SYSTEMS WITH TRADESTATION 
and to understand. Indentations are created by simply hitting the tab key prior to typing your line of code. You can set up the number of spaces that a tab represents in your editor’s options. The new EasyLanguage Editor’s tab is defaulted to four spaces. We will discuss program control structures in Chapter 3. 
The statement myRsiVal = [[RSI]](close, rsiLength) calls a built-in EasyLanguage Relative Strength Index ([[RSI]]) function. The [[RSI]] function returns a value based on your inputs. In this case, we instruct EasyLanguage to calculate the [[RSI]] on the past 14 days’ closing prices. (We introduced the concept of functions in Chapter 1.) 
A function is called by simply typing the function name (in this case, [[RSI]]) and pass-ing the necessary inputs or parameters to it. Passing values to functions is quite simple. First, type the name of the function and a left parenthesis, and the necessary parameters separated by commas and a right parenthesis. The first parameter we pass to the [[RSI]] function informs the function to use the closing prices. The second parameter that we pass informs the function to use the past 14 days. Before you call a function, you must know the number of parameters, the type of parameters, and the exact order of the pa-rameters that the function is expecting. (There is a list of frequently used functions and their parameter lists in Appendix A.) If you do not pass the correct parameters to a func-tion, you will end up with either a syntax or a logical error. A syntax error is generated when the compiler does not understand what it is being told. The following function call will generate a syntax error: myRsiVal = [[RSI]](Close). The compiler will inform you that more inputs are expected. 
In Chapter 1, we discussed the reserved words that you can use to gain access to the bar chart data (“Open,” “High,” “Low,” “Close,” etc.), and how we are able to reference historical prices by adding an index into the reserved words. You can do the same thing with your own defined variables. If you want to look at the value of a variable on the previous bar, all you have to do is add the index. In the earlier sample code, notice how the previous bar’s [[RSI]] value was compared to the overBought value: 
myRsiVal[1] < overBought 
If you wanted to look at the [[RSI]] value of five bars back, you would type “myRsi-Val[5].” This is a powerful feature of EasyLanguage; it keeps track of the previous values of your variables so that you can access them anytime you need to. There is one lim-itation: EasyLanguage will remember only the number of bars that is specified by the MaxBarsBack setting. If you set the MaxBarsBack setting to 10, and you try to reference myRsiVal[11] (11 days back), you will receive an error message when the analysis tech-nique is applied to a chart. The following code shows how we have modularized the order placement code: 
{Order Placement Module} 
if(obCount = 2) then SellShort tomorrow at open; {We have entered OB twice} 
if(osCount = 2) then Buy tomorrow at open; {We have entered OS twice} 
if(marketPosition = 1) then
EasyLanguage Program Structure 37 
begin 
Sell ("longLoss")next bar at longProtStop on a stop; 
Sell ("longProfit")next bar at longProfitStop on a limit; 
end; 
if(marketPosition = -1) then 
begin 
BuyToCover ("shortLoss")next bar at shortProtStop on a stop; 
BuyToCover ("shortProfit")next bar at shortProfitStop on a limit; 
end; 
Notice how the entry orders and exit order calculations are placed in their respective groups. This makes it easier to go to the exact location in the code without having to hunt and search. Again, don’t worry about what we are trying to accomplish in this code; just try to teach yourself how to program and think in modules. The order of these buy and sell orders is not important, because TradeStation evaluates the orders simultaneously. Many times you may have more than one order working. In our example, the number of working orders depends on our current position. If we are long, then we have a short entry order, and two long exit orders. This is the same for a short position. If we are flat, then we have only one entry order working based on our osCount variable. To enter long, our osCount variable must be equal to 2; and to enter short, our obCount must be equal to 2 also. TradeStation executes only the order that is closest to the market. 
Now let’s look at MyRSIsystem in its entirety: 
{MyRsiSystem—trading strategy by George Pruitt 9/24/2011 
Version 1.00 initial testing of my idea 
Version 1.01 added [[RSI]] retracement component 
Version 1.02 added profit objective mechanism 
Version 1.03 changed the overbought/-sold parameter 
This trading signal is designed to buy when the [[RSI]] has double dipped into the 
oversold territory and sells when the [[RSI]] has doubly risen into overbought 
territory. Once a position is initiated an initial money management stop and 
profit objective stop is invoked.} 
Inputs: rsiLength(14), overSold(40), overBought(60), moneyManStop(1000); 
Vars:myRsiVal(0),longProtStop(0),shortProtStop(99999), 
obCount(0),osCount(0); 
Vars: longProfitStop(99999),shortProfitStop(0),takeProfitStop(2000); 
{Calculation Module} 
myRsiVal = [[RSI]](close,rsiLength); 
if(myRsiVal > overBought and myRsiVal[1] < overBought) then 
begin 
obCount = obCount + 1; 
osCount = 0; {Reset the OS counter since we are OB} 
end; 
if(myRsiVal < overSold and myRsiVal[1] > overSold) then 
begin 
osCount = osCount + 1; 
obCount = 0; {Rest the OB counter since we are OS} 
end;
38 BUILDING WINNING TRADING SYSTEMS WITH TRADESTATION 
if(marketPosition = 1) then 
begin 
longProtStop = entryprice - (moneyManStop/PointValue/PriceScale); 
longProfitStop = entryprice+(takeProfitStop/PointValue/PriceScale); 
osCount = 0; {Since we are long - reset the OS counter} 
end; 
if(marketPosition = -1) then 
begin 
shortProtStop = entryprice + (moneyManStop/PointValue/PriceScale); 
shortProfitStop = entryprice-(takeProfitStop/PointValue/PriceScale); 
obCount = 0; {Since we are short - reset the OB counter} 
end; 
{Order Placement Module} 
if(obCount = 2) then Sell Short tomorrow at open;{We have entered OBtwice} 
if(osCount = 2) then Buy tomorrow at open; {We have entered OS twice} 
if(marketPosition = 1) then 
begin 
Sell ("longLoss")next bar at longProtStop on a stop; 
Sell ("longProfit")next bar at longProfitStop on a limit; 
end; 
if(marketPosition = -1) then 
begin 
BuyToCover ("shortLoss")next bar at shortProtStop on a stop; 
BuyToCover ("shortProfit")next bar at shortProfitStop on a limit; 
end; 
It is easy to see the different modules. Also, notice how we have used com-ments to help explain the purpose of different statements. As a sidebar, the EasyLan-guage compiler is not case sensitive: “obcount” is the same as “obCOUNT,” “ObcOuNt,” “OBCOUNT,” and so on. This applies to all variables, keywords, function names, and inputs. We have a certain nomenclature when it comes to using upper- and lowercase letters that we follow when we create variables. Most of the time we type in lowercase and use uppercase only at the beginning of function names and variables that deal with the data: Open, High, Low, Close, Volume, Date, and Time. As explained in Chapter 1, we also use uppercase letters at the beginning of a new syllable (other than the first) in our own variable names. We do this to differentiate our variables from built-in keywords and functions. Also, if you type this system or import it into the EasyLanguage Editor, you will notice that some of the words are different colors. This is a fantastic feature of the Editor; syntax coloring can save you many hours of debugging and research time. EasyLanguage has a vast library of keywords and functions, and it would be impossible to memorize them all. In the default settings of the EasyLanguage Editor, reserved words and function names have a different color than normal text. With syntax coloring, you can guess at a name, and if it is a valid reserved word or function name, it will turn a different color. Many times I will need to call a function, but I can’t remember the exact name, so I type what I think the function name should be, and if it doesn’t turn a different color than the normal text, I try again. For some reason, I can never remember the exact name for the average true range function. I always type “averageTrueRange,” and it never
EasyLanguage Program Structure 39 
turns a different color. I then try “avgTrueRange” and it does turn and I know that I have the correct name. If you have the Autocomplete feature turned on in the new Editor, then you will be provided with a list of potential keywords as you begin typing. Nonetheless, syntax coloring is a really useful tool. The EasyLanguage Options dialog box allows you to customize the color of comments, reserved words, functions, skip words, quote fields, and string text. Set these types of words to a different color than normal text. Now, let’s look at the same code in a nonmodular format and without comments. You determine which code is easier to interpret. 
{MyRsiSystem—trading strategy by George Pruitt 09/24/2011} 
{Spaghetti Code} 
Inputs: rsiLength(14), overSold(40), overBought(60), moneyManStop(1000); 
Vars: myRsiVal(0),longProtStop(0),shortProtStop(99999),obCount(0), 
osCount(0); 
Vars: longProfitStop(99999),shortProfitStop(0),takeProfitStop(2000); 
myRsiVal = [[RSI]](close, rsiLength); 
if(osCount = 2) then buy tomorrow at open; 
if(marketPosition = 1) then 
begin 
longProtStop = entryprice - (moneyManStop/PointValue/PriceScale); 
longProfitStop = entryprice+(takeProfitStop/PointValue/PriceScale); 
osCount = 0; 
end; 
if(obCount = 2) then sell short tomorrow at open; 
if(marketPosition = -1) then 
begin 
shortProtStop = entryprice + (moneyManStop/PointValue/PriceScale); 
shortProfitStop = entryprice-(takeProfitStop/PointValue/PriceScale); obCount = 0; 
end; 
if(marketPosition = 1) then 
begin 
Sell ("longLoss")next bar at longProtStop on a stop; 
Sell ("longProfit")next bar at longProfitStop on a limit; 
end; 
if(marketPosition = -1) then 
begin 
BuyToCover ("shortLoss")next bar at shortProtStop on a stop; 
BuyToCover ("shortProfit")next bar at shortProfitStop on a limit; 
end; 
if(myRsiVal > overBought and myRsiVal[1] < overBought) then 
begin 
obCount = obCount + 1; 
osCount = 0; 
end; 
if(myRsiVal < overSold and myRsiVal[1] > overSold) then 
begin 
osCount = osCount + 1; 
obCount = 0; 
end;
40 BUILDING WINNING TRADING SYSTEMS WITH TRADESTATION 
We think you will agree that the modular version was much clearer. Since the com-piler evaluates statements from top to bottom and one line at a time, certain variables may need to be altered before an order is placed. Modularization, in addition to improved readability, adds correct logic flow to your programs. We will use the modular version of this system in Chapter 3 to help explain EasyLanguage programming. By the time we are through, you will fully understand every line of code in this system and be able to use the concepts to build your own analysis techniques from scratch. 
CONCLUSIONS 
The most important concept learned in this chapter is modular programming. An ac-curate program (analysis technique) is constructed by using individual building blocks. In our case, the building blocks are sections, or modules, of code that are utilized to improve readability and correctness. In addition, we discussed that built-in and user-defined variables can be indexed to look back at previous values. In a modern program-ming language, this feature would require the use of arrays and some form of indexing housekeeping. EasyLanguage hides this from you, and be thankful it does. The powerful use and need of modularization has not deviated one bit from the original publication of this book. Remember that the EasyLanguage Editor is user-friendly, is not case sensitive, and recognizes important reserved words and function names through the use of syntax coloring. The next chapter will tear MyRSIsystem apart and introduce and explain some important programming concepts and constructs.
C H A P T E R 3 
Program Control Structures 
T he least complicated programs start at the top of the program block and exe-
cute each statement in order and stop after the last statement. A very simple and straightforward strategy is illustrated by our very first strategy from Chapter 1: 
Inputs: longLength(40), shortLength(40); 
Buy tomorrow at Highest(High,longLength) stop; 
Sell Short tomorrow at Lowest(Low,shortLength) stop; 
Rarely can trading ideas be expressed in such simplistic terms. This strategy does not take into account a protective or trailing stop, profit objective, or any other exit mechanisms. It’s not that a simple approach can’t work (most of the time they work best), but trading ideas can be complex and involved. 
CONDITIONAL BRANCHING WITH IF-THEN 
You can make your programs as complex as you need to by using control structures. These structures give programs the ability to react differently under different situations; based on information provided to it, a program can choose between different avenues of logic to follow. In other words, your program must make a decision. Decision processing requires three bits of information: (1) what information is used, (2) how to evaluate the information, and (3) what to do after the decision. This type of programming is called conditional branching, because the flow of your program will branch in different di-rections after a logical condition is evaluated. Conditional branching is a form of a con-trol structure. Adding conditional branching to the earlier strategy gives it the ability to 
41
42 BUILDING WINNING TRADING SYSTEMS WITH TRADESTATION 
liquidate a position with a different exit. Let’s add the code that will exit a long/short position after five or more trading days if the position is not profitable. 
Inputs: longLength(40), shortLength(40); 
Buy tomorrow at Highest(High,longLength) stop; 
Sell Short tomorrow at Lowest(Low,shortLength) stop; 
If(marketPosition = 1 and barsSinceEntry(0)>= 5 and Close<entryPrice) then 
Sell("LongLoss5Days) on this bar close; 
If(marketPosition = -1 and barsSinceEntry(0)>= 5 and Close>entryPrice) then 
BuyToCover("ShortLoss5Days) on this bar close; 
This small addition of code has introduced a new concept, a reserved word, and a function. Before we explain exactly what is going on behind the scenes of this new code, let’s learn the concept of the conditional branching control structure. The brain behind conditional branching is the conditional expression, or Boolean expression. A conditional expression is any expression that results in either a true or a false condition. 
Condition statements consist of the comparison between one or more values. You can have direct comparisons: 
myProfit > 1200 
myRsi <= 20 
close[1] > close[2] 
or you can have comparisons based on calculations: 
myProfit >= entryPrice + 1200 
close[1] > close[2] + (high[2] - low[2]) 
or you can have multiple comparisons: 
marketPosition = 1 and barsSinceEntry(0) >= 5 and close < entryPrice 
(myRsiVal > overBought and myRsiVal[1] < overBought) 
All conditional expressions reduce down to a left-side value that is compared to a right-side value using a logical operator. Remember the operators learned in school: 
 > Greater than  < Less than  >= Greater than or equal to  <= Less than or equal to  = Equal to  <> Not equal to
Program Control Structures 43 
These operators can be used to compare any two expressions when the two items being compared are compatible. You would not want to compare a string value to a nu-merical value, or a string value to a logical value. Simple expressions are easy to under-stand. For example, (myRsi > 20) is clearly understood to mean my [[RSI]] value is greater than 20. Since we are human and traders (smarter than the average person, right?), most of our thought processes are not this simple. For this reason, EasyLanguage has provided the OR operator and the AND operator. Most of the time we will use these operators in the form of logical operators; we will use them for comparison purposes. They can also be used in the form of arithmetic operators, but for our purposes we rarely do this. To fully understand these operators, you must understand the following truth table. 
Value1 Value2 AND result OR result 
True True True True True False False True False True False True False False False False 
Here are some examples of how conditional statements are evaluated. Take the fol-lowing variable assignments: 
myValue1 = 10; 
myValue2 = 7; 
myValue3 = 3; 
Now, based on the previous truth table, the following condition statements evaluate to either true or false: 
myValue1 = 10 and myValue2 = 7 True 
myValue1 = 10 or myValue2 = 4 True 
myValue1 = 10 and myValue3 = 6 False 
myValue1 >= 10 and myValue2 <= 7 True 
myValue1 = 10 and (myValue2 = 6 or myValue2 = 7) True 
The last statement may throw you at first. But, remember back in Chapter 1 when we discussed the precedence of operators and how parentheses can change their order. In this example, we have True and (False or True), which reduces down to True and True. We first evaluate the information inside the parentheses and then do the next compari-son. Inside the parentheses, we have False or True, which is True. We then compare True and True; and as we all know, this is True. 
The if-then statement is the simplest form of conditional branching. This statement causes the program to execute a single statement or a block of code if a condition is True. When the compiler first encounters an if-then statement, it evaluates the informa-tion that is provided by the conditional statement. The evaluation produces one of two
44 BUILDING WINNING TRADING SYSTEMS WITH TRADESTATION 
possible results—True or False. If the statement is True, the line or block of code im-mediately following the if-then is executed. If the result is false, the program skips the line or block entirely. The if-then construct has the following syntax (syntax is the body of rules governing which statements and combinations of statements in a programming language will be acceptable to a compiler for that language): 
if(conditional statement) then [single statement]; 
if(conditional statement) then 
begin 
[multiple statements] 
end; 
You must always include the word “then” after the if conditional statement. The parentheses around the conditional statement(s) are optional, but they do help in clarifi-cation. If you want more than one statement to be executed after a conditional branch, you must use the words “begin” and “end.” “Begin” marks the beginning point of the block of code, and “end” literally marks the end of the block of code. Semicolons are not placed after the keywords “then” or “begin.” Referring back to the code that we added to MyStrategy-1: 
If(marketPosition=1 and barsSinceEntry(0) >=5 and close < entryPrice) then 
Sell("LongLoss5Days") on this bar close; 
If(marketPosition=-1 and barsSinceEntry(0) >=5 and close > entryPrice) then 
BuyToCover("ShortLoss5Days") on this bar close; 
Here, the if-then control structure liquidates our position if the position is not prof-itable after five or more trading days. The program tests our position on a daily basis after the fourth trading day and it will liquidate it if a closing price results in negative equity. You may look at the code and ask, “How do we know the number of days we have been in a trade?” Thanks to the vast library of EasyLanguage, we have a built-in func-tion that can tell us this information. The function barsSinceEntry returns the number of days that we have been in a position. Remember, most functions need to be passed some type of information; barsSinceEntry is similar in that it needs to know which po-sition we are talking about. In this particular case, we want the most recent position. By passing a zero to the function, we tell it that we need information pertaining to the latest position. If we had passed a 1, then we would have received information about the previous position. You may have been surprised that this was a function call. We didn’t assign the return value of the function to a variable (i.e., we didn’t say something equals the call to the function). We simply evaluated the function in an arithmetic expression. Functions can be used in assignments, comparisons, or arithmetic expressions. In other words, functions are like variables whose values are based on the parameters that are passed to them.
Program Control Structures 45 
You may then ask, “How do we know if we are in a long position or a short one?” Again, we refer to the EasyLanguage library and use the function marketPosition to determine our position. This function returns our current and previous positions based on the value that we pass it. If we had wanted our prior position, we would have passed a number 1 to the function: marketPosition(1). The marketPosition function will only return three different values: 1 for a long position, –1 for a short position, and 0 for a flat position. Now, let’s go back to the code. Notice how the if-then structure alters the flow of the program. The liquidation orders are not issued unless we pass the test (logical condition). In order to pass the test in this case, three criteria must be met: (1) We have a position, (2) we have been in the trade for five or more days, and (3) the close of the day puts us into a losing position. Since we are using AND, all of the conditional state-ments must evaluate to True before we can execute the line that immediately follows the if-then statement. If we had used logical OR, then only one of the conditional statements would need to be True. 
CONDITIONAL BRANCHING WITH IF-THEN-ELSE 
The if-then statement provides only a single branch. Many times a program requires two branches: one branch that executes if true, the other if false. This type of conditional branching can be accomplished by using the if-then-else statement. If an evaluation of a conditional statement is True, the line or block of code that follows the then statement is executed. If the evaluation is False, the line or block of code that follows the else 
statement is executed. The syntax for the if-then-else is: 
if(conditional statement) then [single statement] 
else [single statement]; 
if(conditional statement) then 
begin 
[multiple statements] 
end; 
else 
begin 
[multiple statements] 
end; 
Notice that a semicolon is not used after a statement that precedes an else state-ment. If one is added, it will cause a syntax error. Let’s incorporate our newly found knowledge into MyStrategy-1. The following code causes our program to make a deci-sion based on the number of days we have been in the trade. If we have been in the trade for fewer than five days, then we want to exit a long/short position on the lowest low/highest high of the past ten days. After we have been in the trade for five days or
46 BUILDING WINNING TRADING SYSTEMS WITH TRADESTATION 
more, we will revert back to our previous exit strategy (come out of a losing position on the close after five days). 
if (marketPosition = 1) then 
begin 
if(barsSinceEntry(0)<5) then 
begin 
Sell("LongLoss") next bar at Lowest(low,10) stop; 
end 
else 
begin 
if(close<entryPrice) then Sell("LongLoss5Days") on this bar close; 
end; 
end; 
If (marketPosition = -1) then 
begin 
if(barsSinceEntry(0)<5) then 
begin 
BuyToCover("ShortLoss") next bar at Highest(high,10) stop; 
end 
else 
begin 
if(close<entryPrice) then BuyToCover("ShortLoss5Days") on this 
bar close; 
end; 
end; 
Notice how in the last else block we didn’t have enough room to put the entire state-ment on one line. Sometimes your statements will be too long to fit on one line of your screen. You can continue on as many lines as you need. The following statements are syntactically correct and should give you no problems during verification (compilation). 
myValue1 = myValue2 + 
myValue3; 
myValue1 = (close + high + low)/ 3 + Highest(high,numDaysBack) -
Lowest(low,numDaysBack); 
myValue1 = 
myValue2 + 
myValue3 + 
myValue4; 
This is the beauty of having a line determination symbol (e.g., a semicolon). The compiler in EasyLanguage ignores all blank lines and spaces from the beginning of a
Program Control Structures 47 
statement to the semicolon. You can have 20 blank spaces or 20 blank lines. Our snippet of code not only exemplifies the if-then-else statement, but it also shows the concept of nested if-then statements. The if-then statements are separately located (nested) inside the scope (the boundaries of the statements that are controlled by the control structure) of the if (marketPosition = 1)-then statement: 
If (marketPosition = 1) then 
begin 
if(barsSinceEntry(0)<5) then ← nested if-then 
begin 
Sell("LongLoss") next bar at Lowest(low,10) stop; 
end 
else 
begin 
if(close<entryPrice)then Sell("LongLoss5Days") on this bar close; 
end; 
end; 
With nested if-then statements, you can make your programs as complicated as you need. Now that we have an understanding of conditional branching, let’s go back to the system that we introduced in Chapter 2 and see if we can understand what is going on. We will break up each module and explain what each statement is trying to accomplish: 
{MyRsiSystem—trading strategy by George Pruitt 09/24/2011 
Version 1.00 initial testing of my idea 
Version 1.01 added [[RSI]] retracement component 
Version 1.02 added profit objective mechanism 
Version 1.03 changed the overbought/-sold parameter 
This trading signal is designed to buy when the [[RSI]] has double dipped into 
the oversold territory and sells when the [[RSI]] has doubly risen into 
overbought territory. Once a position is initiated an initial money 
management stop and profit objective stop is invoked.} 
Inputs: rsiLength(14), overSold(40), overBought(60), moneyManStop(1000); 
Vars:myRsiVal(0),longProtStop(0),shortProtStop(99999),obCount(0), osCount(0); 
Vars: longProfitStop(99999),shortProfitStop(0),takeProfitStop(2000); 
We know that the program header is declaring and initializing the variables that we will need in the program. Since we are operating in one big loop, for each bar (daily or intraday) the following code is evaluated. First, we assign the myRsiVal variable the
48 BUILDING WINNING TRADING SYSTEMS WITH TRADESTATION 
[[RSI]] value for this bar based on the closing price and a 14-bar period. This is simply a function call. 
{Calculation Module} 
myRsiVal = [[RSI]](close,rsiLength); 
if(myRsiVal > overBought and myRsiVal[1] < overBought) then 
begin 
obCount = obCount + 1; 
osCount = 0; {Reset the OS counter since we are OB} 
end; 
After we get the current [[RSI]] value and store it in myRsiVal, we then test and com-pare it along with the previous bar’s [[RSI]] value (remember how to do this?—we simply index the variable) against our overbought input parameter. Referring back to our pro-gram header, we see that this value is 60. If myRsiVal is greater than 60 and myRsiVal[1] 
(previous bar value) is less than 60, then we pass the test. Upon successfully passing the conditional statement, the program then flows into the block of code that immediately follows the then statement. Our variable obCount increases by one and osCount is re-set to zero. Notice how we used self-descriptive names for these variables. Basically, we are counting the number of times we cross into overbought territory. Since we are deal-ing with the overbought region, we reset our oversold counter to zero. The next if-then 
statement counts the number of times we cross into oversold territory and resets our overbought counter to zero. 
if(myRsiVal < overSold and myRsiVal[1] > overSold) then 
begin 
osCount = osCount + 1; 
obCount = 0; {Reset the OB counter since we are OS} 
end; 
The following code pertains to our protective stop and profit target. If we are long, then we set our protective stop to the entryPrice – (moneyManStop/PointValue/ 
PriceScale). This formula looks quite complicated, but it really isn’t. We take our in-put parameter moneyManStop (currently set to 1,000) and divide it by the instrument that we are testing’s PointValue, and then divide this result by the instrument PriceScale. Let’s say we are trading coffee and we went long at 114.00. To calculate our protective stop, we would take 114.00 and subtract the result of ($1,000/$3.75/100). This would give us 114.00 – 2.66, which equals 111.33. Many of you who are familiar with EasyLanguage and TradeStation know that there are built-in $ [[Stop Loss]] strategies that you can add to any other strategy that will do the same as we have coded. The authors personally like to have all of the entries/exits in one strategy. Even if you don’t use our programmed
Program Control Structures 49 
money management stops or profit targets, you will at least know how they are calcu-lated. The keywords “PointValue” and “PriceScale” reflect the properties of the stock or commodity that you are currently testing. The keyword “PointValue” is the value per share of one increment of the PriceScale. The keyword “PriceScale” is the quoted scaling factor of the instrument. If you have two decimal places in the price, then your PriceScale would be 100. If you have four decimal places in the price, then your PriceScale would be 10,000. To figure out how a certain market is quoted (hundredths, thousandths, etc.), look at the price or divide 1 by the PriceScale. 
if(marketPosition = 1) then 
begin 
longProtStop = entryprice - (moneyManStop/PointValue/PriceScale); 
longProfitStop = entryprice + (takeProfitStop/PointValue/PriceScale); 
osCount = 0; {Since we are long—reset the OS counter} 
end; 
if(marketPosition = -1) then 
begin 
shortProtStop = entryprice + (moneyManStop/PointValue/PriceScale); 
shortProfitStop = entryprice - (takeProfitStop/PointValue/PriceScale); 
obCount = 0; {Since we are short—reset the OB counter} 
end; 
We calculate our protective and profit target stops and then use them in our orders for the next bar. 
{Order Placement Module} 
if(obCount = 2) then sell short tomorrow at open;{We have entered OB twice} 
if(osCount = 2) then buy tomorrow at open;{We have entered OS twice} 
if(marketPosition = 1) then 
begin 
Sell ("longLoss")next bar at longProtStop on a stop; 
Sell ("longProfit")next bar at longProfitStop on a limit; 
end; 
if(marketPosition = -1) then 
begin 
BuyToCover ("shortLoss")next bar at shortProtStop on a stop; 
BuyToCover ("shortProfit")next bar at shortProfitStop on a limit; 
end; 
You may be asking, “Why did we put our liquidation order inside if-then state-ments?” When you give TradeStation an order directive, it will execute automatically on the next bar. We don’t know our protective stop or profit target until we have a position. If we didn’t use the if-then and we had a flat position and we issued a market order for
50 BUILDING WINNING TRADING SYSTEMS WITH TRADESTATION 
the next bar, TradeStation would also issue a liquidation order for the next bar without knowing the correct stop or limit orders. Hypothetically, let’s assume that obCount is equal to 2, and we place a market order to sell for the next day on the open. At the same time, we have also told TradeStation to cover a short position at either a protective stop or a profit target limit. Sounds great, right? Wrong! We don’t know our liquidation orders until after the market opens the next day. Without adding the contingency of being in a long or short position, we have put the cart in front of the horse. Remember, we are executing a single bar at a time and we don’t know anything about tomorrow. So in our particular system the following will not work properly: 
BuyToCover ("shortLoss")next bar at shortProtStop on a stop; 
BuyToCover ("shortProfit")next bar at shortProfitStop on a limit; 
This is a logical error, and it is the hardest and most difficult to correct. The compiler informs us of syntax errors and, in most cases, these types of errors are simple typos. Contingent orders must use some form of decision and, therefore, must be programmed with a program control structure. 
REPETITIVE CONTROL STRUCTURES 
Most trading strategies or indicators require a method of repeating a line or block of code. EasyLanguage usually automatically handles this necessity for the trader. How-ever, there may be times when EasyLanguage doesn’t have a solution and you will need to know about looping. A good example of looping can be found in the simple [[Moving Average|moving average]] calculation. In EasyLanguage, you can get the current [[Moving Average|moving average]] of a value by calling the Average function. 
myAverage = Average(Close,10) {calculates a ten-day [[Moving Average|moving average]]} 
See how EasyLanguage has provided a quick solution to our programming needs? Just for fun, let’s see what is going on behind the scenes and learn about looping. Easy-Language accomplishes iterative processing (looping) through two different iterative statements: the for loop and the while loop. 
For Loop 
Use the for loop when you know exactly how many repetitions are to be processed. In the case of the [[Moving Average|moving average]] calculation, and most other calculations, we know exactly how many bars we will use. Previously, we calculated a 10-bar [[Moving Average|moving average]] of the closing prices by calling the Average function. Now, let’s do the same thing without a function call.
Program Control Structures 51 
Vars: mySum(0),counter(0),myAverage(0); 
mySum = 0.0; 
for counter = 0 to 9 begin 
mySum = mySum + Close[counter]; 
end; 
myAverage = mySum/10.0; 
or 
mySum = 0.0 
for counter = 9 downto 0 
mySum = mySum + Close[counter]; 
end; 
myAverage = mySum/10.0; 
Remember EasyLanguage’s ability to reference historical data by indexing the key-words “Open,” “High,” “Low,” and “Close.” We have incorporated that ability into our for loop. The historical closing information can be extracted by indexing the keyword “Close” with our counter variable (the name of this variable can be anything that is of numeric data type and can be used like any other variable). In the previous code, the program executes the block of code 10 times: 
for counter = 0 to 9 begin ← start at 0 and end at 9 inclusive—10 repetitions 
The first time the loop is executed, the counter is set to zero, and EasyLanguage tests this value to the end value (in this case, 9). Since the counter is less than or equal to 9 (it passes the test), the block of code immediately following the for statement is executed. Our variable mySum is initially set to mySum + Close[0] (the current closing price, since the counter equals zero). When the program reaches the end of the block of code that is encapsulated by the for statement, it loops back up to the beginning of the for statement. EasyLanguage adds 1 to our counter (counter now equals 1) and compares it to the end value. This is similar in action to an if-then statement. Conditional branching is built into the for loop. Since we are still less than or equal to 9, we again execute the block of code that immediately follows the for statement. On the last go-round, mySum was set to Close[0]. This time the counter is now equal to 1, so mySum 
is now assigned the value of the previous mySum + Close[1]. Do you see where we are going with this? In programming lingo, mySum is known as an accumulator. The looping mechanism uses this variable to sum up the closing prices for the past 10 days. The loop terminates after the counter reaches 10. You might think it would terminate when the counter reaches 9, but the for loop processes from the starting number through the end number. When the counter reaches 9, it is still less than or equal to the end value and, therefore, processes the loop once again. The next time through the loop, the counter is incremented to 10 and then fails the test. Upon failure, control passes to the next line immediately following the for loop block. In our code, myAverage = mySum/10.0 
is executed. After this statement is processed, we then have the average of the closing
52 BUILDING WINNING TRADING SYSTEMS WITH TRADESTATION 
prices for the past 10 days. In EasyLanguage, you can have for loops that loop from lower numbers to higher numbers, or vice versa. If you loop from a higher number to a lower number, you must use the keyword “downto” or the program will not loop properly. 
While Loop 
The for loop works great when we know the number of repetitions that we want to process. There are times, however, when you don’t know this information. Again EasyLanguage comes to the rescue with the while loop. The while loop continues to loop while a certain logical condition remains True. The following code illustrates the use of the while loop: 
Vars: myTestDate(1010101),counter(0),myHigh(0),myLow(999999); 
{This program calculates the highest price and lowest price since 
the beginning of the year} 
myHigh = 0; 
myLow = 999999; 
counter = 0; 
while (Date[counter] > myTestDate) 
begin 
if(High[counter] > myHigh) myHigh = High[counter]; 
if(Low[counter] < myLow) myLow = Low[counter]; 
counter = counter + 1; 
end; 
This loop starts with the current Date[0] and loops while Date[counter] is greater than the beginning of the year. EasyLanguage represents the date in a seven-digit format (YYYMMDD), whereas most other computer programs represent the date in an eight-(YYYYMMDD) or six- (YYMMDD) digit format. If today’s date is 20010101, EasyLan-guage would store it as 1010101. For another example, March 3, 2012, would be stored as 1120303. 
Calendar EasyLanguage 
Date Representation 
19991231 991231 20000101 1000101 20120601 1120601 
By increasing the counter by 1 each time through the loop, we are actually going back in history. Remember, today’s open price is Open[0] and yesterday’s open is Open[1]. As we loop backward, we compare the highs and lows of the bars with the myHigh and myLow variables. Each time we find a higher high or lower low, we store those prices in our variables for later use. The while loop is not terminated until we go back in time to the date of 20010101. We were able to loop without knowing the exact number of repetitions that needed to be processed.
Program Control Structures 53 
CONCLUSIONS 
Through the use of program control structures, a program can make an informed de-cision. Remember, the programmer makes the computer intelligent by setting up the decision process and the consequences of the decision. Decision making is programmed through the use of if-then and if-then-else statements. These statements control which instructions are executed and which are not. The for loop and while loop statements are two program control structures that provide us with one of the great benefits of com-puters: the ability to do repetitive tasks quickly. Understanding how computer programs make decisions is vital to our goals of accurately programming our analysis techniques.
C H A P T E R 4 
TradeStation Analysis Techniques 
E asyLanguage is the power behind TradeStation. Without this power, TradeSta-
tion would not be any different from any of the other real-time charting software packages. EasyLanguage is the driving force behind all of TradeStation’s analysis 
techniques: PaintBar, Indicator, ShowMe, Function, and Strategy. Each of these tech-niques is discussed, and sample code is given so that you can use it as a template for your own research. We have covered the basic essentials of programming from the first three chapters, and now we will use this knowledge to put our trading ideas into action. 
INDICATORS 
An indicator is a graphic representation of a mathematical formula used to analyze mar-ket data. If you have used charting software before, you probably know what some of the most popular indicators are. Indicators are the lines (graphs) that are plotted either on top of a bar chart or in subgraphs above or below a bar chart. These lines are used to help understand and, in some cases, to forecast market action. Indicators are the plotted out-put of formulas applied to the price data. The most famous indicator of all is the [[Moving Average|moving average]] of closing prices. The graph of the [[Moving Average|moving average]] is a continuous line that can be plotted on the actual bar chart data. Not all indicators can be plotted on the underly-ing bar chart due to the difference in their scaling properties. The scale of the output of a [[Moving Average|moving average]] calculation is the same as the data that was used for the input. Since the scale of the input and output of this indicator is the same, it can be plotted on the same one as the price data. The outputs of some indicators, such as the relative strength index ([[RSI]], developed by Welles Wilder), have a different scale than price data and should be plotted in a subgraph. However, with TradeStation you can graph these types of indica-tors on the bar chart if you like. Keep in mind that the graphs have different scales. The 
55
56 BUILDING WINNING TRADING SYSTEMS WITH TRADESTATION 
FIGURE 4.1 Insert Analysis Techniques and Strategies 
output of most indicator functions does not create smooth-looking, continuous graphs. They generate a data point for each bar of data, and then TradeStation connects these lines together in a connect-the-dots fashion. 
To demonstrate how simple it is to apply an indicator to a bar chart, let’s go ahead and apply the Mov Avg 1 Line indicator to a Yahoo! daily bar chart. Create a daily bar chart of 500 days for Yahoo! and then go to the Insert menu and select Indicator. A dialog box like the one in Figure 4.1 should open. 
Scroll through the list of indicators and select Mov Avg 1 Line. Make sure the Prompt for Format box is checked and then click OK. Since we checked the Prompt for 
Format box, you will be presented with another dialog box that should be like the one in Figure 4.2. 
This dialog box allows the user to change the format of the Mov Avg 1 Line indicator. Here the width, color, and style of the line and the inputs (if any) of the indicator can be changed. Click on the Scaling tab and you will have a choice of four different scaling types: 
1. Same as symbol. Choose this option to use identical scaling for the y-axis (price axis) and the symbol to which the analysis technique is applied.
TradeStation Analysis Techniques 57 
FIGURE 4.2 Format Indicator: Mov Avg 1 Line 
2. Screen. Select this option to display only the range of values currently displayed on the screen without regard to the range of data loaded for the chart. 
3. Entire data series. Choose this option to display the entire range of values for all data loaded in the chart, no matter how far you scroll to the left or right of the current screen view. 
4. User-defined. Select this option to format the y-axis to your preferences. Enter the lowest value to use in the Minimum box and the highest value in the Maximum box.
58 BUILDING WINNING TRADING SYSTEMS WITH TRADESTATION 
FIGURE 4.3 Yahoo! Bar Chart with [[Moving Average]] Indicator 
We prefer to use Same as symbol scaling when the indicator is to be plotted on top of the bar chart. If an indicator is oscillator-based and is plotted in a subgraph, we generally use Same as symbol or Screen scaling. Check the Same as symbol box and then click OK. You should have a chart window similar to Figure 4.3 on your screen. 
You can scroll through the data and the indicator will change based on the data that is currently in your view. You may want to play with changing the format of this indicator or inserting more of the built-in indicators as practice. 
Applying an indicator requires a few mouse clicks and pecks at the keyboard. Pro-gramming an indicator can be simple if you understand the basic framework and the keywords or functions that are used in the development of this type of analysis tech-nique. Let’s create our first indicator. Make sure TradeStation and the EasyLanguage Editor (TradeStation 9.0 Development Environment) are up and running. Go under the File menu in the Editor and select New Indicator. A dialog box like the one in Figure 4.4 will open. 
This dialog box will ask you to type in the name of the indicator and some notes about the indicator. Type “MyMovAvgIndic” in the name field and “simple moving aver-age indicator” in the notes field. This dialog box will also ask you to make the analysis
TradeStation Analysis Techniques 59 
FIGURE 4.4 New Dialog Indicator 
technique available to a chart analysis. We always check this box. Finally, you can choose what type of template to use when building your indicator. Select None and then click OK. Once you become an EasyLanguage pro, you will probably want to use a programming template. These templates provide some code to get you up and running quickly. You should be presented with a blank window titled “Indicator: MyMovAvgIndic.” TradeStation has initially created an indicator based on our input from the previous dialog boxes. Type the following code exactly as you see it here: 
Inputs: myPrice(close),myLength(9); 
Vars: counter(0),sum(0.0),myAverage(0.0); 
sum = 0.0; 
for counter = 0 to myLength-1 
begin 
sum = sum + myPrice[counter]; 
end; 
myAverage = sum/myLength; 
Plot1(myAverage, "SimpAvg1"); 
After you are finished typing, hit the F3 key and verify your code. Again, if you get any error, double-check your code for any typos. Once you are successful at verifying your code, go ahead and apply MyMovAvgIndic to the same Yahoo! daily bar
60 BUILDING WINNING TRADING SYSTEMS WITH TRADESTATION 
FIGURE 4.5 Yahoo! Bar Chart with MyMovAvgIndic 
chart that we used previously. Click OK in the associated dialog boxes until you have the [[Moving Average|moving average]] line overlaying the price data. It should look similar to the chart in Figure 4.5. 
The key to a well-written indicator is its flexibility. In MyMovAvgIndic, we utilized two inputs: myPrice and myLength. These two inputs allow the user the freedom to pick what data (Open, High, Low, Close, or Volume) and how many days to use it in the calculation. We have designed this indicator to be about as flexible as possible. We could have programmed the indicator with only the myLength input and forced the user to always use a hard-coded (programming designed to get a particular job done without regard to future flexibility) price series. If we hadn’t allowed the user to pick which data series to use, we would have had to program the indicator in the follow-ing manner: 
for counter = 0 to myLength-1 
begin 
sum = sum + Close[counter]; 
end;
TradeStation Analysis Techniques 61 
Instead of using myPrice in the for loop, we would have to hard-code the Close or High or Low or Open price series into our programming. Our indicator would not be universal, and you would have to have four different indicators for each price series. The previous programming allows MyMovAvgIndic to be universal. We can calculate the [[Moving Average|moving average]] of the Highs, Lows, Opens, or Closes of any market by simply changing our first input, myPrice. 
In the discussion of indicator flexibility, we brought up the term “series.” Remem-ber in Chapter 1 when we introduced data types? There were basically three different types: Numeric, Boolean, and String. The Numeric type can be divided into two dif-ferent categories: simple and series. A variable of type Numeric simple has only one value at a time. In the code of MyMovAvgIndic, the variable sum is of this type. A vari-able of type Numeric series has a list of different values. The keywords “Open,” “High,” “Low,” and “Close” are of this type. We can index these variables and get different val-ues (e.g., Close[1] is yesterday’s closing price and Close[2] is the previous day’s closing price). In computer lingo, these variables are known as arrays. An array is a list of items that have something in common. Like most other high-level programming languages, EasyLanguage allows you to define variables as arrays. The average trader seldom uses arrays beyond the built-in array variables, so we will temporarily put this discussion on hold. Just know that when we say a price series, we mean a list of the entire history of that particular price (Open, High, Low, and Close). 
Let’s review the rest of the code. We know the inputs and their functions and for 
loops (Chapter 3) and how to calculate the [[Moving Average|moving average]] of prices. The line of code that makes this program an indicator is: 
Plot1(myAverage, "SimpAvg1"); 
This statement tells TradeStation to plot the value of the variable myAverage in a chart window below the chart of the price data. Once the indicator is plotted, we simply drag it from the subgraph onto the same graph as the price data and use the same scaling. You can see where price crosses the [[Moving Average|moving average]] line. To determine the exact date that a price bar crosses from above or below the [[Moving Average|moving average]] line, you must set the scale of the two graphs to be exactly the same. The Plot1 keyword acts in similar fashion to a function call. We passed it a list of parameters and it did something for us. It can also return the value of the plot from the most recent bar that was executed. Plot1 is different from the functions that we have discussed in that you can pass it a different number of parameters. In our example, we simply passed the value that we wanted to plot and the name of the indicator. This name shows up in the information window that pops up when you click on a bar in a chart. We could have passed more or fewer parameters to the Plot1 statement: 
Plot1(Value); 
or 
Plot1(Value, "My Plot Name", Red, Default, 0);
62 BUILDING WINNING TRADING SYSTEMS WITH TRADESTATION 
Plot1 can take up to five parameters: (1) the value to be plotted, (2) the name of the plot (optional), (3) the color of the plot (optional), (4) background color (optional), and (5) the thickness of the line that represents the plot. EasyLanguage only requires the value to be plotted in the Plot1 statement; the other arguments are optional. If you don’t pass a particular argument, EasyLanguage presumes you want to use the default value. Even though some of the arguments are optional, the order of the arguments is important. 
EasyLanguage expects the first argument to be the value to be plotted, and the sec-ond argument to be the name of the plot, and so on. This order has to be clear. Let’s say you wanted to pass the Plot1 statement the value to be plotted, its name, and the width of the line. You would have to pass all of the arguments because the width argument is last in order. You would have to invoke the Plot1 statement by typing: 
Plot1(myValue,"myValueName",Default,Default,5); 
The keyword Default tells TradeStation to accept whatever default values exist for that particular argument. In this case, they are the color of the plot and the background color. EasyLanguage is smart, but it is not a mindreader. It knows which values are being used by their place in the argument list. Indicators are powerful tools in the analysis of data and the design of trading strategies. If you want to include an indicator in a strategy, you can quickly plot the indicator and visually evaluate its effectiveness. Unfortunately, as we explained in The Ultimate Trading Guide, most canned (included for free) indi-cators are not effective by themselves. 
PAINTBAR AND SHOWME STUDIES 
These two studies are similar in that they both look for and mark a bar or bars that meet specific criteria. The PaintBar study will mark the entire bar, whereas the ShowMe study will usually place a mark above or below the bar. These studies make it easy to visually interpret different market conditions; for example, you can paint bars one color when the market is overbought and another color when it is oversold. ShowMe studies are best used for criteria that result in a low frequency of occurrences. The fewer dots that are above or below a bar, the easier it is to visually interpret the market activity following the occurrence of the certain criteria. Pivot highs and pivot lows are best illustrated with a ShowMe study rather than a PaintBar study. The choice of which study to use is up to the user’s own preference. We prefer to use ShowMe studies for pattern recognition and PaintBar studies for illustration of certain market modes. The best way to learn to program these analysis techniques is to jump in and create them from scratch. Let’s start with a PaintBar study.
TradeStation Analysis Techniques 63 
With TradeStation running, go under the File menu and select New. The now famil-iar dialog box will come up. Select the EasyLanguage tab and click on the PaintBar 
icon. In the resulting dialog box, type “MyPaintBar” in the name field and “paint bars different colors in OB/OS regions” in the notes field and then click OK. You will be presented with a blank, yet familiar EasyLanguage window. Type the following code in exactly. 
{Simple PaintBar Analysis 
Demonstrates TradeStation's ability to highlight bars in 
different market conditions} 
Inputs: overbought(70),oversold(30),rsiLength(14); 
Vars: myRsiVal(0); 
MyRsiVal = [[RSI]](Close,rsiLength); 
if(myRsiVal>overBought) then PlotPaintBar(High,Low,"[[RSI]]",RED); 
if(myRsiVal<overSold) then PlotPaintBar(High,Low,"[[RSI]]",YELLOW); 
After typing the code, hit the F3 key or go under the File menu and select Verify. Let’s see how we did. If you don’t have the chart of Yahoo! that we used earlier in the chapter open, go ahead and create another one. Insert our PaintBar study in the same fashion as we did our MyMovAvgIndic (under the Insert menu). (You will notice that the further you get into this book, the less descriptive we have become in our instructions. We feel this promotes your ability to remember the processes necessary to use TradeStation.) Once you have inserted MyPaintBar into the chart, you should be able to scroll through the chart and see the yellow and red daily bars. If you would like to see if our PaintBar study is accurate, go ahead and insert the [[RSI]] indicator with our same inputs. We should have red bars when the oscillator is in the overbought region and yellow bars when it is in the oversold region. 
The code for our PaintBar study is similar in structure to our [[Moving Average|moving average]] indicator that we programmed earlier. The only thing that differentiates a PaintBar from an indicator is the PlotPaintBar statement: PlotPaintBar(High,Low,“[[RSI]]”, 
RED); 
This statement tells TradeStation to paint a bar red from the high price to the low price. Also, the statement instructs TradeStation to use the word “[[RSI]]” in the bar in-formation window. If you hold the mouse button down and scroll across a bar that has been painted, you will get an RSI1 and RSI2 value in the bar information win-dow. These values represent the high and the low prices of the bar. We used the word “[[RSI]]” to denote that we were using the [[RSI]] indicator to determine our over-bought/oversold conditions. You can use any word you like. We painted our overbought bars red by telling TradeStation to use the color red in our PlotPaintBar statement. This argument is optional; if you don’t choose a color, TradeStation will choose one for you. We wanted to paint bars two different colors based on market conditions, so we chose the colors ourselves. When working with analysis techniques, you can
64 BUILDING WINNING TRADING SYSTEMS WITH TRADESTATION 
specify any of the 17 colors listed below (including −1), using the name, or Numeric equivalent: 
Numeric 
Color Name Equivalent 
Default –1 Black 1 Blue 2 Cyan 3 Green 4 Magenta 5 Red 6 Yellow 7 White 8 DarkBlue 9 DarkCyan 10 DarkGreen 11 DarkMagenta 12 DarkRed 13 DarkBrown 14 DarkGray 15 LightGray 16 
In addition to selecting the PaintBar color, you can also select the portion of the bar that you want painted. In our PaintBar study, we painted the entire bar from top to bottom. We could have painted the bar from the Open to the High, Open to Close, Open to Low, or any combination of these. You can’t paint from Open to Open, High to High, Low to Low, or Close to Close; there must be a range. Using the PlotPaintBar statement is quite easy. The hard part is creating the criteria necessary to determine when to and when not to use the statement. When you typed the code for MyPaintBar, we had you use an if-then construct to alter the flow of the program. We painted a bar red only when the [[RSI]] was above 70. We painted a bar yellow only when the [[RSI]] was below 30. You can quickly scan this chart and determine potential overbought and oversold market conditions. If you don’t care for the [[RSI]] as an indicator for overbought/oversold, you can incorporate a different indicator. 
You may ask, “Why use the PaintBar study when you could have simply used the Indicator?” We programmed our study utilizing the [[RSI]] function for demonstration pur-poses. Many times a PaintBar study doesn’t use some built-in function or indicator. We have programmed a complex pattern recognition PaintBar to illustrate this point. The coding for this PaintBar will draw on everything we have learned up to this point. Go ahead and create a new PaintBar and name it “MySequentialHunter.” In the notes field, type “paint sequential setup.” This study is based on one of Tom DeMark’s complex pat-terns, the Sequential. We will program the first stage of the pattern and paint the bars that
TradeStation Analysis Techniques 65 
fall within our pattern recognition criteria. Type the following into your EasyLanguage document and verify it. 
{Paint the Sequential Setup Pattern 
Sequential is by Tom Demark 
Paint buy setup Yellow and sell setup Red} 
Vars: index(0),checksum(0); 
{Buy Setup} 
checkSum = 0; 
for index = 0 to 8 
begin 
if(Close[index] < Close[index+4]) then checkSum = checkSum + 1; 
end; 
if(checksum = 9) then 
begin 
for index = 0 to 8 
begin 
PlotPaintBar[index](High[index],Low[index],"Sequential",YELLOW); 
end; 
end; 
{SellSetup} 
checkSum = 0; 
for index = 0 to 8 
begin 
if(Close[index] > Close[index+4]) then checkSum = checkSum + 1; 
end; 
if(checksum = 9) then 
begin 
for index = 0 to 8 
begin 
PlotPaintBar[index](High[index],Low[index],"Sequential",RED); 
end; 
end; 
After you successfully verify your code, apply MySequentialHunter to the same Yahoo! chart that we have been using. You will probably want to delete the other anal-ysis techniques before inserting this one. The code for MySequentialHunter may look daunting, but it is relatively simple. We have four for loops. The first loop counts the consecutive days on which the closing price is less than the closing price four days prior. If we have nine consecutive closes that meet our criteria, then the checkSum variable will be equal to 9. If we don’t have nine consecutive closes, then checkSum will be less than 9. If checkSum is equal to 9, we then proceed to the next for loop. This loop calls the PlotPaintBar statement nine times (our index variable goes from 0 to 8). The first time through the loop, the index is equal to zero. Therefore, the call to the PlotPaintBar 
looks like: 
PlotPaintBar[0](High[0],Low[0],"Sequential",YELLOW);
66 BUILDING WINNING TRADING SYSTEMS WITH TRADESTATION 
The next time through the loop, the call looks like this: 
PlotPaintBar[1](High[1],Low[1],"Sequential",YELLOW); 
This continues until the termination of the loop. By using the brackets and an in-dex variable, we are telling TradeStation to paint today’s bar yellow, yesterday’s bar yellow, in addition to the preceding seven bars yellow. Again, if you want to paint yesterday’s (or prior) bar yellow, you must index the PlotPaintBar statement with [1] 
(PlotPaintBar[1]—basically we are offsetting the bar that we want painted from the current bar). You also must be careful to synchronize the High’s and Low’s index vari-ables with the same PlotPaintBar index variable. The following statement may not pro-duce your expected outcome: 
PlotPaintBar[1](High,Low,"Sequential",YELLOW); 
This tells TradeStation to paint today’s high and low values on yesterday’s bar. This may or may not paint the bar the way you want it to be. Just remember to paint the cor-rect high and low price for the corresponding bar in the past. Most analysis techniques are symmetric; a bullish analysis is usually just the opposite of a bearish analysis. Re-ferring back to the code for MySequentialHunter, you will notice that there are only two lines that separate the buy setup from the sell setup: 
Buy—If(Close[index] < Close[index+4] then checkSum = checkSum + 1; 
Sell—If(Close[index] > Close[index+4] then checkSum = checkSum +1; 
The only other difference is the call to the PlotPaintBar statement with different colors. Once you program the bullish analysis technique, you can quickly create the bearish analysis by simply copying, pasting, and editing the logic. Many times you can accomplish this by simply changing Highs to Lows, greater than to less than, positive numbers to negative, and so on. Of course, this wouldn’t work for an analysis that wasn’t symmetric. The ShowMe study is similar to the PaintBar. We won’t bore you much fur-ther with an elaborate explanation, so let’s learn by doing. Create a new ShowMe study in similar fashion to a PaintBar study and type “MyShowMe” in the name field, and “Show a two-day flip” in the notes field. Once you get a blank EasyLanguage document, type the following in exactly. 
{MyShowMe 
Show the Bars that represent a Two-day flip} 
Inputs: strongThrustPrcnt(.75),volCalcDays(10); 
Vars: volMeasure(0); 
volMeasure = avgTrueRange(volCalcDays); 
{bearish indicator} 
if(Close[1] > Open[1] + strongThrustPrcnt*volMeasure and 
Close < Open - strongThrustPrcnt*volMeasure and 
Open < Close[1]) then
TradeStation Analysis Techniques 67 
begin 
Plot1(High,"TwoDayFlip",RED); 
Plot1[1](High[1],"TwoDayFlip",RED); 
end; 
{bullish indicator} 
if(Close[1] < Open[1] - strongThrustPrcnt*volMeasure and 
Close > Open + strongThrustPrcnt*volMeasure and 
Open > Close[1]) then 
begin 
Plot1(Low,TwoDayFlip",YELLOW"); 
Plot1[1](Low[1],"TwoDayFlip",YELLOW"); 
end; 
The programming of a ShowMe study is almost the same as a PaintBar study— the only difference is that the ShowMe study uses Plot1 and the PaintBar uses the PlotPaintBar statement to draw to the screen. In our ShowMe study, we mark the two bars that make up the Two-Day Flip pattern. As we did in our PaintBar, we programmed our setup criteria by using if-then program control structures. We mark only the bars that pass our test. The Two-Day Flip can indicate an end to a bullish or bearish trend. The bullish Two-Day Flip occurs when yesterday’s close is well below yesterday’s open, today’s open is below yesterday’s close, and today’s close is well above today’s open. The bearish Two-Day Flip is just the opposite of the bullish version: yesterday’s close is well above yesterday’s open, today’s open is above yesterday’s close, and today’s close is well below today’s open. See the symmetry? This is a general description of the pattern. Programmers like us (if you have made it this far and understand the concepts that we have presented—then classify yourself as a programmer) know that a general descrip-tion of an idea is not sufficient to produce actual code. Therefore, the exact definition of a bullish Two-Day Flip is: Yesterday’s close is less than one 10-day average true range below yesterday’s open, today’s open is less than yesterday’s close, and today’s close is greater than one 10-day average true range above today’s open. Again, the bearish ver-sion is just the opposite. This exact mechanical description is necessary for successful translation into EasyLanguage. The Plot1 statement that we use in our ShowMe study is the exact same statement that we used in our indicator. Instead of creating a continuous line that represents an output of a formula, we are using the statement to demark a bar that meets a certain criterion. In our ShowMe code, we used the Plot1 statement to mark the high price or the low price of the two bars that made up the Two-Day Flip: 
Plot1(High,"TwoDayFlip"); 
Plot1[1](High[1],"TwoDayFlip"); 
As with the PaintBar study, we had to synchronize our Plot1 statement with the corresponding bar. When plotting an indicator, you use the value of the indicator and not a reference to a bar’s specific price. Once we encounter a day that does not pass our criteria, the drawing stops. Hence, you have dots instead of a continuous line. You can
68 BUILDING WINNING TRADING SYSTEMS WITH TRADESTATION 
have up to four different Plot statements in your code: Plot1, Plot2, Plot3, and Plot4. Each plot statement can represent a different value; Plot1 could be a [[Moving Average|moving average]] value, whereas Plot2 could be a Bollinger Band. The key to an accurate PaintBar or ShowMe study is found in the programming of the criteria. 
FUNCTIONS 
Functions are the backbone of TradeStation. One of the most important concepts in ef-ficient programming is the idea of reusable code. How would you like to have to repro-gram Welles Wilder’s [[RSI]] calculation every time you incorporated it into your analysis technique? Programming analysis techniques require a heavy dependence on EasyLan-guage’s vast library of functions. Many of the indicators and strategies that you will de-velop will consist mostly of function calls. You can think of the functions that make up the library as small building blocks and yourself as a mason. It is your job to build your analysis techniques out of these blocks. Of course, there will be times when a mason must customize a block to fit a particular project. This applies to programmers also; you might find that by tweaking the built-in Stochastic function you end up with a better oversold/overbought indicator. By tweaking, we mean changing a portion of the code that makes up the function. If you ever do this, always remember to save your modified function under a different name than the original. If you change the [[RSI]] calculation, re-name it to something like “MyRSI.” You want to keep the built-in library as pristine as possible. Many times you will borrow or purchase code from other TradeStation users, and, in most cases, this code will presume that the built-in library is the same as the one from the computer where it was created. If your library is different from the code creator’s library, you may get totally different results. 
As a programmer, you are not limited to using functions or simply editing existing ones. You can create these building blocks from scratch. The more you program, the more intricate your programming becomes. Elaborate programs require elaborate build-ing blocks. In the early stages of learning how to program analysis techniques, the built-in library is more than sufficient. As you progress, you soon will discover that the library is too limiting and must be expanded. You expand the library by creating functions. Since, right now, you may not be an experienced programmer, you may be asking yourself, “How will I know when I need to create a function?” There are basically two situations where you will need to be a function creator. The first is when you discover that you are repetitiously typing the same code over and over again. The second is when you discover the Holy Grail and you would like to pass this information on to other users for free. (For free? We mean $10,000 a pop.) 
As we have done with other analysis techniques, let’s create a function from scratch. Go under the File menu and go to New. When the dialog box opens, select Function. Type “ChoppyMarketIndex” in the name field, and “This function determines market choppi-ness” in the Short Description field. As you probably can deduce from the name of this
TradeStation Analysis Techniques 69 
function, we are attempting to measure a market’s indecisiveness. You will notice that we must inform TradeStation of the type of data that our function will return. All functions must return a value (the result of the function’s calculations). Most of the time, a function will return either a Numeric or a Boolean value. A function can also return a string value (a letter or a string of letters), but we have never encountered the need for this. Click on Numeric simple and hit OK. When you have a blank EasyLanguage document, type the following code: 
{Choppy Market Index Function 
This function returns a value from 0 to 100. 
A lower value denotes higher market indecisiveness (choppiness), 
whereas a higher value denotes a trending market. 
The only input is the number of bars that we look back.} 
Inputs: periodLength(NumericSimple); 
Vars: num(0),denom(1); 
if(periodLength<>0) then 
begin 
denom = Highest(High,periodLength) - Lowest(Low,periodLength); 
num = Close[periodLength-1] - Close; num = AbsValue(num); 
ChoppyMarketIndex = 0.0; 
if(denom<>0) then ChoppyMarketIndex = num/demon*100; 
end; 
Did you notice how this function was made up of other functions (building blocks)? We calculated the denom (denominator) by using the Highest and Lowest functions. We calculated the num (numerator) by using AbsValue (returns the absolute value of a number) functions. The only confusing snippet of code in this function is probably: 
Close[periodLength-1] - Close 
You may be asking why we subtracted 1 from the periodLength. This is a great question. If you incorporate today’s closing price into a calculation, then the closing price 30 days ago would be referenced by Close[29]. Remember that Close[1] is yesterday’s closing price, not today’s. Since we want our index to flow between 0 and positive 100, we remove the negative sign of a down move in the market. We are interested only in absolute distances. 
Becoming a good EasyLanguage programmer does not require an in-depth knowl-edge of the intricacies of all of the built-in functions. It does, however, require knowl-edge of how to put all of the pieces together. (Maybe we really should call ourselves masons instead of programmers.) The function that we just typed in and verified can be used to determine the current choppiness of a market. Later on, when we begin to develop successful trading strategies, we will use this function as a building block. The ChoppyMarketIndex function determines market choppiness by dividing the change in market price for the past 30 days by the total distance the market has traveled during that time period. If the net change in market price is small and the market has demonstrated
70 BUILDING WINNING TRADING SYSTEMS WITH TRADESTATION 
wild swings, the ChoppyMarketIndex function will return a small number. In the follow-ing description of our function, we assume the periodLength is equal to 30. We deter-mine the price change for the past 30 days by subtracting the closing prices of 30 days ago from today’s closing price. The variable num is assigned this value. We then deter-mine the total distance the market has traveled by subtracting the lowest low for the past 30 days from the highest high of the past 30 days. The variable denom is assigned this value. The ChoppyMarketIndex is then assigned the value of num divided by denom 
multiplied by 100. Since the change in market price for the past 30 days will always be equal to or smaller than the total distance the market has moved over the same time pe-riod, our function will always return a number between 0 and 100. You will notice that we have made the function flexible. We used an input as the period length. By doing this, we have allowed the user of this function the ability to change the number of days that is used in the calculation. If you are developing a short-term strategy, then you would prob-ably pass the function a short period length, and vice versa. Once you have finished your calculations for a function, you must assign a value to the name of the function. In this case, we assigned our final calculation to ChoppyMarketIndex, the name of our function. If you forget to do this, the function will not return an accurate value. This function is ac-tually useful and will be the basis for one of the strategies that we develop in Chapter 6. Did you notice that in the inputs statement of this function we used NumericSimple in-side the parentheses of our input variable, periodLength? “Why did we do this and why didn’t we simply type a default value for the input variable?” you may inquire. Again, this is a wonderful question, and since functions are the backbone of TradeStation, it should be answered in great detail. 
Functions are in some ways similar to other analysis techniques, but overall they are quite different. Think of functions as separate subprograms. These subprograms are designed to calculate and change the value of some variable. Indicators, ShowMe, and PaintBars are designed to graphically represent an idea or a mathematical expression. When we create a function, TradeStation needs to know ahead of time what type of vari-able the function would return. TradeStation also needs to know the type of information that is being passed to the function, which is why we used the keyword “NumericSimple” in the input statement. The function’s input statement is its interface with the program or analysis technique that called it. It is the doorway through which data and information pass. In computer lingo, it is also known as the formal parameter or argument list. Like the function itself, a parameter can be of subtype simple, series, or reference. We haven’t yet discussed the reference type, but we will, due to its powerful capabilities. 
Simple parameters are constant values that are set in the trading strategy or analysis technique that calls the function. Our periodLength parameter is of this type. Simple parameters require less memory and improve overall execution speed. They retain their values within the function and cannot be modified within the body of the function. In other words, you can’t change their value once inside the body of the function, period. Like simple parameters, series parameters are constant values that are set in the trading strategy or analysis technique that calls the function. However, when the function refers to previous values of the input variable you use as the parameter, then this parameter
TradeStation Analysis Techniques 71 
must be defined as a series parameter. Current and historical values of the input variable are accessible from within the body of the function. This allows the function to refer to the previous bar’s value of the parameter. Confusing, isn’t it? Let’s say you create a func-tion that sums the differences between two data or price series. To make the function as flexible as possible, you want to give the user or caller of the function the ability to choose which data series is used. With this in mind, you would program the function to accept NumericSeries-type data. Take a look at the following code, as it might help clear up some of this confusion. 
{SumDiff - sum up the difference between two data series} 
Inputs: dataSeries1(NumericSeries),dataSeries2(NumericSeries), 
length (NumericSimple; 
Vars: sum(0); 
for Value1 = 0 to 20 
begin 
sum = sum + (dataSeries1[value1] - dataSeries2[value1]); 
end; 
SummDiff = sum; 
See how we used the keyword “NumericSeries” in the function’s input statement? This prepares TradeStation, ahead of time, to accept the history of the variable that is passed to the function. In computer lingo, this preparation is known as function pro-
totyping. So, to summarize, a simple parameter is just one value, whereas a series pa-rameter is a list of values. Like simple parameters, series parameters cannot be changed within the body of the function. Parameters can be passed to a function by value or by reference. When the parameter passes information by value, as is the case with simple and series-type parameters, the function creates a copy of the information passed into it, and whatever is done with the parameter in the function does not affect the value of the parameter within the trading strategy or analysis technique that called the function. When information is passed by reference, the function uses the original information from the trading strategy or analysis technique that called the function, and any calculations that are performed on the parameter are reflected in the value of the parameter within the analysis technique that called the function as well as within the function. Why on earth would you want to do this? Remember how we are always comparing EasyLan-guage to modern-day, high-level programming languages? Most programming languages have two types of subprograms: functions and subroutines. Functions are used when a calculation returns only one value. Subroutines are used when more than one value is calculated or a chore is needed to do more than just simply return a value of a cal-culation. The programming that went into the creation of TradeStation uses functions and subroutines. When you click on a menu, a subroutine is called to handle the actual drawing of the menu list and another subroutine is called to handle whatever command you choose from the menu. These subroutines do more than just return single values. Since we are not programming a graphical user interface, we will simply use the refer-
ence type and functions to return multiple values. In all honesty, you probably will use
72 BUILDING WINNING TRADING SYSTEMS WITH TRADESTATION 
reference-type parameters only on rare occasions. The following function demonstrates the proper use of these types of parameters. 
{Function ZoneBands by George Pruitt -
Illustrates the power of passing parameters by reference.} 
Inputs: zBand1(NumericRef),zBand2(NumericRef), 
zBand3(NumericRef),zBand4(NumericRef),length(NumericSimple); 
Vars: myAverage(0),myAtr(0); 
myAverage = Average(Close,length); 
myAtr = AvgTrueRange(length); 
zBand1 = myAverage + (myAtr/2); 
zBand2 = myAverage + myAtr; 
zBand3 = myAverage - (myAtr/2); 
zBand4 = myAverage - myAtr; 
ZoneBands = 1; 
This function does not seem to return a significant value; however, it does return a value out of pure necessity. All functions must return a value. In the case of ZoneBands, the statement that assigns a value to the function name is there only for syntactical cor-rectness. This function in fact returns four different and significant values. Maybe we shouldn’t use the term “return.” This function modifies the four parameters (zBand1, zBand2, zBand3, zBand4) that are passed as NumericRef type. Once they are changed within the body of the function, they are forever changed. We were able to calculate four variables from one function call. The following snippet of code illustrates how to use this type of function call. 
Vars: myBand1(0),myBand2(0),myBand3(0),myBand4(0),tempReturnVal(0); 
TempReturnVal = ZoneBands(myBand1,myBand2,myBand3,myBand4,20); 
Plot1(myBand1,"Band 1"); 
Plot2(myBand2,"Band 2"); 
Plot3(myBand3,"Band 3"); 
Plot4(myBand4,"Band 4"); 
Every time ZoneBands is called, the four variables are modified. We assigned a tem-porary variable the value that is returned from the call to ZoneBands. 
STRATEGIES 
Strategies are a major part of this book. Indicators are used more or less as tools, whereas strategies are used as the mechanisms to generate exact buy and sell signals. Strategies are the vehicles that most third-party developers use to sell their ideas. You may not be-lieve us when we say that a good portion of TradeStation users only use their software as an interface for these strategies for hire. We don’t have a problem with this. TradeSta-tion can be used as a research tool or as a tool for information dissemination. As you have seen from the previous chapters, strategies are programmed in similar fashion to
TradeStation Analysis Techniques 73 
other analysis techniques. They all use data types, incorporate assignments and/or de-cisions, and do mathematical calculations. The one thing that separates strategies from other analysis techniques is that they issue orders. As we have discussed, TradeStation can place three types of orders: market, limit, and stop. Market orders can be placed this 
bar on close or next bar at market. Strategies can place multiple orders for any single bar. TradeStation has two rules that determine which orders get filled: 
1. Orders on close and next bar at market 
2. Stop and limit orders 
Orders placed to be filled this bar on close have the highest priority. Once all of these orders have been filled, the next bar at market orders are evaluated. If there is more than one order with the same execution method, the order that was placed first in the strategy takes priority and is filled first. 
Once all market orders are evaluated, the Trading Strategy Testing Engine analyzes stop and limit orders. If there are multiple stop or limit orders, then TradeStation gives a higher priority to the order that is closest to the market (closest to the current price). This is done in order to simulate how stop and limit orders are actually filled. If a symbol is trading at 649, and there are two limit orders to buy—one at 648 and one at 647—as the market drops, the order to buy at 648 would be filled first, and the order to buy at 647 would be filled second. Therefore, TradeStation fills these orders in that way, producing results that are as realistic as possible. If stop orders are used and you have two orders to buy, at 650 and 651, and the current price is 649 and rising, then the 650 stop is filled first and then the 651. By generating exact entry and exit orders, strategies can be back-tested over several years of historical data to determine effectiveness. (Chapter 5 is dedicated to the analysis of strategy performance and optimization.) The rest of this chapter will illustrate how to create trading strategies utilizing built-in EasyLanguage functions. 
{ADX and [[Moving Average]] based Strategy 
ADX by Wells Wilder—ADX determines trendiness} 
Inputs: adxLength(14),mavLength1(9),mavLength2(19); 
Vars: adxVal(0); 
adxVal = ADX(adxLength); 
if(adxVal>=15) then {we are in trending mode} 
begin 
if(Average(Close,mavLength1)crosses above Average(Close,mavLength2))then 
buy tomorrow at High stop; 
if(Average(Close,mavLength1)crosses below Average(Close,mavLength2))then 
sellshort tomorrow at Low stop; 
end; 
if(adxVal<15) then {we are not in trending mode} 
begin 
if(MarketPosition = 1) then Sell next bar at Lowest(Low,4) stop; 
if(MarketPosition =-1) then BuyToCover next bar at Highest(High,4) stop; 
end;
74 BUILDING WINNING TRADING SYSTEMS WITH TRADESTATION 
TABLE 4.1 How TradeStation Calculates the Highest [[Moving Average]] Value 
Day Close 9-Day Avg Max. of 20 Avg. Vals 
1 94.50 2 95.25 3 94.00 4 93.50 5 94.00 6 94.25 7 95.00 8 95.50 9 95.75 94.64 
10 96.00 94.81 11 95.00 94.78 12 95.25 94.92 13 95.00 95.08 14 94.50 95.14 15 93.75 95.08 16 92.50 94.81 17 91.75 94.39 18 92.25 94.00 19 93.00 93.67 20 93.25 93.47 21 93.50 93.28 22 94.00 93.17 23 94.25 93.14 24 94.50 93.22 25 95.00 93.50 26 95.50 93.92 27 96.25 94.36 28 96.75 94.78 95.14 29 97.00 95.19 95.19 30 97.25 95.61 95.61 
This simple strategy incorporates the ADX and Average functions. You may have noticed the words “crosses above” and “crosses below” in these functions. These are keywords that provide a shortcut: 
if(Average(Close,mavLength1) crosses above Average(Close,mavLength2)) then 
is the same as 
if(Average(Close,mavLength1)[1] < Average(Close,mavLength2)[1] and 
Average(Close,mavLength1) > Average(Close,mavLength2) then 
Not only does this save on keystrokes, it also saves on potential typos. We would suggest using these keywords whenever possible. This strategy uses the ADX indicator
TradeStation Analysis Techniques 75 
to determine market trend and [[Moving Average|moving average]] crossover to initiate positions. If the ADX determines that the market is no longer trending, the system looks to exit the market with a tight stop. 
Embedded Functions 
Inputs: movAvgLength1(9),channelLength(20); 
value1 = Highest(Average(Close,movAvgLength1),channelLength); 
value2 = Lowest (Average(Close,movAvgLength1),channelLength); 
Buy tomorrow at value1 stop; 
Sellshort tomorrow at value2 stop; 
This extremely simple system demonstrates how EasyLanguage calls a function within another function call. EasyLanguage evaluates the function calls from inside out. So, the following statement: 
value1 = Highest(Average(Close,movAvgLength1),channelLength); 
first calls the Average function using the closing prices for the past nine days. The High-
est function is then called and evaluates the past individual 20 bars’ [[Moving Average|moving average]] values. It is hard to visualize how EasyLanguage evaluates the two functions. Table 4.1 illustrates this process used to calculate value1. 
Momentum, [[RSI]]-Based Strategy with Built-in Money Management 
Inputs: momLength(14),rsiLength(14),protStop$(3000), 
trailStopThresh$(3000),trailStopPrcnt(25); 
if(Momentum(Close,momLength)>0 and [[RSI]](Close,rsiLength) crosses below 60) 
then 
begin 
buy("Mom+RetB")next bar at Lowest(Low,3) limit; 
end; 
if(Momentum(Close,momLength)<0 and [[RSI]](Close,rsiLength) crosses above 40) 
then 
begin 
SellShort("Mom-RetS") next bar at Highest(High,3) limit; 
end; 
SetStopLoss(protStop$); 
SetPercentTrailing(trailStopThresh$,trailStopPrcnt); 
This strategy calls the Relative Strength Index ([[RSI]]) and Momentum functions. The [[RSI]] determines overbought and oversold conditions, whereas the Momentum 
function determines trend direction. The strategy buys the market when it senses a re-tracement from the short-term trend; momentum is positive and the [[RSI]] is exiting the overbought region. Just the opposite is true for shorting the market. Again we used the keywords “crosses above” and “crosses below.” You will notice two new function calls: SetStopLoss and SetPercentTrailing.
76 BUILDING WINNING TRADING SYSTEMS WITH TRADESTATION 
SetStopLoss informs TradeStation to limit losses to the amount that is passed to the function. In our code, that amount is $3,000. This is yet another shortcut that makes life a whole lot easier. You can, of course, program your own protective stops. If you are using a simple fixed money management stop, then we would suggest using this function to save programming time (well, not all of the time—in the next paragraph, we explain situations where SetStopLoss is sometimes inaccurate). 
SetPercentTrailing informs TradeStation to invoke a trailing stop after a certain threshold of profit has been achieved. In our strategy, we set the threshold to $3,000. Once the threshold of profit is met, TradeStation will risk a specific percentage of max-imum open profit. In our snippet of code we used 25 percent. This may be easier to understand with a concrete example. Let’s say we entered a long S&P 500 position at 1,345.00 and the market went to 1,357.00 ($3,000 open profit). TradeStation would then try to lock in $2,250 (75% of open profit) if the market went against our profit. If the market moves higher, TradeStation will trail the high of the day in a fashion that will risk only 25 percent of total open profit. This is an effective trailing stop; the profit ob-jective allows the market room to gyrate without premature trade termination. There is a danger involved with this built-in trailing stop if you use too tight a trailing stop per-cent on daily bars. This stop mechanism needs to know which occurred first—the high or the low of the day; did the market open and then move higher and pull our trailing stop up and then move down and stop us out? Or did the market first move down and stop us out and then move up and make new highs? This type of information cannot be discerned from a daily bar. We like the concept of this type of stop, but to be as accurate as possible, we would use the SetPercentTrailing only with intraday data. You can get around this problem by programming the trailing stop yourself and by trailing the stop from the high of the previous day. This would prevent the need for the chronological order of the high and low of the day. This may cause you to lose some historical back-testing profit if today’s high goes higher than yesterday’s high and then retraces back to the trailing stop (we have prevented TradeStation from exiting on the day a new high is made), but the accuracy of testing should increase. While we are on the subject of 
FIGURE 4.6 Incorrect Daily Bar Assumption
TradeStation Analysis Techniques 77 
accuracy, the SetStopLoss function also suffers from this ailment. Any time you en-ter and exit on a daily bar (other than entering on the open and exiting on the close), this type of error can creep into your historical analysis. Keep in mind, this applies only to historical back-testing on daily bars. If you back-test on intraday data or trade on real-time daily bars, this type of error will not occur. We discuss this problem and TradeStation’s attempt to solve it in Chapter 6. Figure 4.6 illustrates an incorrect daily bar assumption. 
User-Defined Percent Trailing Stop 
Inputs: trailStopThresh$(3000),trailStopPrcnt(25); 
Vars: maxPositionProf(0),longLiqPoint(0),prevMarketPosition(0); 
If(MarketPosition <>prevMarketPosition) maxPositionProf = 0; 
PrevMarketPosition = MarketPosition; 
if(MarketPosition = 1) then 
begin 
maxPositionProf = MaxList(High - EntryPrice,maxPositionProf); 
if(maxPositionProf*BigPointValue >= trailStopThresh) then 
begin 
longLiqPoint = EntryPrice + (maxPositionProf * (1-
trailStopPrcnt/100.0)); 
sell ("TrailLongLiq") next bar longLiqPoint stop; 
end; 
end; 
CONCLUSIONS 
Several different forms of analysis techniques were discussed: 
 Indicator—a graphic representation of a mathematical calculation.  PaintBar and ShowMe—graphic demarcation of a mathematically based criterion.  Function—the most important programming component in the concepts of reusable 
code and the dissemination of information.  Strategy—the natural conclusion of all of our programming knowledge. This is the 
vehicle that we use to create a mechanical trading plan. 
We also touched upon the problems with back-testing on daily bars. The best rule of thumb for back-testing on daily bars is to prevent entries and exits on the same daily bar (unless your entry or exit is on the open or close of the bar). The following chapters use this new knowledge to propel us into the world of trading strategies (the guts and the glory). The remainder of the book is where you will find its heart and soul. You will also find a ton of programming code. This code should reinforce what you have already learned and also take you well beyond the status of a beginning EasyLanguage programmer.
C H A P T E R 5 
Measuring Trading System Performance 
and System Optimization 
B efore you can design a good trading strategy, you must first know what one is. 
The validity of a strategy is defined by its trading performance. In this chapter, we cover the key performance statistics that separate the good strategies from 
the bad. Today, with the use of TradeStation, EasyLanguage, and back-adjusted data, we can test an infinite number of different strategies on thousands of different tradable instruments. Twenty years ago only a handful of people throughout the world had this power. Power can be used or abused. In addition to performance statistics, the concepts of parameter robustness and overoptimization are discussed. 
Omega Research’s System Writer was one of the first software packages to provide back-testing capabilities and trading-performance analysis. Through the years and a cou-ple of name changes, this software package has evolved. In its latest incarnation, back-testing has become much easier to facilitate, and the number of trading performance statistics has increased tenfold. Unfortunately, throughout the years, one key analysis tool still has not found its way into TradeStation: portfolio analysis. We have the ability to microscopically analyze a trading strategy on a particular market, but we can’t analyze the interaction of a strategy on a portfolio of different markets. Sure, we can have multi-ple tests of a strategy on different markets, but we can’t see how trading several markets simultaneously will affect the bottom line. To illustrate this point, let’s assume that we have developed a trading strategy and have tested it on the U.S. bond and soybean mar-kets. After applying the strategy to the two charts, we end up with two performance reports. From these reports, we extract the profit or loss and maximum draw down fig-ures (maximum draw down is the biggest dollar drop in account value—actual or paper loss). To get the total profit or loss of the two markets, we simply add these two results together. To get the maximum draw down of the two markets, you can’t simply add the two values together. Draw downs for noncorrelated markets almost always occur at dif-ferent times. Therefore, the overall maximum draw down of the two markets will always 
79
80 BUILDING WINNING TRADING SYSTEMS WITH TRADESTATION 
TABLE 5.1 The Magic of Diversification 
Account U.S. Bonds Account Soybeans Overall Strategy A $Value Draw Down $Value Draw Down $Value Draw Down 
January $1,000 $0 $400 $0 $1,400 0 February ($500) ($1,500) $500 $0 $0 ($1,400) March ($1,000) ($2,500) $700 $0 ($300) ($1,700) April $250 ($2,500) $1,200 $0 $1,450 ($1,700) May $1,000 ($2,500) $750 ($450) $1,750 ($1,700) June $3,000 ($2,500) $250 ($950) $3,250 ($1,700) 
U.S. Bonds Soybeans Overall Max. Draw Down Max. Draw Down Max. Draw Down 
($2,500) ($950) ($1,700) 
be equal to or less than the combined draw downs. This is the magic of diversification. When you are looking at a single market analysis, you don’t see the interaction of the other markets in your portfolio. If you are actually trading the U.S. bonds and soybeans, you know that these two markets move independently of each other. If you are losing in a bond position, you may be winning in a soybean position—in effect offsetting a loser with a winner. Table 5.1 illustrates the magic of diversification. 
We feel this is a huge oversight. Fortunately, RINA Systems, a third-party software developer, has created a solution for this problem. With its software and TradeStation, you can test a basket of different commodities or stocks and evaluate how a particular strategy performs at the portfolio level. TradeStation Technologies, Inc. purchased the rights to this software in late 2010; by the time this book is published, this functionality will probably be included in the software. However, as of this writing, it is not available. Since we have discussed portfolio analysis with such gusto, you may be asking, “Is testing a portfolio of markets simultaneously necessary in the determination of a good trading strategy?” The answer would be no. We feel that even with this limitation, you can still develop a good strategy by testing over a well-diversified portfolio. If a strategy tests well on most of the markets in a diversified portfolio, then you may have a good strategy. If a strategy does well only in a small sector of markets that are highly correlated (markets that move somewhat in unison), then you may have an okay system that will probably generate higher draw downs. Testing markets on a simultaneous basis can give a more accurate initial capital allocation reading and open the door for in-depth money man-agement research. Even though we can’t test at the portfolio level, let’s forge ahead and utilize the tools that are available. 
TRADESTATION’S SUMMARY REPORT 
Let’s take a look at the performance statistics generated by TradeStation by plotting a chart of 2,000 daily bars of the Japanese Yen and applying MyStrategy-1 (the first strategy
Measuring Trading System Performance and System Optimization 81 
we developed in Chapter 1). After you have applied the strategy, go under the View menu and select View Strategy Performance. Click on the Summary tab. A report similar to the one in Table 5.2 should show up on your screen. This summary report has most of the statistics you need to help in your search for a good trading strategy. There is a lot of information here, but some of the statistics, in our opinion, are superfluous. We will touch upon only the most influential ones. 
Total Net Profit 
This performance statistic is the brass ring that most inexperienced strategy developers reach for. You might think that a strategy that maximizes profit is the way to go. If you had Bill Gates’s net worth, this would be true. Most traders have limited capital and must monitor risk at all times. What’s wrong with a strategy that makes $100,000 and has a $50,000 draw down? Doesn’t the end justify the means? The one question that you must ask yourself when looking at the performance of such a system is, When did the draw down take place? Did it happen right off the bat when you had only $10,000 in trading capital? Or did it happen after you had an additional 100K in the bank? If you don’t have at least $50,000 in trading capital, then forget about it and go on with your search. Also, this statistic tells you nothing about how the profits were distributed through time. Would you trade a strategy on a market that made all of its money over a short period of time while it lost or was dormant for the rest of the test period? Another question: Which is better—a strategy that makes $75,000 in the NASDAQ futures, or a strategy that makes $35,000 over the same time period in soybeans? If you were to ask us this question, we would say the soybean strategy. Sure, it made only 46 percent as much as the NASDAQ system, but it did it with a market that has one-tenth or less in dollar moves. This implies a heck of a lot less risk. When you are developing strategies, use this statistic as a benchmark and not as an absolute goal. Of course, you want a strategy with a positive expectation, but let’s use this statistic in concert with other equally important statistics. 
Maximum Intraday Draw Down 
This statistic is equally important as total net profit. However, the importance is some-what diluted if you are planning on trading a diverse portfolio. Maximum Draw Down (or should we refer to this as meltdown?) is calculated by finding the highest peak in the equity curve and subtracting the subsequent lowest trough in the curve. In other words, how much money did an account value go down before the account made a new eq-uity high? There are two forms of maximum draw down: closed trade and open trade. Closed trade draw down occurs after a trade is closed out, and open trade draw down occurs while a trade is still on. Let’s say you are trading a long-term U.S. bond strategy and you have a short position when the Fed announces a surprise cut in interest rates. Assume the surprise rate cut causes the bond futures market to rise three full points by the end of the day. By this time your account value has dropped $3,000. You have just experienced an open trade draw down of $3,000. Now, let’s go a little further with our hypothetical scenario. The next morning, after a few hours of rumors, gossip, and
82 BUILDING WINNING TRADING SYSTEMS WITH TRADESTATION 
TABLE 5.2 Summary Performance of MyStrategy-1 on JY 
TradeStation Strategy Performance Report 
TradeStation Strategy Performance Report—MyStrategy-1 @US-Daily (11/01/2001–11/14/2011) 
Performance Summary: All Trades 
Total Net Profit $33,218.75 Profit Factor 1.77 Gross Profit $76,125.00 Gross Loss ($42,906.25) Open Position Profit/Loss $25,468.75 
Total Number of Trades 30 Percent Profitable 50.00% Winning Trades 15 Losing Trades 15 Even Trades 0 
Avg. Trade Net Profit $1,107.29 Ratio Avg. Win:Avg. Loss 1.77 Avg. Winning Trade $5,075.00 Avg. Losing Trade ($2,860.42) Largest Winning Trade $18,437.50 Largest Losing Trade ($6,593.75) Largest Winner as % of 
Gross Profit 24.22% Largest Loser as % of Gross 
Loss 15.37% Max. Consecutive Winning 
Trades 5 Max. Consecutive Losing 
Trades 4 Avg. Bars in Winning 
Trades 115.2 Avg. Bars in Losing Trades 38.67 Avg. Bars in Total Trades 76.93 
Max. Shares/Contracts Held 1 Account Size Required $12,343.75 
Return on Initial Capital 33.22% Annual Rate of Return 2.93% Return Retracement Ratio 0.1 RINA Index 12.87 
Trading Period 9 Yrs, 9 Mths, 15 Dys 
Percent of Time in the Market 99.97% 
Max. Equity Run-up $70,843.75 
Max. Draw Down (Intraday Peak to Max. Draw Down (Trade Close to Trade Valley) Close) Value ($24,343.75) Value ($12,343.75) Net Profit as % of Draw 
Down 136.46% Net Profit as % of Draw Down 269.11% Max. Trade Draw Down ($6,593.75) 
Long Trades 
Total Net Profit $40,343.75 Profit Factor 3.54 Gross Profit $56,250.00 Gross Loss ($15,906.25) Total Number of Trades 15 Percent Profitable 53.33% Winning Trades 8 Losing Trades 7 Even Trades 0 Avg. Trade Net Profit $2,689.58 Ratio Avg. Win:Avg. Loss 3.09 Avg. Winning Trade $7,031.25 Avg. Losing Trade ($2,272.32) Largest Winning Trade $18,437.50 Largest Losing Trade ($3,656.25)
Measuring Trading System Performance and System Optimization 83 
TABLE 5.2 (Continued) 
Long Trades 
Max. Consecutive Winning Trades 3 
Max. Consecutive Losing Trades 2 
Avg. Bars in Winning Trades 139.88 Avg. Bars in Losing Trades 39.57 Max. Shares/Contracts Held 1 Account Size Required $6,000.00 
Max. Draw Down (Intraday Peak to Max. Draw Down (Trade Close to Trade Valley) Close) Value ($21,468.75) Value ($6,000.00) Net Profit as % of Draw Down 187.92% Net Profit as % of Draw Down 672.40% 
Max. Trade Draw Down ($3,843.75) 
Short Trades 
Total Net Profit ($7,125.00) Profit Factor 0.74 Gross Profit $19,875.00 Gross Loss ($27,000.00) 
Total Number of Trades 15 Percent Profitable 46.67% Winning Trades 7 Losing Trades 8 Even Trades 0 
Avg. Trade Net Profit ($475.00) Ratio Avg. Win:Avg. Loss 0.84 Avg. Winning Trade $2,839.29 Avg. Losing Trade ($3,375.00) Largest Winning Trade $5,656.25 Largest Losing Trade ($6,593.75) 
Max. Consecutive Winning Trades 2 
Max. Consecutive Losing Trades 2 
Avg. Bars in Winning Trades 87 Avg. Bars in Losing Trades 37.88 
Max. Shares/Contracts Held 1 Account Size Required $15,125.00 Net Profit as % of Largest Loss −108.06% 
Max. Draw Down (Intraday Peak to Max. Draw Down (Trade Close to Trade Valley) Close) Value ($24,375.00) Value ($15,125.00) Net Profit as % of Draw Down −29.23% Net Profit as % of Draw Down −47.11% Max. Trade Draw Down ($6,593.75) 
information digestion, the bond market gaps down a full point and, over the next few days, trades back down to your entry price. Over the next few weeks, the bond market trades in a range and you finally get out of the position with a $500 loss. You have just experienced a closed trade draw down of $500. Which figure do you think is more impor-tant? The open trade draw down is more important to the trader with $2,000 than to the trader with $40,000. We feel that the maximum open trade draw down prepares a trader for the worst-case scenario. TradeStation reports maximum draw down in this manner. Total net profit equates to reward, whereas maximum draw down equates to risk. As a
84 BUILDING WINNING TRADING SYSTEMS WITH TRADESTATION 
strategy developer and trader, you should try to maximize the risk-to-reward ratio within your financial boundaries. 
Account Size Required and Return on Account 
You will probably notice that the Account Size Required statistic is the same as the Max-imum Intraday Draw Down. Basically, TradeStation is stating that an account should be funded by the amount that the system has drawn down on a historical basis. We feel this is insufficient. The industry rule of thumb for funding a trading account is two or three times maximum draw down. You may be wondering, Why double or triple the worst-case scenario to come up with the starting capital? If a system has been tested over many years, then shouldn’t the future maximum draw down fall in the range of historic param-eters? This type of thinking is what makes many stock and futures traders fail within the first year of trading. You must understand that historic performance statistics have the benefit of hindsight. Any system or indicator development requires a certain level of curve-fitting. Curve-fitting is the testing, changing, retesting process that a developer goes through to produce a winning system. There is nothing wrong with this, unless you go overboard. Curve-fitting customizes a trading idea to the historical data. The more you curve-fit, the more you force history to repeat itself into the future. You may have thought the maximum draw down was the worst-case scenario, when in fact you were looking through rose-colored glasses. With this in mind, you should capitalize a trading account sufficiently to endure more than just the historic maximum draw down. Again, the lack of diversification analysis rears its ugly head. Remember when we touched upon this subject and demonstrated that overall maximum draw down can be reduced by trad-ing diversified markets; this figure does not take diversification into consideration. If you were to trade ten different and diverse markets, should you go through and add up the individual maximum draw downs to calculate the initial account funding? We think this is overkill and an inefficient use of capital. We know we just said that this figure alone is not sufficient to fund a trading account, and now we are saying that if you sum all of the maximum draw downs, it would be overkill. Recall, though, that we did state if you were trading a diverse portfolio, this summation of maximum draw down would be inefficient use of capital. If you are trading four foreign currencies, then it may not be a bad formula of initial capital allocation. For these reasons, we feel this statistic is basically useless. The Return on Account would also fall into the useless camp. 
Average Trade 
This statistic is the average profit or loss that you can expect on any given trade. The important word here is “expect.” If you trade a statistically significant number of times and take the average of your profits (or losses), then you should come close to this fig-ure, theoretically speaking, that is. You could rely more on this statistic if back-testing did not incorporate the benefit of hindsight and trade results were normally distributed. Nonetheless, normal distribution statistics are what we have, and we must use what we
Measuring Trading System Performance and System Optimization 85 
have. The importance of this statistic increases with the number of real-time trades; the assumption of normal distribution doesn’t go away, but the benefit of hindsight lessens. Of course, the higher the average trade, the better. Many traders incorrectly place more emphasis on percentage of winning trades than they do on average trade. Intuitively, you may think a system that doesn’t have at least 50 percent wins is a loser. This is not the case. In fact, most profitable trading systems have much less than 50 percent winners. Of the following two systems, which would you trade? 
System A System B 
First Trade −$ 200 $100 Second Trade −$ 150 $ 75 Third Trade $ 400 $125 Fourth Trade $ 500 $ 50 Fifth Trade $1,000 $ 25 Average Trade $ 310 $ 75 Percent Wins 60% 100% 
Maximum Consecutive Winners and Losers 
These two statistics are used more as psychological tools than as analysis tools. Consec-utive losers are, from a psychological standpoint, the aspect of trading that forces most traders to call it quits. Can a typical trader sit through 15 consecutive losing trades? It doesn’t matter that the trades don’t add up to be a big loss. It’s the loss in confidence that gnaws away at your trading plan. If you can live with historic consecutive losses plus a few more, and the other performance statistics are within your risk–reward parameters, then you may have a good fit with your system. 
Number of Trades and Average Number of Bars per Trade 
These two statistics indicate how often a trading system trades and how long one might hold onto a position. If you like a lot of action, then you would want a system that trades frequently and gets out quickly. If you are more of a slow mover, then you would want a system that trades infrequently and holds onto a position for a longer time period. In our experience, the latter type of system is usually the best. The system that trades more frequently must be more profitable due to the increased costs of trade executions. Let’s say a system trades 10 times a year at a cost of $50 a trade. The system must make $500 before it shows any profit. On the other hand, a system that trades five times a year with an associated cost of $50 needs to clear only $250 before it is profitable. 
Average Winning and Losing Trade 
These statistics inform us of the magnitude of money that we can expect to win or lose on average over an extended trading period. Can you make money with a system that
86 BUILDING WINNING TRADING SYSTEMS WITH TRADESTATION 
has a smaller average win than average loss? Absolutely, if the percentage of winning trades is much greater than the percentage of losing trades, you can. Typical trading systems have less than 50 percent wins and an average winning trade that is greater than the average losing trade. The better trend-following systems will take little bites at the market until a big trend occurs. These systems may win only 30 percent of the time, but their average win is three or more times the size of their average loss. Since shorter-term systems are in the market for small amounts of time, their average wins will be much smaller than a system that holds onto a position for months at a time. TradeStation gives almost the exact same statistics on long trades and short trades. This is potentially a nice feature. As a trader, you may want to know if you made all of your money on the long side or the short side. Let’s say, hypothetically, that you were designing a trading system and discovered that you made four times as much on the long side as you did on the short side. As a system developer and potential trader, what would you do with this information? You could change your system to trade less on the short side or trade more on the long side. By doing so, you could make the historical track record look even better. The system developer side of you thinks this is great! The trader side of you doubts the validity of the optimization. Optimization? What optimization? Is it not true that you changed a parameter or two to better fit history? You try to rationalize your decision to optimize by explaining to your trader side that history has proven itself over many years. The system developer side can’t help that the market has had a bullish bias for more than eight years. The trader side gives in because it can’t argue with an empirical test. So, after months of saving money for trading capital, you plunk your $50,000 down and start trading your optimized trading system. The date is January 3, 2000, and the rest is history. Of course, hindsight is 20/20—but that was what you were betting on. We feel that a trading system should be as symmetric (buy rules are just the opposite of sell rules) as possible. We know and believe that bull markets move differently than bear markets. But, we also feel that a trading system should be equipped for any possible circumstances. So, use this information along with the other statistics. Don’t change your trading system or style to try to take advantage of any divergence between long and short profits. 
Sharpe Ratio 
The Sharpe Ratio describes a strategy’s consistency. Subtracting the risk-free interest from the average monthly return and dividing by the standard deviation of the monthly returns calculates the official Sharpe Ratio. The higher the ratio, then the more consistent your returns. Again, this is a normalized statistic that can be used to compare different strategies or markets. The K-Ratio is similar to the Sharpe Ratio in that it measures con-sistency by using linear regression techniques and, therefore, has a different scale factor. 
Rina Index 
The Rina Index is a proprietary calculation that takes net profit, average draw down, and percent time in market into consideration. A Rina Index above 30 usually points to
Measuring Trading System Performance and System Optimization 87 
a productive trading strategy. This index comes from the same company (Rina Systems) that once offered the third-party add-on for portfolio analysis but will soon be built into TradeStation. 
Buy-and-Hold Return 
Did you beat the old buy-and-hold routine? This buy-and-hold statistic is also given, but it really isn’t an informative statistic outside of the world of stocks or stock indices. 
Trades 
If you click on the Trades tab at the bottom of the Performance Report window, a differ-ent window will pop up, giving you trade-by-trade statistics. You can choose standard 
view or advanced. First let’s take a look at the advanced view. (You can do this by se-lecting Adv. from the top-left combo box.) Your screen should look somewhat similar to Table 5.3. Every trade statistic that you could possibly want is given here: signal, entry date and price, exit date and price, profit/loss, percent profit, cumulative profit, commis-sion, slippage, run-up, draw down, entry and exit efficiency, and total efficiency. The key statistics in this report are individual trade run-up and draw down, entry and exit efficien-cies, and total trade efficiency. Individual trade run-up is the total profit amount of your position before the trade was closed out. Individual trade draw down is the total amount that your position was against you before it was closed out. If you notice that your actual profit is considerably less than your run-up profit, then you know that you are leaving too much on the table. You should work on an exit mechanism that locks into a larger portion of the larger run-ups. The draw down figure gives insight into how much the market may move against an eventual profitable trade. In addition, if the draw down figures are too large on an individual basis for you to stomach, then you may want to move on to another system. These two statistics are also known as favorable and adverse trade excursion, respectively. Many people feel these statistics are key in the development of trade man-agement techniques. The entry, exit, and total efficiency statistics are all based on the favorable and adverse excursions. The entry efficiency measures how close the entry price was to the best possible entry price during the trade. If a trade goes only slightly in your favor and then closes out with a sizable loss, then your entry efficiency will be at a low level (entry/exit efficiencies range between 0 percent and 100 percent). The exit efficiency measures how close the exit price was to the best possible exit price during the trade. If a big winner turns into a loser or small winner, then this efficiency will also be at a low level. The total efficiency measures the amount of profit captured from the to-tal extremes of the market during the trade duration. This number can be either positive or negative, based on the result of the trade. According to our numbers on MyStrategy-1 on the Japanese Yen, our approach is not very efficient. This can be attributed to the lack of a money management plan. Nonetheless, it is still overall quite profitable. All of these statistics can give in-depth insight into your trade management methodology. For further information on trade-by-trade excursions and efficiencies, we highly recommend
T A B 
L E 
5 .3 
A d va 
n ce 
d T 
ra d e 
b y 
T ra 
d e 
A n al 
ys is 
o f 
M yS 
tr at 
eg y-
1 
S h 
a re 
s / C 
o n 
tr a 
ct s 
/ U 
n it 
s N 
e t 
P ro 
fi t— 
R u 
n -u 
p / 
T o 
ta l 
# T 
y p 
e D 
a te 
/ T 
im e 
S ig 
n a 
l P 
ri ce 
P ro 
fi t/ 
L o 
s s 
C u 
m N 
e t 
P ro 
fi t 
% P 
ro fi 
t D 
ra w 
D o 
w n 
E ffi 
ci e 
n cy 
E ffi 
ci e 
n cy 
1 Bu 
y 2 
/5 /2 
0 0 
2 Bu 
y $ 
7 0 
.6 6 
1 ($ 
3 ,5 
3 1 
.2 5 
) (5 
.0 0 
% ) 
$ 5 
9 3 
.7 5 
1 4 
.3 9 
% Se 
ll 3 
/7 /2 
0 0 
2 Sh 
o rt 
$ 6 
7 .1 
3 ($ 
3 ,5 
3 1 
.2 5 
) ($ 
3 ,5 
3 1 
.2 5 
) ($ 
3 ,5 
3 1 
.2 5 
) 0 
.0 0 
% (8 
5 .6 
1 % 
) 2 
Se ll 
Sh o rt 
3 /7 
/2 0 
0 2 
Sh o rt 
$ 6 
7 .1 
3 1 
($ 2 
,7 1 
8 .7 
5 ) 
(4 .0 
5 % 
) $ 
2 ,4 
3 7 
.5 0 
4 7 
.2 7 
% Bu 
y to 
C o ve 
r 4 
/3 0 
/2 0 
0 2 
Bu y 
$ 6 
9 .8 
4 ($ 
2 ,7 
1 8 
.7 5 
) ($ 
6 ,2 
5 0 
.0 0 
) ($ 
2 ,7 
1 8 
.7 5 
) 0 
.0 0 
% (5 
2 .7 
3 % 
) 3 
Bu y 
4 /3 
0 /2 
0 0 
2 Bu 
y $ 
6 9 
.8 4 
1 $ 
1 8 
,4 3 
7 .5 
0 2 
6 .4 
0 % 
$ 2 
6 ,9 
3 7 
.5 0 
9 1 
.5 1 
% Se 
ll 7 
/1 5 
/2 0 
0 3 
Sh o rt 
$ 8 
8 .2 
8 $ 
1 8 
,4 3 
7 .5 
0 $ 
1 2 
,1 8 
7 .5 
0 ($ 
2 ,5 
0 0 
.0 0 
) 7 
1 .1 
3 % 
6 2 
.6 3 
% 4 
Se ll 
Sh o rt 
7 /1 
5 /2 
0 0 
3 Sh 
o rt 
$ 8 
8 .2 
8 1 
$ 3 
,7 5 
0 .0 
0 4 
.2 5 
% $ 
1 0 
,7 5 
0 .0 
0 1 
0 0 
.0 0 
% Bu 
y to 
C o ve 
r 9 
/2 4 
/2 0 
0 3 
Bu y 
$ 8 
4 .5 
3 $ 
3 ,7 
5 0 
.0 0 
$ 1 
5 ,9 
3 7 
.5 0 
$ 0 
.0 0 
3 4 
.8 8 
% 3 
4 .8 
8 % 
5 Bu 
y 9 
/2 4 
/2 0 
0 3 
Bu y 
$ 8 
4 .5 
3 1 
$ 2 
,5 3 
1 .2 
5 2 
.9 9 
% $ 
9 ,7 
1 8 
.7 5 
7 1 
.6 6 
% Se 
ll 4 
/2 /2 
0 0 
4 Sh 
o rt 
$ 8 
7 .0 
6 $ 
2 ,5 
3 1 
.2 5 
$ 1 
8 ,4 
6 8 
.7 5 
($ 3 
,8 4 
3 .7 
5 ) 
4 7 
.0 0 
% 1 
8 .6 
6 % 
6 Se 
ll Sh 
o rt 
4 /2 
/2 0 
0 4 
Sh o rt 
$ 8 
7 .0 
6 1 
$ 1 
,3 1 
2 .5 
0 1 
.5 1 
% $ 
6 ,1 
2 5 
.0 0 
7 7 
.4 7 
% Bu 
y to 
C o ve 
r 6 
/3 0 
/2 0 
0 4 
Bu y 
$ 8 
5 .7 
5 $ 
1 ,3 
1 2 
.5 0 
$ 1 
9 ,7 
8 1 
.2 5 
($ 1 
,7 8 
1 .2 
5 ) 
3 9 
.1 3 
% 1 
6 .6 
0 % 
7 Bu 
y 6 
/3 0 
/2 0 
0 4 
Bu y 
$ 8 
5 .7 
5 1 
$ 5 
,3 7 
5 .0 
0 6 
.2 7 
% $ 
9 ,4 
6 8 
.7 5 
9 5 
.8 9 
% Se 
ll 1 
2 /1 
/2 0 
0 4 
Sh o rt 
$ 9 
1 .1 
3 $ 
5 ,3 
7 5 
.0 0 
$ 2 
5 ,1 
5 6 
.2 5 
($ 4 
0 6 
.2 5 
) 5 
8 .5 
4 % 
5 4 
.4 3 
% 8 
Se ll 
Sh o rt 
1 2 
/1 /2 
0 0 
4 Sh 
o rt 
$ 9 
1 .1 
3 1 
($ 4 
,0 9 
3 .7 
5 ) 
(4 .4 
9 % 
) $ 
4 0 
6 .2 
5 9 
.0 3 
% Bu 
y to 
C o ve 
r 1 
2 /1 
5 /2 
0 0 
4 Bu 
y $ 
9 5 
.2 2 
($ 4 
,0 9 
3 .7 
5 ) 
$ 2 
1 ,0 
6 2 
.5 0 
($ 4 
,0 9 
3 .7 
5 ) 
0 .0 
0 % 
(9 0 
.9 7 
% ) 
9 Bu 
y 1 
2 /1 
5 /2 
0 0 
4 Bu 
y $ 
9 5 
.2 2 
1 ($ 
2 ,0 
0 0 
.0 0 
) (2 
.1 0 
% ) 
$ 3 
,5 3 
1 .2 
5 5 
3 .8 
1 % 
Se ll 
3 /9 
/2 0 
0 5 
Sh o rt 
$ 9 
3 .2 
2 ($ 
2 ,0 
0 0 
.0 0 
) $ 
1 9 
,0 6 
2 .5 
0 ($ 
3 ,0 
3 1 
.2 5 
) 1 
5 .7 
1 % 
(3 0 
.4 8 
% ) 
1 0 
Se ll 
Sh o rt 
3 /9 
/2 0 
0 5 
Sh o rt 
$ 9 
3 .2 
2 1 
($ 3 
,2 1 
8 .7 
5 ) 
(3 .4 
5 % 
) $ 
2 ,1 
2 5 
.0 0 
3 9 
.7 7 
% Bu 
y to 
C o ve 
r 4 
/1 9 
/2 0 
0 5 
Bu y 
$ 9 
6 .4 
4 ($ 
3 ,2 
1 8 
.7 5 
) $ 
1 5 
,8 4 
3 .7 
5 ($ 
3 ,2 
1 8 
.7 5 
) 0 
.0 0 
% (6 
0 .2 
3 % 
) 1 
1 Bu 
y 4 
/1 9 
/2 0 
0 5 
Bu y 
$ 9 
6 .4 
4 1 
$ 1 
,3 7 
5 .0 
0 1 
.4 3 
% $ 
5 ,4 
6 8 
.7 5 
8 3 
.7 3 
% Se 
ll 7 
/1 8 
/2 0 
0 5 
Sh o rt 
$ 9 
7 .8 
1 $ 
1 ,3 
7 5 
.0 0 
$ 1 
7 ,2 
1 8 
.7 5 
($ 1 
,0 6 
2 .5 
0 ) 
3 7 
.3 2 
% 2 
1 .0 
5 % 
1 2 
Se ll 
Sh o rt 
7 /1 
8 /2 
0 0 
5 Sh 
o rt 
$ 9 
7 .8 
1 1 
$ 1 
,6 5 
6 .2 
5 1 
.6 9 
% $ 
4 ,9 
0 6 
.2 5 
6 1 
.8 1 
% Bu 
y to 
C o ve 
r 1 
2 /2 
2 /2 
0 0 
5 Bu 
y $ 
9 6 
.1 6 
$ 1 
,6 5 
6 .2 
5 $ 
1 8 
,8 7 
5 .0 
0 ($ 
3 ,0 
3 1 
.2 5 
) 5 
9 .0 
6 % 
2 0 
.8 7 
% 1 
3 Bu 
y 1 
2 /2 
2 /2 
0 0 
5 Bu 
y $ 
9 6 
.1 6 
1 ($ 
1 ,2 
8 1 
.2 5 
) (1 
.3 3 
% ) 
$ 2 
,0 0 
0 .0 
0 6 
0 .9 
5 % 
Se ll 
2 /1 
4 /2 
0 0 
6 Sh 
o rt 
$ 9 
4 .8 
8 ($ 
1 ,2 
8 1 
.2 5 
) $ 
1 7 
,5 9 
3 .7 
5 ($ 
1 ,2 
8 1 
.2 5 
) 0 
.0 0 
% (3 
9 .0 
5 % 
) 1 
4 Se 
ll Sh 
o rt 
2 /1 
4 /2 
0 0 
6 Sh 
o rt 
$ 9 
4 .8 
8 1 
$ 3 
,5 6 
2 .5 
0 3 
.7 5 
% $ 
6 ,7 
8 1 
.2 5 
8 4 
.1 1 
% Bu 
y to 
C o ve 
r 6 
/8 /2 
0 0 
6 Bu 
y $ 
9 1 
.3 1 
$ 3 
,5 6 
2 .5 
0 $ 
2 1 
,1 5 
6 .2 
5 ($ 
1 ,2 
8 1 
.2 5 
) 6 
0 .0 
8 % 
4 4 
.1 9 
% 
88
1 5 
Bu y 
6 /8 
/2 0 
0 6 
Bu y 
$ 9 
1 .3 
1 1 
$ 2 
,6 5 
6 .2 
5 2 
.9 1 
% $ 
6 ,1 
8 7 
.5 0 
6 7 
.3 5 
% Se 
ll 1 
2 /2 
8 /2 
0 0 
6 Sh 
o rt 
$ 9 
3 .9 
7 $ 
2 ,6 
5 6 
.2 5 
$ 2 
3 ,8 
1 2 
.5 0 
($ 3 
,0 0 
0 .0 
0 ) 
6 1 
.5 6 
% 2 
8 .9 
1 % 
1 6 
Se ll 
Sh o rt 
1 2 
/2 8 
/2 0 
0 6 
Sh o rt 
$ 9 
3 .9 
7 1 
($ 1 
,4 6 
8 .7 
5 ) 
(1 .5 
6 % 
) $ 
2 ,2 
1 8 
.7 5 
6 0 
.1 7 
% Bu 
y to 
C o ve 
r 2 
/2 7 
/2 0 
0 7 
Bu y 
$ 9 
5 .4 
4 ($ 
1 ,4 
6 8 
.7 5 
) $ 
2 2 
,3 4 
3 .7 
5 ($ 
1 ,4 
6 8 
.7 5 
) 0 
.0 0 
% (3 
9 .8 
3 % 
) 1 
7 Bu 
y 2 
/2 7 
/2 0 
0 7 
Bu y 
$ 9 
5 .4 
4 1 
($ 2 
,8 1 
2 .5 
0 ) 
(2 .9 
5 % 
) $ 
1 ,2 
5 0 
.0 0 
3 0 
.7 7 
% Se 
ll 4 
/6 /2 
0 0 
7 Sh 
o rt 
$ 9 
2 .6 
3 ($ 
2 ,8 
1 2 
.5 0 
) $ 
1 9 
,5 3 
1 .2 
5 ($ 
2 ,8 
1 2 
.5 0 
) 0 
.0 0 
% (6 
9 .2 
3 % 
) 1 
8 Se 
ll Sh 
o rt 
4 /6 
/2 0 
0 7 
Sh o rt 
$ 9 
2 .6 
3 1 
$ 5 
3 1 
.2 5 
0 .5 
7 % 
$ 5 
,5 0 
0 .0 
0 7 
0 .6 
8 % 
Bu y 
to C 
o ve 
r 7 
/2 6 
/2 0 
0 7 
Bu y 
$ 9 
2 .0 
9 $ 
5 3 
1 .2 
5 $ 
2 0 
,0 6 
2 .5 
0 ($ 
2 ,2 
8 1 
.2 5 
) 3 
6 .1 
4 % 
6 .8 
3 % 
1 9 
Bu y 
7 /2 
6 /2 
0 0 
7 Bu 
y $ 
9 2 
.0 9 
1 $ 
7 ,0 
0 0 
.0 0 
7 .6 
0 % 
$ 1 
3 ,5 
3 1 
.2 5 
9 4 
.1 3 
% Se 
ll 4 
/2 8 
/2 0 
0 8 
Sh o rt 
$ 9 
9 .0 
9 $ 
7 ,0 
0 0 
.0 0 
$ 2 
7 ,0 
6 2 
.5 0 
($ 8 
4 3 
.7 5 
) 5 
4 .5 
7 % 
4 8 
.7 0 
% 2 
0 Se 
ll Sh 
o rt 
4 /2 
8 /2 
0 0 
8 Sh 
o rt 
$ 9 
9 .0 
9 1 
($ 2 
,6 2 
5 .0 
0 ) 
(2 .6 
5 % 
) $ 
2 ,5 
6 2 
.5 0 
4 8 
.8 1 
% Bu 
y to 
C o ve 
r 7 
/7 /2 
0 0 
8 Bu 
y $ 
1 0 
1 .7 
2 ($ 
2 ,6 
2 5 
.0 0 
) $ 
2 4 
,4 3 
7 .5 
0 ($ 
2 ,6 
8 7 
.5 0 
) 1 
.1 9 
% (5 
0 .0 
0 % 
) 2 
1 Bu 
y 7 
/7 /2 
0 0 
8 Bu 
y $ 
1 0 
1 .7 
2 1 
($ 2 
8 1 
.2 5 
) (0 
.2 8 
% ) 
$ 7 
,8 1 
2 .5 
0 6 
8 .6 
8 % 
Se ll 
1 0 
/1 3 
/2 0 
0 8 
Sh o rt 
$ 1 
0 1 
.4 4 
($ 2 
8 1 
.2 5 
) $ 
2 4 
,1 5 
6 .2 
5 ($ 
3 ,5 
6 2 
.5 0 
) 2 
8 .8 
5 % 
(2 .4 
7 % 
) 2 
2 Se 
ll Sh 
o rt 
1 0 
/1 3 
/2 0 
0 8 
Sh o rt 
$ 1 
0 1 
.4 4 
1 ($ 
6 ,5 
9 3 
.7 5 
) (6 
.5 0 
% ) 
$ 3 
,2 5 
0 .0 
0 3 
3 .0 
2 % 
Bu y 
to C 
o ve 
r 1 
1 /1 
9 /2 
0 0 
8 Bu 
y $ 
1 0 
8 .0 
3 ($ 
6 ,5 
9 3 
.7 5 
) $ 
1 7 
,5 6 
2 .5 
0 ($ 
6 ,5 
9 3 
.7 5 
) 0 
.0 0 
% (6 
6 .9 
8 % 
) 2 
3 Bu 
y 1 
1 /1 
9 /2 
0 0 
8 Bu 
y $ 
1 0 
8 .0 
3 1 
$ 6 
,0 3 
1 .2 
5 5 
.5 8 
% $ 
2 0 
,5 6 
2 .5 
0 9 
8 .6 
5 % 
Se ll 
1 /2 
9 /2 
0 0 
9 Sh 
o rt 
$ 1 
1 4 
.0 6 
$ 6 
,0 3 
1 .2 
5 $ 
2 3 
,5 9 
3 .7 
5 ($ 
2 8 
1 .2 
5 ) 
3 0 
.2 8 
% 2 
8 .9 
4 % 
2 4 
Se ll 
Sh o rt 
1 /2 
9 /2 
0 0 
9 Sh 
o rt 
$ 1 
1 4 
.0 6 
1 $ 
3 ,4 
0 6 
.2 5 
2 .9 
9 % 
$ 1 
3 ,0 
9 3 
.7 5 
6 7 
.0 4 
% Bu 
y to 
C o ve 
r 9 
/1 /2 
0 0 
9 Bu 
y $ 
1 1 
0 .6 
6 $ 
3 ,4 
0 6 
.2 5 
$ 2 
7 ,0 
0 0 
.0 0 
($ 6 
,4 3 
7 .5 
0 ) 
5 0 
.4 0 
% 1 
7 .4 
4 % 
2 5 
Bu y 
9 /1 
/2 0 
0 9 
Bu y 
$ 1 
1 0 
.6 6 
1 ($ 
2 ,3 
4 3 
.7 5 
) (2 
.1 2 
% ) 
$ 3 
,6 5 
6 .2 
5 5 
8 .7 
9 % 
Se ll 
1 1 
/6 /2 
0 0 
9 Sh 
o rt 
$ 1 
0 8 
.3 1 
($ 2 
,3 4 
3 .7 
5 ) 
$ 2 
4 ,6 
5 6 
.2 5 
($ 2 
,5 6 
2 .5 
0 ) 
3 .5 
2 % 
(3 7 
.6 9 
% ) 
2 6 
Se ll 
Sh o rt 
1 1 
/6 /2 
0 0 
9 Sh 
o rt 
$ 1 
0 8 
.3 1 
1 ($ 
2 ,3 
4 3 
.7 5 
) (2 
.1 6 
% ) 
$ 2 
,7 1 
8 .7 
5 3 
1 .9 
9 % 
Bu y 
to C 
o ve 
r 3 
/1 7 
/2 0 
1 0 
Bu y 
$ 1 
1 0 
.6 6 
($ 2 
,3 4 
3 .7 
5 ) 
$ 2 
2 ,3 
1 2 
.5 0 
($ 5 
,7 8 
1 .2 
5 ) 
4 0 
.4 4 
% (2 
7 .5 
7 % 
) 2 
7 Bu 
y 3 
/1 7 
/2 0 
1 0 
Bu y 
$ 1 
1 0 
.6 6 
1 ($ 
3 ,6 
5 6 
.2 5 
) (3 
.3 0 
% ) 
$ 2 
8 1 
.2 5 
7 .1 
4 % 
Se ll 
4 /5 
/2 0 
1 0 
Sh o rt 
$ 1 
0 7 
.0 0 
($ 3 
,6 5 
6 .2 
5 ) 
$ 1 
8 ,6 
5 6 
.2 5 
($ 3 
,6 5 
6 .2 
5 ) 
0 .0 
0 % 
(9 2 
.8 6 
% ) 
2 8 
Se ll 
Sh o rt 
4 /5 
/2 0 
1 0 
Sh o rt 
$ 1 
0 7 
.0 0 
1 ($ 
3 ,9 
3 7 
.5 0 
) (3 
.6 8 
% ) 
$ 2 
5 0 
.0 0 
5 .9 
7 % 
Bu y 
to C 
o ve 
r 4 
/2 7 
/2 0 
1 0 
Bu y 
$ 1 
1 0 
.9 4 
($ 3 
,9 3 
7 .5 
0 ) 
$ 1 
4 ,7 
1 8 
.7 5 
($ 3 
,9 3 
7 .5 
0 ) 
0 .0 
0 % 
(9 4 
.0 3 
% ) 
2 9 
Bu y 
4 /2 
7 /2 
0 1 
0 Bu 
y $ 
1 1 
0 .9 
4 1 
$ 1 
2 ,8 
4 3 
.7 5 
(1 1 
.5 8 
% ) 
$ 1 
9 ,0 
9 3 
.7 5 
9 5 
.3 2 
% Se 
ll 1 
1 /9 
/2 0 
1 0 
Sh o rt 
$ 1 
2 3 
.7 8 
$ 1 
2 ,8 
4 3 
.7 5 
$ 2 
7 ,5 
6 2 
.5 0 
($ 9 
3 7 
.5 0 
) 6 
8 .8 
0 % 
6 4 
.1 2 
% 3 
0 Se 
ll Sh 
o rt 
1 1 
/9 /2 
0 1 
0 Sh 
o rt 
$ 1 
2 3 
.7 8 
1 $ 
5 ,6 
5 6 
.2 5 
4 .5 
7 % 
$ 1 
1 ,0 
6 2 
.5 0 
9 5 
.6 8 
% Bu 
y to 
C o ve 
r 3 
/1 /2 
0 1 
1 Bu 
y $ 
1 1 
8 .1 
3 $ 
5 ,6 
5 6 
.2 5 
$ 3 
3 ,2 
1 8 
.7 5 
($ 5 
0 0 
.0 0 
) 5 
3 .2 
4 % 
4 8 
.9 2 
% 3 
1 Bu 
y 3 
/1 /2 
0 1 
1 Bu 
y $ 
1 1 
8 .1 
3 1 
n /a 
n /a 
$ 2 
8 ,8 
7 5 
.0 0 
n /a 
Se ll 
o p en 
n /a 
$ 1 
4 1 
.8 1 
n /a 
n /a 
($ 2 ,7 
8 1 
.2 5 
) n /a 
n /a 
89
90 BUILDING WINNING TRADING SYSTEMS WITH TRADESTATION 
John Sweeney’s Maximum Adverse Excursion: Analyzing Price Fluctuations for Trad-
ing Management. This report will help you verify your translation of trading idea into a mechanical system. If you know that a trade should occur on a certain day at a certain price and it doesn’t show up in the trade-by-trade report, then you know that you haven’t accurately programmed your ideas. 
TRADE ANALYSIS 
Click on the Trade Analysis tab and you will be presented with a report like the one in Table 5.4. 
This report is a statistician’s dream. Every statistic concerning trades under the sun is located in this report. You may recognize some of the statistics from the Summary report. Again, we will go over only the more relevant ones. You can always click on the name of the performance metric and it will provide a pop-up window with a brief expla-nation. These figures may more accurately guide you in allocating initial trading capital. 
1 Std. Deviation of Avg. Trade 
Measures the absolute variability of the returns of the performance field being measured, for N standard deviations (where N is based on your calculation setting for standard deviations). For example, one standard deviation represents roughly 68.2 percent of the normal distributed samples. In theory, the smaller the standard deviation number, the more trades will resemble the average winning (or losing) trade, and the more stable the strategy. 
Number of Outliers 
This metric displays the number of traders not within the normal range of profit or loss for the strategy. An Outlier is defined as a trade that does not appear to fall within the expected range (three standard deviations) for all trades. 
Avg. Efficiency 
Displays the trade’s ability to capture the maximum profit points from the actual trade entry and exit points, for one trade or for all trades over the entire testing period of the strategy. Efficiency is measured for entry and exit points, as well all overall total net profit; 100 percent is perfect efficiency. 
Total 
This displays the trade’s ability to capture the maximum net profit potential of the to-tal price movement during the testing period of the strategy. A result of 100 percent is perfect total efficiency; −100 percent is the worst possible total efficiency.
TABLE 5.4 Trade Analysis of MyStrategy-1 on JY 
All Trades Winners Losers 
Total Number of Trades 30 15 15 Avg. Trade Net Profit $1,102.08 $5,075.00 ($2,870.83) 1 Std. Deviation of Avg. Trade $5,341.14 $4,805.40 $1,475.94 Avg. Trade + 1 Std. Deviation $6,443.23 $9,880.40 ($1,394.89) Avg. Trade − 1 Std. Deviation ($4,239.06) $269.60 ($4,346.78) Coefficient of Variation 484.64% 94.69% 51.41% 
Time Averages 
Avg. Time in Trades 109 Dys, 21 Hrs, 36 Mins 
166 Dys, 3 Hrs, 12 Mins 
53 Dys, 16 Hrs 
Avg. Time between Trades n/a 52 Dys, 12 Hrs 156 Dys Avg. Time between Trade Profit 
Peaks n/a 
Outliers Total Positive Negative 
Number of Outliers 0 0 0 Outlier Profit/Loss $0.00 $0.00 $0.00 
Run-up/Draw Down Run-up Draw Down 
Max. Value $26,937.50 ($6,593.75) Max. Value Date 6/16/2003 11/19/2008 Avg. Value $6,804.17 ($2,642.71) 1 Std. Deviation $6,537.84 $1,718.34 Avg. + 1 Std. Deviation $13,342.01 ($924.37) Avg. − 1 Std. Deviation $266.32 ($4,361.05) Coefficient of Variation 96.09% 65.02% 
Efficiency Analysis Total Entry Exit 
Avg. Efficiency −10.88% 60.73% 28.40% 1 Std. Deviation 51.55% 29.23% 25.98% Avg. + 1 Std. Deviation 40.67% 89.96% 54.37% Avg. − 1 Std. Deviation −62.42% 31.49% 2.42% Coefficient of Variation 473.83% 48.14% 91.49% 
Winners Losers 
Largest Profit/Loss $18,437.50 ($6,593.75) Largest Profit/Loss as % of Gross 24.22% 15.31% Largest Consec. Profit/Loss $31,406.25 ($12,281.25) Largest Consec. Profit/Loss as % 
of Gross 41.26% 28.52% 
Winning Number of Avg. Gain Avg. Loss Series Series per Series Net Trade 
2 5 $4,471.88 ($1,929.69) 5 1 $6,281.25 ($4,093.75) 
Losing Number of Avg. Loss Avg. Gain Series Series per Series Net Trade 
1 1 ($1,281.25) $3,562.50 2 2 ($2,671.88) $9,484.38 3 2 ($3,135.42) $3,703.13 4 1 ($3,070.31) $12,843.75 
Created by TradeStation: 12/1/2011 10:09:13 AM, Copyright C© 1991–2004 TradeStation Technolo-gies, Inc.
92 BUILDING WINNING TRADING SYSTEMS WITH TRADESTATION 
Entry/Exit 
Displays each trade’s ability to capture the maximum profit potential entry point and exit point during the trading period of the trade. The Entry Efficiency measures how close the entry price was to the best possible entry price during the trade. The Exit Efficiency measures how close the exit price was to the best possible exit price during the trade. A result of 100 percent is perfect efficiency, 0 is worst possible efficiency. 
All of TradeStation’s reports can be saved in Microsoft Excel format. This is a great feature for two reasons. First, the general public can open and read the reports with-out owning TradeStation. Second, Microsoft Excel opens another enormous library of analytical tools that can be used with the reports. 
Graphs 
There are other reports that we haven’t discussed that you can select by clicking on their respective tabs. We feel that all TradeStation users should familiarize themselves with these reports. We could write an entire book on the information that is presented in this research, but we really don’t want to bore you more than we already have. Sometimes you can research an idea to death. The last report that we will discuss is the Graphs re-port. This report, along with the Summary, Analysis, and Trades, should give you all of the information that you need to determine the validity and robustness of a trading system. 
Go ahead and click on the Performance Graphs tab. A chart similar to Figure 5.1 should now appear on your screen. 
Again, there is a plethora of different types of information at your disposal. We will confine our discussion to equity graphs. The graph in Figure 5.1 illustrates the distri-bution of returns over the test period. This curve doesn’t look that bad; it is somewhat smooth and sloping upward. The equity scale on the left starts out at $100,000 but can be changed by clicking on the Format window icon in the top-right corner of the window (the one with the hand in it). You can change the format of all the reports by clicking on this icon and changing the parameters from the dialog box. Go ahead and click on this icon. A dialog box similar to the one in Figure 5.2 should pop up on your screen. 
The Format Report Settings dialog box allows you to change the number of standard deviations used in your calculations, the number of periods to be displayed, and display properties of the graphs you view. We usually accept the default property settings, but sometimes we change the number of periods that are reported, and in the case of cur-rencies we usually increase the number of decimals. If we are doing a 20-year test and want a monthly return stream, we will change the number of periods to equal 12 times the number of years. If we are indeed testing 20 years of history, we then multiply 20 by 12 (20 years × 12 months = 240). 
Let’s change the type of equity graph. Find the box that says Equity Curve Line and click on the right down arrow and select Equity Curve Detailed. The first curve shows cumulative profit on a trade-by-trade basis. The second equity curve shows cumulative profit on a daily basis. You can see the real intratrade draw downs with this graph. We like
Measuring Trading System Performance and System Optimization 93 
FIGURE 5.1 Equity Curve of MyStrategy-1 on JY 
FIGURE 5.2 Properties of Performance Report
94 BUILDING WINNING TRADING SYSTEMS WITH TRADESTATION 
FIGURE 5.3 Underwater Equity Curve of MyStrategy-1 
this type of equity curve best. Go back up to the right down arrow and select Underwater 
Equity Curve (weekly). A graph similar to Figure 5.3 should be on your screen. This graph plots the draw downs that were experienced by our strategy during the 
life of the test. As you can see from the graph, we had some substantial periods of losses. This graph can really open your eyes to risk. From this graph, we can see that the strategy had nearly an 8 percent draw down from the beginning. From that point on, we had several draw downs of differing levels. On average, it looks like we had draw downs equal to 10 percent of our initial capital. Once again, click on the right down arrow and select Monthly Net Profit. Another chart like the one in Figure 5.4 will fill your screen. 
This chart plots the net monthly profits during the life of our test. Again, this may be useful information to help you decide on a strategy’s validity and/or fund allocation. You may want to investigate the other graphs and charts. You may come across one that you like better than the ones that we have presented. 
We hope this brief introduction to trading performance measurements has given you a base education to build upon. We feel that with this education, you are prepared to differentiate between a good strategy and one that is not so good. There are several
Measuring Trading System Performance and System Optimization 95 
FIGURE 5.4 Monthly Net Profits of MyStrategy-1 
books written on this subject and we would recommend reading most of them. Tushar Chande’s and Thomas Stridsman’s books should be in every trader’s library. 
OPTIMIZATION OLD SCHOOL STYLE 
Now that we know some of the statistics that are used in trading system performance, let’s see if we can make MyStrategy-1 a better strategy through the use of optimization. You may be asking, “What is optimization?” Optimization is the process of finding the optimum parameter through repeated testing of a strategy using different parameter val-ues. In MyStrategy-1, we have two input variables: longLength and shortLength. These variables determine our exact buy and sell points. Recall when we first programmed MyStrategy-1 in Chapter 1. The strategy goes long when the high of today exceeds the high of the past longLength days and goes short when the low of today exceeds the low of the past shortLength days. We set these inputs to 40 (a somewhat arbitrary value, picked without doing much research). The optimization process will automatically
96 BUILDING WINNING TRADING SYSTEMS WITH TRADESTATION 
change our longLength and shortLength variables (within the boundaries that we set) and rerun the strategy on the different set of parameters. The end result will be a report of the different tests on the different parameters. It is up to us to pick the parameter set that we eventually use. TradeStation offers a simple way to optimize a trading strategy. However, you must prepare your strategy for optimization. When initially programming a strategy, you may want to keep in mind the variables that you may want to optimize in the future. We did this with MyStrategy-1 by making the two optimizable parameters (longLength and shortLength) input variables. Input variables are the only ones that can be optimized. Let’s go ahead and optimize MyStrategy-1 on the U.S. bonds. 
Make sure that the U.S. bonds continuous chart with MyStrategy-1 applied to it is active. If it is not open, just go ahead and recreate a Japanese Yen continuous chart with at least 10 years of history. After the chart appears on your screen, apply MyStrategy-1 to it. Go under the Format menu and select Format Strategies. A dialog box that looks like Figure 5.5 will be on your screen. 
Click on the Format button and another dialog box titled Format Strategy: MyStrategy-1 will open. It will be similar to the one in Figure 5.6. Make sure you are in the Inputs tab. 
Click on longLength and then click the Optimize button, and yet another dialog box will open. Don’t blame us—this is the true benefit of a graphical user interface 
FIGURE 5.5 Format Strategies on MyStrategy-1
Measuring Trading System Performance and System Optimization 97 
FIGURE 5.6 Inputs of MyStrategy-1 
(GUI)–driven application. The GUI allows you to make changes through an infinite num-ber of dialog boxes. You should have a dialog box titled Optimize as the top window on your screen. You should see the number 20 in the Start box, the number 60 in the Stop 
box, and the number 4 in the Increment box. Basically, this dialog box is telling us that TradeStation will repeatedly test the longLength parameter starting at the value of 20 and incrementing it by 4 until it reaches 60. The first test would set longLength to 20 and the next test would set longLength to 24 and so on. Use the following formula to determine the number of tests or iterations: (Stop – Start)/Increment + 1. By substi-tuting our values into the formula, we come up with (60 – 20)/4 + 1 = 11. The number of tests is more important than you may think. Remember, we have two optimizable pa-rameters. How many tests will be necessary to test both parameters simultaneously over our optimization range? Did you say 121 (11×11)? This is why the number of tests is important. The total number of tests increases in a geometric fashion. If we had three parameters and wanted to test over the same optimization range, it would be a total of 11 × 11 × 11 tests. Even with today’s computing power, this could take a while. Go ahead and click OK and select the shortLength parameter and click the Optimize button. You know the routine. Set this parameter optimization range to be the same as longLength. Click OK to get out of the Input dialog box. You should be back to the Format Strategy
98 BUILDING WINNING TRADING SYSTEMS WITH TRADESTATION 
FIGURE 5.7 Optimization of MyStrategy-1 
dialog box. If you are using TradeStation 9.0 or greater, your Format Strategy dialog box will look like the one in Figure 5.7. 
You will notice we have circled two drop-down menu boxes in the figure. You can choose what form of optimization you would like to perform. As you can see, we have chosen standard as the type, and exhaustive as the method. These options are the de-fault values after you set up your optimization ranges for your parameters. Prior to ver-sion 9.0, Standard optimization was the only type of optimization one could perform. TradeStation has now added genetic optimization to its bag of tricks. This has been one of the best enhancements to the program over the past 10 years. A detailed discussion of genetic optimization will follow after we go through how one uses the old but still useful Standard type. Gentlemen, start your engines. Let’s get optimizing by clicking on the Optimize button. 
You may get an alert that says something like you tried to reference too many bars back. Basically, you crashed in turn number one. The whole optimization run is halted, and you must go up under the Format menu and select Format Strategy. Once the all-too-familiar dialog box comes up (you may have to click the Status button to activate the strategy and then you will need to click on the Format button), you will see “Maximum number of bars study will reference.” Change this option to 60 so that you have enough historic data to do your optimization. Click OK, and yet again go through changing
Measuring Trading System Performance and System Optimization 99 
optimization values for the inputs. After you have done this, go ahead and hit the Op-
timize button again. It would be great if TradeStation handled this for you, but it doesn’t. Once everything is set up properly and you are in the optimization process, TradeStation will keep you informed of the status of the process. It tells you the amount of elapsed time, estimated completion time, total number of runs, and current run number. It also tells you the maximum profit attained by optimizing the parameters. The optimization that we prescribed for MyStrategy-1 shouldn’t take that long. Once this is completed, go under the View menu and select Strategy Optimization Report. This will create a spreadsheet like the one in Table 5.5. 
This optimization report gives the statistics on each and every run. If you scroll down to the bottom of the report, you will notice 121 individual runs. The optimization process is quite simple compared to the search-for-robust-parameters process. In our optimiza-tion report, there is a ton of information to filter through. Should we pick the parameter set that has the most profit or smallest draw down or highest profit factor? Unfortu-nately, there is no black-and-white rule for picking the best parameters. Uncovering the best parameter set can be an exhaustive process of elimination. This process involves the sorting, graphing, and eventual elimination of underperforming parameters. Throughout the years of testing and optimizing trading systems, we have discovered that compar-ing the profit-to-draw-down ratio or the return on account across the optimization range is the first step in the parameter selection process. So, with this in mind, let’s click on the floppy disk icon and save our optimization report to the C: drive. You may want to name the file “MyStrategyOpt.” Temporarily shrink TradeStation down. The next few steps will require spreadsheet software such as Microsoft Excel. We prefer Excel, and we will use it in the next few illustrations. 
Using Excel Versions Prior to 2010 
If you have or plan on using Excel 2010, then skip this section. Launch Excel and open MyStrategyOpt, or whatever you called it, from the C: drive. 
TradeStation uses a delimiter to separate the fields in our optimization report. When Excel asks you to choose the file type that best describes your data, click on the Delim-
ited radio button. Continue clicking on the Next button until you have the file opened in a spreadsheet. You will notice that our optimization report looks the same as it did in TradeStation. You might even be asking, “Why did we go through this additional step?” Microsoft Excel or any other spreadsheet program has many more capabilities when it comes to data processing than TradeStation. As we all know, a picture is worth a thousand words. The spreadsheet that we have before us provides an overabundance of information; our minds are not able to manipulate the information into a readily under-standable format. This is where Excel comes in handy. We have now optimized two pa-rameters on MyStrategy-1 and created several different statistics on each individual run. Since we optimized only two parameters, we will be able to create a three-dimensional contour chart of our data. Remembering back to high school math, we know that a three-dimensional chart requires three axes. In our graph, the longLength parameters will be
100 BUILDING WINNING TRADING SYSTEMS WITH TRADESTATION 
TABLE 5.5 Strategy Optimization Report 
longLength shortLength Net 
Profit Gross Profit 
Gross Loss #Trades % Prft #WTrds #LTrds 
60 60 6781 48813 −42031 22 41 9 13 56 60 11906 50375 −38469 22 41 9 13 52 60 13781 50469 −36688 22 41 9 13 48 60 12313 51500 −39188 24 46 11 13 44 60 19875 55000 −35125 24 50 12 11 40 60 23938 57156 −33219 24 63 15 9 36 60 8906 60938 −52031 28 50 14 14 32 60 20219 66188 −45969 28 50 14 14 28 60 29594 71031 −41438 28 50 14 14 24 60 33594 72188 −38594 28 50 14 14 20 60 40625 75625 −35000 28 57 16 12 60 56 −11469 48281 −59750 27 33 9 18 56 56 −6344 49844 −56188 27 33 9 18 52 56 −9469 50281 −59750 28 32 9 19 48 56 −10938 51313 −62250 30 37 11 19 44 56 −3375 54813 −58188 30 40 12 16 40 56 2250 58250 −56000 30 50 15 15 36 56 −24094 61781 −85875 36 39 14 22 32 56 −7406 67656 −75063 36 39 14 22 28 56 3094 72406 −69313 36 39 14 22 24 56 9844 74625 −64781 36 42 15 21 20 56 17750 78000 −60250 36 44 16 20 60 52 −7031 49563 −56594 27 33 9 17 56 52 −1906 51188 −53094 27 37 10 16 52 52 −5031 51719 −56750 28 39 11 17 48 52 −6500 53375 −59875 30 40 12 18 44 52 1063 57438 −56375 30 47 14 15 40 52 6688 60969 −54281 30 50 15 15 36 52 −19656 64031 −83688 36 39 14 22 32 52 −2969 69906 −72875 36 39 14 22 28 52 7531 74656 −67125 36 39 14 22 24 52 14281 76875 −62594 36 42 15 21 20 52 22188 80250 −58063 36 44 16 20 60 48 −3219 52188 −55406 27 37 10 17 56 48 1906 53813 −51906 27 41 11 16 52 48 −1219 54344 −55563 28 39 11 17 48 48 −2688 55938 −58625 30 43 13 17 44 48 4875 60313 −55438 30 47 14 15 40 48 10500 63844 −53344 30 50 15 15 36 48 −15844 66094 −81938 36 39 14 22 32 48 844 71969 −71125 36 39 14 22 28 48 11344 76719 −65375 36 39 14 22 24 48 18094 78938 −60844 36 42 15 21 20 48 26000 82313 −56313 36 44 16 20 60 44 6688 56406 −49719 27 41 11 15 56 44 11813 58469 −46656 27 44 12 15
Measuring Trading System Performance and System Optimization 101 
TABLE 5.5 (Continued) 
longLength shortLength Net 
Profit Gross Profit 
Gross Loss #Trades % Prft #WTrds #LTrds 
52 44 9281 59750 −50469 28 43 12 16 48 44 7813 62969 −55156 30 47 14 16 44 44 15375 67500 −52125 30 50 15 15 40 44 21000 71031 −50031 30 50 15 15 36 44 −5344 72344 −77688 36 39 14 22 32 44 11344 78219 −66875 36 39 14 22 28 44 21844 82969 −61125 36 39 14 22 24 44 28594 85313 −56719 36 42 15 21 20 44 36500 88688 −52188 36 44 16 20 60 40 17781 60281 −42500 27 48 13 14 56 40 22906 62813 −39906 27 52 14 13 52 40 21281 64688 −43406 28 54 15 13 48 40 19875 68031 −48156 30 47 14 16 44 40 27438 72594 −45156 30 50 15 15 40 40 33063 76125 −43063 30 50 15 15 36 40 7406 76438 −69031 36 42 15 21 32 40 24094 82344 −58250 36 42 15 21 28 40 30469 87063 −56594 38 39 15 23 24 40 37281 90031 −52750 38 42 16 22 20 40 45438 94219 −48781 38 47 18 20 60 36 21656 73188 −51531 32 53 17 15 56 36 26781 76719 −49938 32 56 18 14 52 36 27625 79969 −52344 33 55 18 15 48 36 27281 83750 −56469 35 49 17 18 44 36 34844 88438 −53594 35 54 19 16 40 36 40469 91969 −51500 35 54 19 16 36 36 15969 91750 −75781 41 46 19 22 32 36 32719 97719 −65000 41 46 19 22 28 36 40531 103125 −62594 43 44 19 24 24 36 48219 106594 −58375 43 47 20 23 20 36 51375 111219 −59844 44 48 21 23 60 32 156 74250 −74094 38 47 18 20 56 32 5281 77875 −72594 38 47 18 20 52 32 6125 80094 −73969 39 46 18 21 48 32 7219 83250 −76031 41 44 18 23 44 32 14781 88156 −73375 41 46 19 22 40 32 20406 91688 −71281 41 46 19 22 36 32 −10281 90125 −100406 49 39 19 30 32 32 −2156 97281 −99438 51 39 20 31 28 32 10594 103375 −92781 53 40 21 32 24 32 21531 106688 −85156 53 40 21 32 20 32 29188 111063 −81875 54 43 23 31 60 28 11000 78438 −67438 38 47 18 20 56 28 16125 82063 −65938 38 47 18 20 52 28 16969 84281 −67313 39 46 18 21 
(continued)
102 BUILDING WINNING TRADING SYSTEMS WITH TRADESTATION 
TABLE 5.5 (Continued) 
longLength shortLength Net 
Profit Gross Profit 
Gross Loss #Trades % Prft #WTrds #LTrds 
48 28 18563 87688 −69125 41 44 18 23 44 28 20000 92469 −72469 43 44 19 24 40 28 25625 96000 −70375 43 44 19 24 36 28 −4500 93344 −97844 51 39 20 31 32 28 3688 101156 −97469 53 38 20 33 28 28 17250 107188 −89938 55 38 21 33 24 28 28875 111281 −82406 55 42 23 32 20 28 37625 116188 −78563 56 45 25 31 60 24 17813 82406 −64594 38 47 18 20 56 24 22938 86219 −63281 38 50 19 19 52 24 2844 88094 −85250 43 44 19 24 48 24 5500 91188 −85688 45 42 19 26 44 24 7688 95188 −87500 47 40 19 28 40 24 13313 98188 −84875 47 40 19 28 36 24 −12125 96281 −108406 55 36 20 35 32 24 −2500 103563 −106063 57 37 21 36 28 24 14250 110219 −95969 59 37 22 37 24 24 27625 114906 −87281 59 39 23 36 20 24 37438 119938 −82500 60 45 27 33 60 20 21188 87063 −65875 42 43 18 24 56 20 26313 90969 −64656 42 45 19 23 52 20 7656 92844 −85188 47 40 19 28 48 20 10813 95875 −85063 49 39 19 30 44 20 13063 99875 −86813 51 37 19 32 40 20 18688 102875 −84188 51 37 19 32 36 20 −8500 102469 −110969 61 33 20 41 32 20 1188 110031 −108844 63 35 22 41 28 20 9875 118188 −108313 67 33 22 45 24 20 23563 123063 −99500 67 36 24 43 20 20 35125 128813 −93688 68 40 27 40 
the x-axis, shortLength parameters will be the y-axis, and the return on account will be the z-axis. (We could create different charts by using different performance statistics for our z-axis.) You may feel that the draw down statistic is the better key in parameter selection. Before we can create our chart, we must manipulate the data into a format that Excel can easily interpret, and the best way to do this is by creating a pivot table. A pivot table is simply a customizable table that rearranges our data into a more readable for-mat. If you don’t have Excel, your spreadsheet software should be able to create a pivot table. (We refer you to your spreadsheet user’s guide.) From within Excel, go up under the Data menu and select PivotTable and PivotChart Report. The PivotTable Wizard will open and ask you several questions concerning our data. A dialog box titled PivotTable 
and PivotChart Wizard should open and look similar to Figure 5.8.
Measuring Trading System Performance and System Optimization 103 
FIGURE 5.8 PivotTable and PivotChart Wizard, Step 1 of 3 
In the top portion of the dialog box, click on the Microsoft Excel List or Database 
radio button. In the lower half of the dialog box, click on the PivotChart (with Pivot Table) radio button. Go ahead and click Next. A dialog box like the one in Figure 5.9 will open with the range of data that will be used in the creation of our table and chart. 
Upon clicking Next you will see another dialog box, which asks if we want to put our pivot table in a new worksheet or in the existing worksheet. Go ahead and put it into a new worksheet. Now, this is where it gets kind of confusing. Click on the Layout button and a dialog box like the one in Figure 5.10 will open. 
This dialog box will allow us to choose only the data we want in our table and chart. In addition, we can customize the format of our table. In the right side of the dialog box, 
FIGURE 5.9 PivotTable and PivotChart Wizard, Step 2 of 3
104 BUILDING WINNING TRADING SYSTEMS WITH TRADESTATION 
FIGURE 5.10 PivotTable and PivotChart Wizard Layout 
you will see all of the different statistics that TradeStation generated in our optimization report. Take a look at all of the buttons and familiarize yourself with all of the different options. You may need to use the scroll bar to see all of the available buttons. You will see a button labeled longLength. Click on it and drag it over to the area labeled ROW. Click on the button labeled shortLength and drag it over the area labeled COLUMN. Click on the button labeled ROA (you may need to use the scroll bar underneath our field buttons) and drag it to the area labeled DATA. Your dialog box should now look like Figure 5.11. 
Click OK and you will be back at the previous dialog box. Click Finish. You should see several things on your screen at this point. If everything went as planned, your screen should look like Figure 5.11. (If your screen doesn’t look like Figure 5.12, then start again and refer to your spreadsheet software manual.) 
We have now created a pivot table chart out of our specified data. You may think, “Big deal!” The data still isn’t visually pleasing. That is because we are looking at our three-dimensional data in two dimensions. Click on the chart icon near the top of the PivotTable window. We need to tell Excel to plot our data in three dimensions. After you click the chart icon, a dialog box like the one in Figure 5.13 will now be on your screen. 
You will notice that there are several different chart types at your disposal. Click on the Surface chart selection. The surface chart has four different subtypes. Accept the default subtype and click Finish. You could click on Next and then have the ability to give titles to our chart and axes, but to save time, we will simply skip this step. Voila! You should now have a three-dimensional surface or contour chart on the screen. Figure 5.14 shows the end result of our diligent efforts.
Measuring Trading System Performance and System Optimization 105 
FIGURE 5.11 PivotTable and Selected Fields 
FIGURE 5.12 3-D Data through the Eyes of a 2-D Chart
FIGURE 5.13 Chart Wizard 
FIGURE 5.14 3-D Contour Chart of MyStrategy-1 Optimizations 
106
Measuring Trading System Performance and System Optimization 107 
If you are unfamiliar with these types of charts, you may be asking, “What the heck am I looking at?” A surface chart helps to determine the optimum combinations between two sets of data. The x- and y-axes are our longLengths and our shortLengths 
respectively, and the z-axis is the Return on Account. The chart looks like a mountain range; there are peaks, valleys, and plateaus. Parameters that fall on the peaks are not considered robust, even though they produced the best profit/draw down ratio. Also, parameters that fall in valleys are not considered robust because they did not produce acceptable profit/draw down ratios. The most robust parameters fall on plateaus. Plateau parameters do not require history to repeat itself exactly to produce similar historic results, whereas peak parameters do. Let’s say the combination of 20 and 36 produced the highest return and the highest peak on the chart. Did the parameters around this peak have a dramatic drop-off in performance? You bet they did. This tells us that if history doesn’t repeat itself exactly, then we cannot expect our tests to approximate future performance. From the surface chart, we feel the combination of parameters that fall in the range of [longLength 20–32] and [shortLength 35–44] would produce the most robust results. These parameters fall on elevated and level plateaus. You may not be able to see these parameters clearly by looking at the chart. You can change the chart view by going under the Chart menu and selecting 3-D view. We personally like to look down on the chart from an above perspective (an aerial view). This perspective allows you to see all of the peaks, valleys, and plateaus. Play around with rotating the chart until it looks like Figure 5.15. 
FIGURE 5.15 Rotated 3-D Contour Chart of MyStrategy-1 Optimizations
108 BUILDING WINNING TRADING SYSTEMS WITH TRADESTATION 
Using Excel 2010 
If you have a prior version of Excel and have just read the prior section, then skip Using Excel 2010. 
Launch Excel and open MyStrategyOpt, or whatever you called it, from the C: drive. TradeStation uses a delimiter to separate the fields in our optimization report. When Excel asks you to choose the file type that best describes your data, click on the Delim-
ited radio button. Continue clicking on the Next button until you have the file opened in a spreadsheet. You will notice that our optimization report looks the same as it did in TradeStation. You might even be asking, “Why did we go through this additional step?” Microsoft Excel or any other spreadsheet program has many more capabilities when it comes to data processing than TradeStation. As we all know, a picture is worth a thousand words. The spreadsheet that we have before us provides an overabundance of information; our minds are not able to manipulate the information into a readily under-standable format. This is where Excel comes in handy. We have now optimized two pa-rameters on MyStrategy-1 and created several different statistics on each individual run. Since we optimized only two parameters, we will be able to create a three-dimensional contour or surface chart of our data. Remembering back to high school math, we know that a three-dimensional chart requires three axes. In our graph, the longLength param-eters will be the x-axis, shortLength parameters will be the y-axis, and the return on account will be the z-axis. (We could create different charts by using different perfor-mance statistics for our z-axis.) You may feel that the draw down statistic is the better key in parameter selection. Before we can create our chart, we must manipulate the data into a format that Excel can easily interpret, and the best way to do this is by creating a pivot table. A pivot table is simply a customizable table that rearranges our data into a more readable format. From within Excel, go under the Insert menu and click on the down arrow under the Pivot Table button and select Pivot Chart. The PivotTable Wizard will open and ask you several questions concerning our data. A dialog box titled Create 
PivotTable and PivotChart should open and look similar to Figure 5.16. In the top portion of the dialog box click the Select table or Range radio button. The 
range of our data might be preselected, but if not, select the entire range of data in the spreadsheet. In the lower half of the dialog box, click New Worksheet as the place to put our chart. Go ahead and click OK. Your spreadsheet will change and should look similar to the one in Figure 5.17. 
Click anywhere in the Chart 1 pane, and then in the Pivot Table Field List pane drag longLength to the Axis Fields pane and drag shortLength to the Legends Fields, and finally drag Net Profit to the Values pane. After doing this, your worksheet should look similar to the one in Figure 5.18. 
The data still isn’t visually pleasing. That is because we are looking at our three-dimensional data in two dimensions. Right click in the chart and select Change Chart 
Type. A new dialog box (see Figure 5.19) will appear. Scroll down until you find the Surface chart option and click OK. You should now 
have a three-dimensional surface chart on your spreadsheet like the one in Figure 5.20. If not, then start over and follow the instructions again.
Measuring Trading System Performance and System Optimization 109 
FIGURE 5.16 PivotTable and PivotChart Wizard Step 1, Microsoft Excel 2010 
FIGURE 5.17 PivotTable and PivotChart Wizard Step 2, Microsoft Excel 2010
FIGURE 5.18 PivotTable and PivotChart Wizard Step 3, Microsoft Excel 2010 
FIGURE 5.19 Chart Wizard, Microsoft Excel 2010 
110
Measuring Trading System Performance and System Optimization 111 
FIGURE 5.20 3-D Contour Chart of MyStrategy-1 Optimizations 
If you are unfamiliar with these types of charts, you may be asking, “What the heck am I looking at?” A surface chart helps to determine the optimum combinations between two sets of data. The x- and y-axes are our longLengths and our shortLengths respec-tively, and the z-axis is the Return on Account. The chart looks like a mountain range; there are peaks, valleys, and plateaus. Parameters that fall on the peaks are not con-sidered robust, even though they produced the best profit/draw down ratio. Also, pa-rameters that fall in valleys are not considered robust because they did not produce ac-ceptable profit/draw down ratios. The most robust parameters fall on plateaus. Plateau parameters do not require history to repeat itself exactly to produce similar historic re-sults, whereas peak parameters do. Let’s say the combination of 20 and 36 produced the highest return and the highest peak on the chart. Did the parameters around this peak have a dramatic drop-off in performance? You bet they did. This tells us that if history doesn’t repeat itself exactly, then we cannot expect our tests to approximate future per-formance. From the surface chart, we feel the combination of parameters that fall in the range of [longLength 20–32] and [shortLength 35–44] would produce the most ro-bust results. These parameters fall on elevated and level plateaus. You may not be able
112 BUILDING WINNING TRADING SYSTEMS WITH TRADESTATION 
FIGURE 5.21 Rotated 3-D Contour Chart of MyStrategy-1 Optimizations 
to see these parameters clearly by looking at the chart. You can change the chart view by right clicking the chart and selecting 3-D rotation. We personally like to look down on the chart from an above perspective (an aerial view). This perspective allows you to see all of the peaks, valleys, and plateaus. Play around with the rotating the chart until it looks like Figure 5.21. 
If you optimize more than two parameters, then it is impossible to visually determine parameter robustness. If you optimize only one parameter, you can do away with the Piv-otTable procedure and simply use the charting wizard in Excel. The more parameters you optimize, the higher the likelihood of curve-fitting and overoptimization. If you have your heart set on optimizing more than two parameters, then do it in a stepwise fashion. De-termine your two most important parameters and optimize and analyze for robustness. Once you select the most robust combination, optimize the other parameters, and soon. Just be careful and don’t fool yourself. We all know the true test is the test of time. How a strategy performs after it is developed gives the most insight into the true validity of the strategy. Optimizing parameters over the entire history of a market does not allow for a walk-forward test. A walk-forward test involves testing over data that was not used during the back-test or strategy optimization. When searching for optimum parameters, we like to cut our historic database in half. The first half of the data is dedicated to back-testing and optimization. The second half of the test is reserved for forward-testing our strategy and parameter selections. If the strategy or the parameters do not pass the
Measuring Trading System Performance and System Optimization 113 
walk-forward test period, then we go back to the drawing board. Walk-forward testing can actually be done on any out-of-sample data. Many people prefer to develop and op-timize their strategies using recent history, and then walk-forward test an earlier out-of-sample data. They believe that the most recent price history of a market gives more insight into the near future than does data that is several years old. We would have to agree that stocks and stock indices data look nothing like they did a few years ago, so this may not be a bad idea for these types of markets. It doesn’t matter which back-testing/walk-forward combination you choose, as long as you choose one. 
Genetic Optimization 
Today’s latest version of TradeStation has incorporated a genetic optimizer to chase down the most robust parameter sets. This feature comes in very handy when you are dealing with thousands of optimizing iterations. Remember, we optimized MyStrategy-1 by varying the longLength and shortLength variables a total of 121 times to produce a robust parameter set. How many total iterations would occur if we decided to vary the two variables by an increment of one instead of four? The formula we used in the prior section will give us the answer: (Stop – Start)/Increment + 1: (60 – 20)/1 + 1 = 41. Since we are working with two variables, we would then need to square 41, which would result in a total of 1,681 iterations. This number is big, but not that big. If you tried to use genetic optimization with TradeStation’s default parameters on this amount of iterations or tests, it would reject you and default back to the exhaustive method. We need to add another variable to the mix to achieve a problem that can be solved by a genetic process. Let’s add a protective dollar stop to MyStrategy-1 and have TradeStation optimize it as well as the first two parameters. 
Let’s go back to the U.S. bond chart that utilizes the MyStrategy-1 and deactivate the strategy. You can do this by right clicking in the chart and selecting Format Strategies 
and clicking on the Status button in the Format Analysis Techniques and Strategies 
dialog box. Close this dialog box by clicking Close, and then once again right click the U.S. bond chart and select Insert Strategy. Insert MyStrategy-1A onto the chart. The dialog box on your screen should look exactly like the one in Figure 5.22. 
Go ahead and follow the same instructions that we used in the Old School opti-mization routine, but this time set the increment values to one instead of four for the longLength and shortLength. When you optimize the prot$Stop variable, set the Start 
value to $500 and the Stop value to $4,000 and the increment to $100. Click OK to get back to the Format Analysis Techniques and Strategies dialog box. The input values for MyStrategy-1A should be set up exactly like those shown in Figure 5.23. 
If everything went right, you will notice your test count has increased to 60,516. We have now created a problem that would take the exhaustive method an enormous amount of time to process. Let’s go ahead and select genetic as our method. You will notice our number of tests has dropped down to 10,000. Before clicking the Optimize 
button, let’s review what genetic optimization is all about.
114 BUILDING WINNING TRADING SYSTEMS WITH TRADESTATION 
FIGURE 5.22 Format Strategies on MyStrategy-1A 
It’s not important to fully understand how genetic optimization works, and a full ex-planation is beyond the scope of this book, so only a brief introduction will be proffered. This method of optimization came about due to the limited ability of even ultrafast com-puters to do an exhaustive span of all possible outcomes in a large optimization sample. When you venture beyond three optimized parameters, it is almost impossible to do a complete combinatorial analysis due to time limitations. 
FIGURE 5.23 Optimization Parameters on MyStrategy-1A
Measuring Trading System Performance and System Optimization 115 
This explanation of a genetic optimization was taken from the Trading So-lutions Website: http://www.tradingsolutions.com/webhelp/optimization/optimization understanding.html. 
Genetic algorithms start with a small group of potential answers called a popu-
lation. Each member of the population is called a chromosome, which represents 
one group of settings—in this case, a pair of [[Moving Average|moving average]] lengths. Each setting 
in a chromosome is called a gene. 
Genetic optimization begins by testing each chromosome in the population 
and assigning a value indicating how good a solution it is, called a fitness. After 
the entire population is tested, a new population is created based primarily on 
the chromosomes with the best fitness using methods such as crossover, which 
combines elements of two chromosomes, and mutation, which modifies genes at 
random. 
Each new population is called a generation. Since all possible settings are 
not being tried, termination criteria need to be established to determine when 
to stop. These criteria typically take the form of a maximum amount of time or a 
maximum number of generations. In the end, the chromosome with the best fitness 
is kept and used to return the best settings. 
As you can see from this brief introduction, biology and computer science have joined together to help solve our problem. Before initiating the test, let’s first look at the advanced settings by clicking the Advanced Settings button. A new dialog box like the one in Figure 5.24 will be on your screen. 
For right now ignore the top portion of the dialog box that refers to Walk Forward Analysis. Each option concerning genetic optimization is briefly explained below: 
 Generations—The number of iterations that the genetic algorithm will run until it arrives at the strongest population. You can change this value to include more iter-ations, but this will increase optimization time. However, the more generations, the more robust the population, which in turn might produce a more fit parameter set. 
 Population size—The number of chromosomes that will be subject to the genetic selection process. After the specified generations, the outstanding population group is understood as being of improved fitness due to the natural selection of the genetic algorithm. This is the number of survivors that have passed all of the criteria that suggest they are the fittest. 
 Stress test size—The number (size) that defines the number of different parameter sets included with each stress test. If the stress test size is one, then stress testing is turned off since no additional testing will be performed relative to the base parame-ter set. If you want to perform stress testing, the recommended setting is 3. This type of testing monitors performance deterioration if all of the parameters are changed a certain percentage. Parameters that land on an exact point on a surface chart would probably fail this test. Stress testing will increase optimization time by a factor 2–5.
116 BUILDING WINNING TRADING SYSTEMS WITH TRADESTATION 
FIGURE 5.24 Advance Optimization Settings 
However, it can add an extra level of confidence in that a robust parameter set has been selected. 
 Mutation rate—The random rate of modification of the genes in chromosomes after each generation. Mutation is used to find new chromosomes to replace the “weak” ones. This modification helps maintain genetic diversity. 
 Crossover rate—The rate that specifies how close the replacement genes in chromo-somes are picked after each generation. Crossover is used to find new chromosomes to replace the “weak” ones. Crossover can be considered analogous to reproduction where there is a process of taking more than one parent solution and producing a child solution from them. 
 Stress increment—The percentage that the parameters will be stressed either up-ward or downward. 
 Terminate Optimization if population fitness did not improve for [] 
generations—Check this setting for the genetic optimizer to automatically terminate if the population fitness did not improve for the specified number of generations. If no improvement took place for 10 (default) or more generations, the algorithm has converged and optimization is not necessary. By checking this, you can prematurely exit an optimization if it senses things will not improve in future generations. This can cut down on optimization time. 
Go ahead and close this dialog box by clicking the OK button, and then go ahead and click Optimize. The U.S. bond chart will change to a window that details the process of your genetic optimization. The chart window will look like Figure 5.25.
Measuring Trading System Performance and System Optimization 117 
FIGURE 5.25 Optimization Progress 
Once the optimization is complete, go under the View menu and select Strategy 
Optimization Report, and you will see a report similar to the one that was generated with the standard exhaustive method. 
You may be asking which method is best. The exhaustive method can be used if optimization time is not a problem. This method seems more intuitive. However, if there are way too many possible solutions, then the genetic optimizer is the only way to go. There are many different options that can be set to change how TradeStation performs its genetic optimization, and we would advise you to get a book that details this type of optimization. However, a complete understanding is not necessary, and TradeStation’s default values can provide a robust optimization solution. 
Walk-Forward Testing and Optimizer 
As mentioned earlier, the truest test of any strategy is the test of time. Many potential system traders will not even look at a trading strategy unless it has been tested or traded on data that was not used to help determine its parameters. This is called testing on out-of-sample data. TradeStation’s Optimizer can integrate the testing of the data so that one can perform an optimization and a walk-forward analysis in a single test. 
However, this optimization does require a little bit of work in getting everything set up. First, let’s create a @EC.C daily chart going back 20 years (the chart will actually go back only to the start of the EC contract). After the chart appears on the screen, go under the Insert menu and select Insert Strategy. Pick and insert the Thermostat strategy that hopefully was downloaded prior to the reading of this book. Figure 5.26 is a quick snapshot of what your chart and strategy setup should look like. 
As you can see from the figure, there are six input variables. For this example let’s optimize four of the six. Following the same process as we have done for setting up
118 BUILDING WINNING TRADING SYSTEMS WITH TRADESTATION 
FIGURE 5.26 Thermostat Strategy Settings 
MyStrategy-1 for an optimization run, go ahead and optimize the bollingerLengths, trendLiqLength, swingPrcnt1, and swingPrcnt2 variables. Simply accept the start, stop, and increment values TradeStation provides. Don’t click OK just yet. With any luck, your Format Analysis Techniques and Strategies dialog box should look like the one in Figure 5.27. 
Click OK and make sure this optimization type is standard and the method is genetic. Click Advanced Settings, and let’s exclude that last 30 percent of the data for optimiza-tion purposes. This 30 percent of data will be tested on parameters that were derived from the first 70 percent. In other words, TradeStation will walk forward the optimized parameters over the last 30 percent of the test period. Just to be safe, make sure your options are set like those in Figure 5.28. 
When the optimization run finishes (this may take a little time to complete), go ahead under the View menu and select Strategy Optimization report. You will notice that this report looks similar to the other optimization reports we have already seen. Click on the column labeled All Net Profit and then click it until the little arrow to the right is pointing down. The parameter set with the highest profit will move to the top. Now, this is where the fun begins. At the top of the report you will see a drop-down menu with the initial value of All Data. If you need help finding it, refer to Figure 5.29. 
Now click on the down arrow and select In Sample. The values in the spreadsheet will change. These performance values were produced by optimizing the parameters over the portion of data that had the benefit of hindsight. In other words, this data segment
Measuring Trading System Performance and System Optimization 119 
FIGURE 5.27 Thermostat Strategy Default Optimization Settings 
FIGURE 5.28 Walk Forward Advance Optimization Settings
120 BUILDING WINNING TRADING SYSTEMS WITH TRADESTATION 
FIGURE 5.29 TradeStation Strategy Optimization Results 
was used to create the best-performing parameter sets. Click on the All Net Profit column heading until the arrow is pointing down again. Jot down the four parameter values that produced these illustrious numbers on a separate piece of paper. Or you can simply click the row-one heading. Now go back to the drop-down menu and select Out of Sample. The values in the spreadsheet will shuffle once again. These performance values were derived by walking forward the optimized parameter sets through the 30 percent of the data that was excluded in the test. This is data the system did not see during the optimization process, and it is much more valuable than the In Sample data. Hopefully, you will see green numbers in the All Net Profit column. Don’t click anything, but scroll down until you see the parameter set you had highlighted from the In Sample test. How close is this parameter set to the top? Hopefully, very close. If not, then this is an indication that the In Sample parameter set did not do that well in foretelling the future. Just because it was the best in the back-test doesn’t necessarily mean it will be the best in the future. In our Out of Sample test, the “best” parameter set was way down on the list. 
We decided to rerun the genetic optimization with the Stress Test option set to 3 to see if we could increase parameter robustness. Remember, this feature requires more time to complete the optimization and should increase robustness by eliminating param-eter sets that may sit on a peak. Remembering back to our surface chart, this feature should pick a parameter set sitting on a nice, level plateau. This second run did generate a different parameter set than the original, but its walk-forward analysis didn’t perform any better. The ability to see how a chosen parameter set performs in the future is a very valuable tool. This new feature provides this ability in an integrated format that will save an enormous amount of time in the strategy development phase. Without this feature you would need to first optimize on a portion of the database and then rerun the optimization on the remainder of the data to see if a chosen parameter set stood the test of time.
Measuring Trading System Performance and System Optimization 121 
An integrated walk-forward test is a neat feature; it can really help choose a robust parameter set. TradeStation didn’t simply stop with this tool but extended it and created yet another powerful tool in its Walk Forward Optimization. This tool, if you are of a certain school of thought, can reduce strategy development time by at least 90 percent. Before we discuss the implementation of this tool, let us first help you decide which school you belong to. Do you believe that markets are constantly changing and therefore a system’s parameters must also change to adapt, or do you believe that a single, yet very robust parameter set should be able ride out the ebb and flow of the markets and be successful without modification? Let’s assume you are of the former school of thought and let’s delve into TradeStation’s Walk Forward Optimization tool. If you are of the latter school, you might be swayed. 
Assuming you still have a chart of the @EC.C with Thermostat applied (if not, just go ahead set it back up), go ahead and right click on the chart and go to Format Strategies. Since you have become an old pro at setting up optimization runs, go ahead and optimize the same four parameters as we did last time: bollingerLengths, trendLiqLength, swingPrct1, and swingPrct2. Just accept the start, stop, and incre-ment values TradeStation provides. To decrease optimization time, click the Advance 
Settings button and make sure the Stress Test option is set to one. While you are in this dialog box, go ahead and set the optimization to exclude the last 30 percent of the data. Click OK to close this dialog box, and you should be back at the Format Analysis 
Techniques and Strategies dialog box. Now, change the optimization type by selecting Walk Forward in the Type drop-down list. Also make sure the method is set to Genetic. When this option is selected, the Walk Forward Test Name field appears. Type “Ther-moWFTest” in the box. By doing this you are telling TradeStation to gather the necessary information in this file to perform its walk-forward optimization. Go ahead and click the Optimize button, and we will tell you what is going on behind the scenes. 
TradeStation will use this optimization information when we tell it to perform the Walk Forward Optimization (WFO). This WFO will optimize the parameter set for a short period of time in the beginning of the data and then carry the best parameters forward (testing on data that wasn’t used to develop the parameters) for another short period of time. It will then back up and reoptimize the parameters and select another set and then carry those forward from the point where it had stopped the test. It will keep doing this until it reaches the end of the data. This may sound confusing, so let’s put it into terms a trader might understand. Joe Trader develops a trading system in 2001 and optimizes his parameters using the previous two years. Joe then uses those parameters to trade for the next two years. Noting that his performance wasn’t as good as what was generated in his optimized back-test, he decides to reoptimize to find out which parameters would have performed the best. He then uses those parameters and trades real time for the next two years. In this scenario he could have reoptimized over just the past two years or from the beginning of his data. This trade/reoptimize process is followed for the next ten years. Ultimately you might ask the question, is this process better than just sticking with one parameter set throughout history? Your question might have already been partially
122 BUILDING WINNING TRADING SYSTEMS WITH TRADESTATION 
FIGURE 5.30 Open Walk Forward Test Dialog 
answered if you saw a wide difference between the in-sample versus the out-of-sample tests we just performed. Well, this question can be answered by TradeStation. 
After the optimization of the Thermostat system on the @EC.C has completed, click on the Walk Forward Optimizer button on the Shortcut bar. The Walk Forward Opti-
mizer dialog box will open. Go under the File menu and select Open Walk Forward Test. The dialog box on your screen should look like the one in Figure 5.30. 
Our ThermoWFTest file should already have populated the file name field. There are a lot of different scenarios you can set up to perform this analysis. There are sim-ply too many to go over in this chapter, so we refer you to TradeStation’s WFO doc-umentation. An entire book could be written on these concepts alone. Go under the Walk Forward Analysis menu and select Start Cluster Analysis. Theoretically this should produce more robust parameter sets. This optimization will probably take a few minutes. 
When the optimization analysis is completed, a window will appear like the one in Figure 5.31. 
There will be simply too much information to cover, so only the high points will be reviewed. Your cluster analysis matrix may look different from what is shown in the figure. The reason is that the analysis is based on the time period involved with the test-ing. However, you should have a matrix or table with the “% of Out Of Sample (OOS)” data as the row headings and the number of runs utilized to create this average return. A
Measuring Trading System Performance and System Optimization 123 
FIGURE 5.31 Walk Forward Cluster Analysis 
contiguous 3 × 3 table (cluster) should be highlighted in green with the center block being the most optimal value. Click in the Display drop-down list box and select Walk 
Forward overall result. Referring to Figure 5.31, it looks like the parameters that pro-duce the best results when reoptimizing are 20 percent OOS and 10 runs. The next figure is 5.32, and it shows the overall result of the different combinations of %OOS and #days. This shows the combination of 20 percent and 15 days to be the best parameters. 
Click the down arrow again in the Display drop-down menu and select Reoptimiza-
tion interval (out-of-sample days). Figure 5.33 shows the optimal amount of time be-tween reoptimizations. In this example 252 days was the best time span. 
Another very interesting report can be obtained by clicking on the Walk Forward 
Summary (Out of Sample) tab. The report should be like the one in Figure 5.33. The authors think this report is one of the most valuable in the Walk Forward Optimizer application. 
The first column gives the different values of the parameters that were used during the time periods listed in column two. The rest of the columns provide performance met-rics during all of the different time periods. If you click on the Performance Summary tab, it will create a report similar to the performance reports that you have already seen. The question to ask is, Did the rolling reoptimization outperform a static parameter selection?
FIGURE 5.32 Walk Forward Overall Result 
FIGURE 5.33 Walk Forward Out-of-Sample Report 
124
Measuring Trading System Performance and System Optimization 125 
FIGURE 5.34 Walk Forward Final Results 
This question is easily answered by going back to the default parameter set and running it over the same time period. In our testing, the rolling method did slightly outperform the static method. 
The last report that will be viewed is labeled “Test Results” (Figure 5.34). The infor-mation provided here basically informs you if the strategy being tested has a chance of being successful in the future. 
Five key performance metrics are discussed: 
1. Overall profitability 
2. Walk-forward efficiency 
3. Consistency of profits 
4. Distribution of profits 
5. Maximum draw down 
If you look at Figure 5.34, you will notice that this test on the Thermostat system passed with flying colors. It was profitable overall, it had a walk-forward efficiency of great than 50 percent, and 80 percent of the walk-forward tests were profitable.
126 BUILDING WINNING TRADING SYSTEMS WITH TRADESTATION 
CONCLUSIONS 
Understanding trading system performance and proper strategy optimization helps to distinguish a good strategy from a bad one. TradeStation offers a wealth of performance information on a particular market in the Strategy Performance report to do this. Unfor-tunately, it gives only a microscopic view of the robustness of our strategy. You can’t develop a trading plan by looking at the performance of only one market; a macroscopic view is necessary before a strategy is to be given the stamp of approval. If you plan on allocating your trading capital across a handful of markets, you will be breaking the one true golden rule of trading: diversification. If you have any hopes of succeeding as a trader, you must diversify your capital across as many markets as possible. 
You can achieve diversifications through a portfolio of markets or trading strategies. Unfortunately, TradeStation is limited by its inability to analyze trading strategies at the portfolio level. Even though TradeStation is limited in this capacity, we can somewhat overcome this obstacle. If a trading strategy can be successful on a large and diverse portfolio of markets, then there is a good probability that it will be successful in the future. In other words, test, test, and retest. Throw the strategy against the wall as many times as necessary. Revel in failure, for every time you dismiss a losing strategy, you gain a victory in the battle for a winning trading strategy. 
If a trading strategy is initially successful, we know that we can make it better through the process of optimization. Or, we make it less likely to be successful in the future. Optimization is a necessary evil. It is necessary so that we can come up with sound trading strategies (back-testing is a form of optimization). At the same time, since we are human and enjoy tinkering with things, we can’t help running 10,000 optimizations of five parameters in search of the Holy Grail. Hopefully, this chapter has introduced the knowledge needed to prevent the abuse of TradeStation and the vast database of historic data that is available at our fingertips. Chapter 6 will introduce turnkey trading strategies that rival any other trading strategies that can be purchased for thousands of dollars.
C H A P T E R 6 
Trading Strategies That Work (or the Big 
Damn Chapter on Trading Strategies) 
A re you ready for some good trading strategy ideas and the programming behind 
them? Over the past 20 years, we have seen thousands of trading ideas, schemes, and systems. Unfortunately, most of them ended up in the trash can. Sometimes, 
however, we have scratched our heads with raised eyebrows and said, “Hmmm.” The next strategies that we present are based on ideas that have proven successful time and time again. We present these systems as works in progress; as you will soon discover, trading system design has no end. No matter how long and arduously you work on a trading system, you will never be 100 percent satisfied with the results. We don’t want you to be satisfied with the systems that we present. We want you to make them your own. Use the programs as templates and branch off in an entirely different direction. 
The manner in which we present these trading systems will guide you through the steps necessary to translate a trading idea into software. We first start by describing the trading idea in general terms and our objectives. The tools that will be used to build our trading methodology are then defined. Pseudocode (half English and half computer-speak) is then used to bridge the [[Gap|gap]] between system description and actual code. Finally, the exact EasyLanguage program is provided. Since testing several different markets over an extended time period is cumbersome with TradeStation, we present the overall and individual performance statistics of the system for you. Of course, you can also do this with your own TradeStation by building workspaces and applying each system. 
We have tried to incorporate all of the necessary tools of system programming by creating rather sophisticated trading algorithms. The complexity level of each system grows as each one is presented. We hope the commentary that is included in the actual code will help clear up any confusion. As the old saying goes, “There is more than one way to skin a cat.” In most instances, there is more than one way to program a solution to a given problem, be it a complex mathematical calculation or a trading system. You 
127
128 BUILDING WINNING TRADING SYSTEMS WITH TRADESTATION 
may and probably will come up with easier-to-understand and more efficient programs than we have presented here. We hope you do. Programming is a form of art, and like any other art, it is limited only by the creativity of the artist. 
THE KING KELTNER TRADING STRATEGY 
A [[Moving Average|moving average]] calculation is the main indicator used in the King Keltner trading strat-egy. A [[Moving Average|moving average]] is calculated by summing up x prior data points and then dividing the summation by x. Most times these calculations use a fixed number of data points. The more data points you have, the less of an impact a new data point has on the final averaged value. Longer [[Moving Average|moving average]] calculations try to determine longer-term trend movements. Conversely, shorter moving averages try to pinpoint shorter-term market swings. Chester Keltner presented this application of a [[Moving Average|moving average]] system in 1960. The system Keltner presented is built around a [[Moving Average|moving average]] of the high, low, and closing prices with a band or channel on each side of the market formed by a moving av-erage of the high–low range. A buy signal occurs when the market penetrates the upper band, and a sell signal when the market penetrates the lower. We have used the basic Keltner approach, but have added a few bells and whistles. We hope, as did Chester, that when the market makes an abrupt move away from its [[Moving Average|moving average]], it is sig-naling a change in trend. In the King Keltner system, the penetration of the upper/lower bands signals this trend change. We will go with the flow and buy on strength and sell on weakness. We will get out with a win or a loss when the market retraces back to the [[Moving Average|moving average]]. The major problem with channel [[Breakout|breakout]] systems is the failed [[Breakout|breakout]]. Many times, the channels represent a point of market exhaustion instead of trend confirmation. Frequently, a market will spend itself by moving to the upper or lower bands and then immediately fall back and move in the opposite direction. This is our worst fear. However, since we realize the weakness of this type of system, we have programmed a liquidation stop at the [[Moving Average|moving average]]. Most trading methodolo-gies will fail, and some form of protection should be put into place when a trade is ini-tiated. If most trading methodologies fail, then why put on a trade in the first place? The success to any form of trading is to cut losses short and let profits run. This ba-sic tenet of trading falls under the realm of money management. Your trading system gets you into the trade, and your money management scheme manages your position and eventually gets you out of the trade. In the King Keltner system, the direction of the [[Moving Average|moving average]] and the penetration of the bands are our entry technique, and the liquidation of our position at the [[Moving Average|moving average]] is our money management scheme. Our money management stop will be either a protective stop or a take-profit stop. If we do capture a long trend, then the [[Moving Average|moving average]] should move in the same direc-tion as our entry signal and with any luck capture a good portion of the move. Always remember, it is the exit technique that determines the success of the entry technique. Since King Keltner is a long-term approach, short-term profits are not an objective. We will take them if they come our way, but with this type of system they would eventually
Trading Strategies That Work (or the Big Damn Chapter on Trading Strategies) 129 
become counterproductive. This system will have fewer than 50 percent wins, and that’s all right. The few large trends that we do catch should more than cover the losses from the failed breakouts. 
Most [[Moving Average|moving average]]–based systems are very simple to program, and this one will not be an exception. We will need only two tools: (1) a [[Moving Average|moving average]] of the high, low, and close prices, and (2) a [[Moving Average|moving average]] of the true ranges. You may not be familiar with the term “true range.” The range of a daily bar is simply calculated by subtracting the low price from the high price. An average of these ranges will give an estimate of future price ranges. The true range calculation extends the range of a bar to the previous day’s close—true range = max(close of yesterday, high of today) – min(close of 
yesterday, low of today—thus expanding the bar’s range to include any gaps from the previous day’s close. We feel true ranges give a slightly more accurate measure of market volatility. Since we are trying to capture a longer-term move, we will use 40 days in our average calculations. 
King Keltner Pseudocode 
movAvg = Average(((High + Low + Close)/3),40) 
upBand = movAvg + Average(TrueRange,40) 
dnBand = movAvg - Average(TrueRange,40) 
liquidPoint = Average(((High + Low + Close)/3),40) 
A long position will be initiated when today’s movAvg is greater than 
yesterday’s and market action >= upBand 
A short position will be initiated when today’s movAvg is less than 
yesterday’s and market action <= dnBand 
A long position will be liquidated when today’s market action <= 
liquidPoint 
A short position will be liquidated when today’s market action >= 
liquidPoint 
King Keltner Program 
{King Keltner by George Pruitt—based on trading system presented by Chester 
Keltner} 
Inputs: avgLength(40), atrLength(40); 
Vars: upBand(0),dnBand(0),liquidPoint(0),movAvgVal(0); 
movAvgVal = Average((High + Low + Close),avgLength); 
upBand = movAvgVal + AvgTrueRange(atrLength); 
dnBand = movAvgVal - AvgTrueRange(atrLength); 
if(movAvgVal > movAvgVal[1]) then Buy (‘‘KKBuy’’) tomorrow at 
upBand stop; 
if(movAvgVal < movAvgVal[1]) then Sell Short(‘‘KKSell’’) tomorrow 
at dnBand stop; 
liquidPoint = movAvgVal; 
If(MarketPosition = 1) then Sell tomorrow at liquidPoint stop; 
If(MarketPosition = -1) then Buy To Cover tomorrow at liquidPoint stop;
130 BUILDING WINNING TRADING SYSTEMS WITH TRADESTATION 
TABLE 6.1 King Keltner Performance 
System Name: King Keltner Commission/Slippage = $75 Tested 2001—9/30/2011 
Total Net Max. # of Max. Cons. Markets Profit Draw Down Trades % Wins Losers 
British Pound $ 8,568.75 $ (24,868.75) 70 25.71% 12 Crude Oil $ 45,145.00 $ (34,040.00) 71 33.80% 14 Corn $ 1,162.50 $ (11,837.50) 69 21.74% 11 Copper $ 81,000.00 $ (41,487.50) 54 40.74% 5 Cotton $ 42,880.00 $ (19,802.50) 55 27.27% 7 Euro Currency $ 34,950.00 $ (28,612.50) 67 26.87% 6 Euro Dollar $ 3,190.00 $ (6,943.75) 72 20.83% 15 Heating Oil $ 43,298.40 $ (50,221.87) 78 25.64% 7 Japanese Yen $ (18,400.00) $ (35,962.50) 75 24.00% 9 Live Cattle $ (210.00) $ (13,165.00) 64 23.44% 12 Natural Gas $ (16,050.00) $ (99,362.75) 58 20.69% 18 Soybeans $ 30,750.00 $ (23,350.00) 85 28.24% 12 Swiss Franc $ 27,175.00 $ (24,112.50) 64 29.69% 10 Treasury Note $ 24,181.25 $ (14,393.75) 73 30.14% 7 U.S. Bonds $ 2,581.25 $ (24,356.25) 76 28.95% 7 Wheat $ 9,262.50 $ (25,962.50) 46 28.26% 7 Total $ 319,484.65 1077 
The King Keltner program demonstrates how to: 
 Invoke the Average and the Average True Range functions.  Buy/sell on the next bar at a stop level.  Liquidate a position on the next bar at a stop level.  Incorporate inputs for user interface and future optimizations. 
King Keltner trading performance is summarized in Table 6.1. A visual example of how this system enters and exits trades is shown in Figure 6.1. 
King Keltner Summary 
Overall trading performance was extremely positive. The system did well in the majority of the test markets, which is a testament to its robustness. Remember, there are only two parameters, which are the same for all markets. Could this system be improved by optimizing the parameters on an individual market basis? We like the idea of the same parameter set, but others in the industry would argue this point with us. Their argument would be based on the belief that markets from different sectors (e.g., Japanese Yen and live cattle) have different underlying fundamentals and, therefore, do not demonstrate similar market movements. Changing a parameter to reflect the differences between
Trading Strategies That Work (or the Big Damn Chapter on Trading Strategies) 131 
FIGURE 6.1 King Keltner Trades 
different markets is not just acceptable, it is an absolute necessity. We don’t totally agree with this argument, but we could be talked into different parameters for different sec-tors. All of the currencies would have one set of parameters, and all of the meats would have one, and so on. We would emphatically disagree with the idea of having a different parameter for the Japanese Yen and the Swiss Franc; these two markets have similar fundamentals and market movements. King Keltner could be the foundation for an en-tire portfolio-based trading platform. All that is needed is an algorithm for bet size (the number of contracts that are put on with each trade). In other words, you would need a money management overlay. 
THE BOLLINGER BANDIT TRADING STRATEGY 
Standard deviation is a number that indicates how much on average each of the values in the distribution deviates from the mean (or center) of the distribution. [[Bollinger Bands]], created by John Bollinger in the 1960s, is an indicator that uses this statistical measure to determine [[Support|support]] and [[Resistance|resistance]] levels. This indicator consists of three lines and is very simple to derive; the middle line is a simple [[Moving Average|moving average]] of the underlying price data, and the two outside bands are equal to the [[Moving Average|moving average]] plus or minus
132 BUILDING WINNING TRADING SYSTEMS WITH TRADESTATION 
one or more standard deviations. Based on theory, two standard deviations equates to a 95 percent confidence level. In other words, 95 percent of the time the values used in our sampling fell within two standard deviations of the average. Initially, [[Bollinger Bands]] were used to determine the boundaries of market movements. If a market moved to the upper band or lower band, then there was a good chance that the market would move back to its average. We have carried out numerous tests on this hypothesis and seem always to come back with failure. Instead of using the upper band as a [[Resistance|resistance]] point, we have discovered, as others have, that it works much better as a [[Breakout|breakout]] indicator. The same goes for the lower band. The Bollinger Bandit uses 1.25 standard deviations above the 50-day [[Moving Average|moving average]] as a potential long entry and 1.25 standard deviations below the 50-day [[Moving Average|moving average]] as a potential short entry. 
This system is a first cousin of King Keltner. They are similar in that they are longer-term channel [[Breakout|breakout]] systems. However, this is where the similarities end. Instead of simply liquidating a position when the market moves back to the [[Moving Average|moving average]], we concocted a little twist to this exit technique. From observing the trades on the King Keltner, we discovered that we gave back a good portion of the larger profits waiting to exit the market at the [[Moving Average|moving average]]. So, for the Bollinger Bandit, we incorporated a more aggressive trailing stop mechanism. When a position is initiated, the protective stop is set at the 50-day [[Moving Average|moving average]]. Every day that we are in a position, we decrement the number of days for our [[Moving Average|moving average]] calculation by one. The longer that we are in a trade, the easier it is to exit the market with a profit. We keep decrementing the number of days in our [[Moving Average|moving average]] calculation until we reach 10. From that point on, we do not decrement. 
There is one more element to our exit technique: The [[Moving Average|moving average]] must be below the upper band if we are long, and above the lower band if we are short. We added this element to prevent the system from going back into the same trade that we just liquidated. If we hadn’t used this additional condition and we were long and the [[Moving Average|moving average]] was above the upper band, the long entry criteria would still be set up and a long trade would be initiated. Previously, we stated that the upper band and lower band are potential buy/sell entries. “Potential” is the important word. 
One more test must be passed before we initiate a position; the close of today must be greater than the close of 30 days ago for a long position, and the close of today must be less than the close of 30 days ago for a short position. This additional requirement is a trend filter. We only want to go long in an uptrend and short in a downtrend. 
The Bollinger Bandit requires four tools: (1) [[Bollinger Bands]], (2) a [[Moving Average|moving average]] of closing prices, (3) a rate of change calculation, and (4) a counter. This system is longer-term in nature, so we will use 50 days in our calculations. 
Bollinger Bandit Pseudocode 
LiqDay is initially set to 50 
upBand = Average(Close,50) + StdDev(Close,50) *1.25 
dnBand = Average(Close,50)—StdDev(Close,50) *1.25 
rocCalc = Close of today—Close of thirty days ago 
Set liqLength to 50
Trading Strategies That Work (or the Big Damn Chapter on Trading Strategies) 133 
If rocCalc is positive, a long position will be initiated when 
today’s market action >= upBand 
If rocCalc is negative, a short position will be initiated when 
today’s market action <= dnBand 
liqPoint = Average(Close, 50) 
If liqPoint is above the upBand, we will liquidate a long position if today’s 
market action <= liqPoint 
If liqPoint is below the dnBand, we will liquidate a short position 
if today’s market action >= liqPoint 
If we are not stopped out today, then liqLength = liqLength—1 If we are stopped out today, then reset liqLength to fifty 
Bollinger Bandit Program 
{Bollinger Bandit by George Pruitt—program uses [[Bollinger Bands]] and Rate of 
change to determine entry points. A trailing stop that is proportional with 
the amount of time a trade is on is used as the exit technique.} 
Inputs: bollingerLengths(50),liqLength(50),rocCalcLength(30); 
Vars: upBand(0),dnBand(0),liqDays(50),rocCalc(0); 
upBand = BollingerBand(Close,bollingerLengths,1.25); 
dnBand = BollingerBand(Close,bollingerLengths,-1.25); 
rocCalc = Close—Close[rocCalcLength-1]; {remember to subtract 1} 
if(MarketPosition <> 1 and rocCalc > 0) then 
Buy(‘‘BanditBuy’’)tomorrow upBand stop; 
if(MarketPosition <>-1 and rocCalc < 0) then 
SellShort(‘‘BanditSell’’) tomorrow dnBand stop; 
if(MarketPosition = 0) then liqDays = liqLength; 
if(MarketPosition <> 0) then 
begin 
liqDays = liqDays—1; liqDays = MaxList(liqDays,10); 
end; 
if(MarketPosition = 1 and Average(Close,liqDays) < upBand) then 
Sell(‘‘Long Liq’’) tomorrow Average(Close,liqDays) stop; 
if(MarketPosition = -1 and Average(Close,liqDays) > dnBand) then 
BuyToCover(‘‘Short Liq’’) tomorrow Average(Close,liqDays) stop; 
The Bollinger Bandit program demonstrates how to: 
 Invoke the Bollinger Band function. This function call is less than intuitive and must be passed three parameters: (1) price series, (2) number of elements in the sam-ple used in the calculation for the standard deviation, and (3) number of deviations above/below [[Moving Average|moving average]]. You must use a negative sign in the last parameter to get the band to fall under the [[Moving Average|moving average]]. 
 Invoke the MaxList function. This function returns the largest value in a list.  Do a simple rate of change calculation.  Create and manage a counter variable, liqLength.
134 BUILDING WINNING TRADING SYSTEMS WITH TRADESTATION 
TABLE 6.2 Bollinger Bandit Performance 
System Name: Bollinger Bandit Commission/Slippage = $75 Tested 2001—9/30/2011 
Total Net Max. # of Max. Cons. Markets Profit Draw Down Trades % Wins Losers 
British Pound $ (11,381.25) $ (34,450.00) 116 29.31% 7 Crude Oil $ 70,755.00 $ (63,630.00) 113 36.28% 7 Corn $ (3,362.50) $ (13,012.50) 120 27.50% 14 Copper $ 87,325.00 $ (41,525.00) 99 35.35% 8 Cotton $ 46,680.00 $ (25,455.00) 92 41.30% 6 Euro Currency $ 12,762.50 $ (40,325.00) 116 28.45% 10 Euro Dollar $ (6,978.75) $ (12,146.25) 120 27.50% 17 Heating Oil $ 31,999.20 $ (56,666.40) 118 33.90% 7 Japanese Yen $ (31,037.50) $ (49,575.00) 115 30.43% 14 Live Cattle $ (6,595.00) $ (16,257.50) 115 32.17% 10 Natural Gas $ 56,765.00 $ (70,090.00) 109 33.03% 6 Soybeans $ 23,700.00 $ (27,812.50) 113 30.09% 13 Swiss Franc $ 12,025.00 $ (32,125.00) 110 34.55% 8 Treasury Note $ 12,518.75 $ (17,628.13) 106 35.85% 8 U.S. Bonds $ 29,318.75 $ (19,243.75) 102 35.29% 6 Wheat $ (100.00) $ (20,375.00) 109 31.19% 9 Total $ 324,394.20 1773 
Bollinger Bandit trading performance is summarized in Table 6.2. A visual example of how this system enters and exits trades is shown in Figure 6.2. 
Bollinger Bandit Summary 
Overall trading performance was positive. You can see the similarities between the Bollinger and Keltner-based systems. The same markets that made good money in one system made good money in the other. These systems would not work well together due to their high level of correlation. This system did exceptionally well in the Japanese Yen and natural gas. Through further investigation, we discovered that our trailing stop mechanism only marginally increased profit and decreased draw down. Nonetheless, the concept probably adds a higher comfort level when a trade is initiated. We know that our risk should diminish the farther we get into a trade. This is due to the fact that a shorter-term [[Moving Average|moving average]] follows closer to the actual market than a longer-term average. 
THE THERMOSTAT TRADING STRATEGY 
We actually traded a strategy very similar to Thermostat. We named this system based on its ability to switch gears and trade in the two modes of the market, congestion and trend. This system sprang from our observations on the success of particular systems on particular market sectors. We thought that one system that also possessed a dual
Trading Strategies That Work (or the Big Damn Chapter on Trading Strategies) 135 
FIGURE 6.2 Bollinger Bandit Trades 
nature could be created to capitalize on the market’s two modes. We created a function to help determine the market’s mode. Based on the output of this function, the Thermostat switches from a trend-following mode to a short-term swing mode. The trend-following mode uses a trend-following mechanism similar to the one found in the Bollinger Bandit. The short-term swing system is an open range [[Breakout|breakout]] that incorporates pattern recog-nition. The function that causes the system to switch its approach is the same function that we described in Chapter 4, the ChoppyMarketIndex. 
If you have forgotten this function, here is a brief review. This function compares the distance the market wanders and the actual distance the market traveled—Abs(Close – 
Close[29])/(Highest(High,30) – Lowest(Low,30))*100. The function generates val-ues from 0 to 100. The larger the value, the less congested the current market is. If the ChoppyMarketIndex function returns a value of less than 20, then the system goes into the short-term swing mode. Basically, the market is demonstrating a swinging motion and the system tries to catch the swings and pull out a small profit. Thermostat tries to accomplish this feat by buying/selling on small market impulses. If the impulse is large enough, then the system jumps on and tries to ride the market out for the next few days. 
Through in-depth analysis of short-term swings, we have discovered that there exist certain days when it is better to buy than sell, and vice versa. These days can be deter-mined by a simple visual pattern. If today’s closing price is greater than the average of
136 BUILDING WINNING TRADING SYSTEMS WITH TRADESTATION 
yesterday’s high, low, and close (also known as the key of the day), then we feel tomor-row’s market action will probably be bearish. However, if today’s closing price is less than the average of yesterday’s high, low, and close, then today’s market will probably behave in a bullish manner. We classify these days as “sell easier” and “buy easier” days, respectively. We know that we can’t predict the market, and this is the reason we use the term “easier.” Even though today may be a buy easier day, we can still sell, and vice versa. We just make it easier to buy on buy easier days and sell on sell easier days. A position is triggered when the market moves a certain range from the open price. 
If today is a buy easier day, then: 
Initiate a long position at the open price + 50% of the ten-day average true 
range. 
Initiate a short position at the open price - 100% of the ten-day average true 
range. 
If today is a sell easier day, then: 
Initiate a short position at the open price - 50% of the ten-day average true 
range. 
Initiate a long position at the open price + 100% of the ten-day average true 
range. 
Sometimes the market will have a false impulse in the opposite direction of the short-term swing. These types of impulses can whipsaw you in and out of the market and only make money for your broker. We try to prevent this by comparing our calculated buy stop with the 3-day [[Moving Average|moving average]] of the low prices. If our calculated buy stop is less than the 3-day [[Moving Average|moving average]], we then move the buy stop up to the average calculation. If our sell stop is greater than the 3-day [[Moving Average|moving average]] of the high prices, we then move a sell stop down to the 3-day average. The system is in the market 100 percent of the time, when we are in choppy mode. Our short-term strategy of Thermostat is: If we have a move, we will be ready for it. It seems rather complicated, but once we get it programmed, we can forget about the complexity. If the ChoppyMarketIndex function returns a value greater than or equal to 20, then the system goes into the long-term trend-following mode. Our function has basically informed us that the market is moving in a general direction, without a bunch of noise. 
One of the best trend-following approaches that we have seen is the same approach that we used in the Bollinger Bandit. A long position is initiated when the market breaks through the upper Bollinger Band and initiates a short position when the market breaks through the lower Bollinger Band. In the case of the trend-following component of Ther-mostat, we used two standard deviations in our calculation, instead of the 1.25 we used in the Bollinger Bandit. If we have a long position, then we liquidate if the price moves back to the [[Moving Average|moving average]] and vice versa. We use the same 50-day [[Moving Average|moving average]] as we did before.
Trading Strategies That Work (or the Big Damn Chapter on Trading Strategies) 137 
Many times, you will have a position on when the market switches modes. If we switch from trending to congestion, we simply use the short-term entry method to get out of our trend mode position. However, if the market switches from congestion to trending and we have a position on, we then use a 3-day average true-range protective stop. This type of stop is utilized because the 50-day [[Moving Average|moving average]] exit that we used in trend mode is not congruent with our short-term entry technique. When designing trading systems, your entry and exit techniques must have similar time horizons. You wouldn’t use a 2-day low trailing stop on a long position that was initiated by the crossing of a 75-day [[Moving Average|moving average]]. If we are long, we calculate the average true range for the past 10 days and multiply this calculation by 3, and subtract the result from our entry price. If we are short, we again calculate the average true range for the past 10 days and multiply this calculation by 3, but then add the result to our entry price. Once we exit the positions that were initiated in choppy mode, we begin using the trend-following system to initiate any new signals. 
Thermostat Pseudocode 
Determine current market mode by using the ChoppyMarketIndex function. If the 
ChoppyMarketIndex function returns a value of less than 20, then use the short-
term swing approach. 
atr10 = AverageTrueRange(10) 
keyOfDay = (High + Low + Close)/3 
buyEasierDay = 0 
sellEasierDay = 0 
if(Close > keyOfDay) then sellEasierDay = 1 
if(Close<=keyOfDay) then buyEasierDay = 1 
avg3Hi = Average(High,3) 
avg3Lo = Average(Low,3) 
if(buyEasierDay = 1) then 
longEntryPoint = Open + atr10 * 0.5 
shortEntryPoint = Open—atr10 * 0.75 
if(sellEasierDay = 1) then 
longEntryPoint = Open + atr10 * 0.75 
shortEntryPoint = Open—atr10 * 0.5 
longEntryPoint = MaxList(longEntryPoint,avg3Lo) 
shortEntryPoint = MinList(shortEntryPoint,avg3Hi) 
Initiate a long position of today’s market action >= longEntryPoint 
Initiate a short position of today’s market action <= shortEntryPoint 
If the ChoppyMarketIndex function returns a value greater than or equal to 20, then use the long-term trend-following approach. 
If you have a short position that was initiated by the short-term swing approach, then 
shortLiqPoint = entryPrice + 3 * atr10 
Liquidate short position if today’s market action >= shortLiqPoint
138 BUILDING WINNING TRADING SYSTEMS WITH TRADESTATION 
If you have a long position that was initiated by the short-term swing approach, then 
longLiqPoint = entryPrice—3 * atr10 
Liquidate long position if today’s market action <=longLiqPoint 
Thermostat Program 
{Thermostat by George Pruitt 
Two systems in one. If the ChoppyMarketIndex is less than 20 then we are in a 
swing mode. If it is greater than or equal to 20 then we are in a trend mode. 
Swing system is an open range [[Breakout|breakout]] incorporating a buy easier/sell easier 
concept. The trend following system is based on [[Bollinger Bands|bollinger bands]] and is similar 
to the Bollinger Bandit program.} 
Inputs: bollingerLengths(50),trendLiqLength(50),numStdDevs(2), 
swingPrcnt1(0.50),swingPrcnt2(0.75),atrLength(10), 
swingTrendSwitch(20); 
Vars:cmiVal(0),buyEasierDay(0),sellEasierDay(0),trendLokBuy(0), 
trendLokSell(0),keyOfDay(0),swingBuyPt(0),swingSellPt(0), 
trendBuyPt(0),trendSellPt(0),swingProtStop(0); 
cmiVal = ChoppyMarketIndex(30); 
buyEasierDay = 0; 
sellEasierDay = 0; 
trendLokBuy = Average(Low,3); 
trendLokSell= Average(High,3); 
keyOfDay = (High + Low + Close)/3; 
if(Close > keyOfDay) then sellEasierDay = 1; 
if(Close <= keyOfDay) then buyEasierDay = 1; 
if(buyEasierDay = 1) then 
begin 
swingBuyPt = Open of tomorrow + swingPrcnt1*AvgTrueRange(atrLength); 
swingSellPt = Open of tomorrow—swingPrcnt2*AvgTrueRange(atrLength); end; 
if(sellEasierDay = 1) then 
begin 
swingBuyPt = Open of tomorrow + swingPrcnt2*AvgTrueRange(atrLength); 
swingSellPt = Open of tomorrow—swingPrcnt1*AvgTrueRange(atrLength); end; 
swingBuyPt = MaxList(swingBuyPt,trendLokBuy); 
swingSellPt = MinList(swingSellPt,trendLokSell); 
trendBuyPt = BollingerBand(Close,bollingerLengths,numStdDevs); 
trendSellPt = BollingerBand(Close,bollingerLengths,- numStdDevs); 
if(cmiVal < swingTrendSwitch)then 
begin 
if (MarketPosition <> 1) then Buy(‘‘SwingBuy’’) next bar at swingBuyPt 
stop; 
if(MarketPosition <> -1) then SellShort(‘‘SwingSell’’) next bar at 
swingSellPt stop; 
end 
else
Trading Strategies That Work (or the Big Damn Chapter on Trading Strategies) 139 
begin 
swingProtStop = 3*AvgTrueRange(atrLength); 
Buy(‘‘TrendBuy’’) next bar at trendBuyPt stop; 
SellShort(‘‘TrendSell’’) next bar at trendSellPt stop; 
Sell from Entry(‘‘TrendBuy’’) next bar at Average(Close,trendLiqLength) 
stop; 
BuyToCover from Entry(‘‘TrendSell’’) next bar at 
Average(Close,trendLiqLength) stop; 
Sell from Entry(‘‘SwingBuy’’) next bar at EntryPrice—swingProtStop stop; 
BuyToCover from Entry(‘‘SwingSell’’) next bar at EntryPrice + 
swingProtStop stop; 
end; 
The Thermostat program demonstrates how to: 
 Invoke the ChoppyMarketIndex function. This function simply needs the number of bars in the calculation to be passed to it. 
 Properly use an if-then-else control structure.  Tie an exit strategy to a specific entry strategy using the “from entry” keywords.  Calculate the key of the day, also known as the day trader’s pivot point.  Use the next day’s opening price in the calculation of your buy/sell orders. 
Thermostat trading performance is summarized in Table 6.3. A visual example of how this system enters and exits trades is shown in Figure 6.3. 
Thermostat Summary 
This program performed admirably in most of the markets. The synthesis of the two different approaches seemed like the way to go in the interest-bearing markets, Treasury bonds, and Treasury notes. Again, we were able to demonstrate an approach with one set of parameters for all markets. If there is only one thing you take away with you from this book, it should be the knowledge that market principles are generally universal. Thermostat falls in the category of intermediate-term trend follower; it generates around 15 to 20 trades per year. Due to its ability to trade a shorter time horizon, Thermostat would probably be a good candidate to trade in concert with a longer-term approach. If you look at the trade-by-trade analysis, you probably won’t see many trades labeled as “TrendBuy” or “TrendSell.” This might lead you to believe that the system was mostly in the choppy trading mode. You would be wrong. In fact, the system was considerably more in the trending mode (as defined as a ChoppyMarketIndex reading above 20). Many times after a trade is initiated in the choppy or swing mode, the overall market mode switches to trending and stays in that mode for an extended period of time. If the market changes mode and doesn’t trend in the direction of the trade, it eventually is stopped out. If the market does trend in the direction of the trade, then the position is held until the
140 BUILDING WINNING TRADING SYSTEMS WITH TRADESTATION 
TABLE 6.3 Thermostat Performance 
System Name: Thermostat Commission/Slippage = $75 Tested 2001—9/30/2011 
Total Net Max. # of Max. Cons. Markets Profit Draw Down Trades % Wins Losers 
British Pound $ 5,293.75 $ (26,137.50) 106 31.13% 8 Crude Oil $ 66,475.00 $ (113,105.00) 143 34.27% 8 Corn $ 5,762.50 $ (30,262.50) 132 34.85% 9 Copper $ 75,275.00 $ (33,362.50) 52 40.38% 6 Cotton $ 62,430.00 $ (20,025.00) 122 33.61% 6 Euro Currency $ 59,162.50 $ (36,437.50) 100 34.00% 8 Euro Dollar $ (1,233.75) $ (6,268.75) 92 21.74% 10 Heating Oil $ 78,139.20 $ (72,363.60) 165 32.73% 8 Japanese Yen $ (12,675.00) $ (47,887.50) 106 29.25% 8 Live Cattle $ (2,240.00) $ 24,980.00 143 34.27% 8 Natural Gas $ 15,330.00 $ (164,105.00) 134 34.33% 8 Soybeans $ 43,912.50 $ (32,087.50) 149 38.93% 7 Swiss Franc $ 17,312.50 $ (32,650.00) 113 38.05% 11 Treasury Note $ (1,346.88) $ (27,931.25) 144 34.03% 12 U.S. Bonds $ (2,993.75) $ (33,368.75) 167 31.74% 9 Wheat $ 1,075.00 $ (32,487.50) 82 28.05% 9 Total $ 409,678.57 1950 
FIGURE 6.3 Thermostat Trades
Trading Strategies That Work (or the Big Damn Chapter on Trading Strategies) 141 
market either ends the trend or changes mode. Either way, the trade actually turns out to be a trend trade instead of a choppy or swing trade. If there is a large profit, then the SwingBuy/Sell gets the credit. In other words, the system performance is generated by both systems, even though it doesn’t look like it. 
THE DYNAMIC BREAK OUT II STRATEGY 
George Pruitt for Futures Magazine designed the original Dynamic Break Out system in 1996. This version has done well since it was released for public consumption in 1996. This version will be included in Appendix A. The newer version of the Dynamic Break Out is just like the original, except we have incorporated an additional adaptive filter. The key to the Dynamic Break Out II system is its ability to adapt its parameters to cur-rent market conditions. This system is based on the tried-and-tested Donchian channel system. Remember how the Donchian system works: Buy when the high of the day pen-etrates the highest high price of x bars back, and sell when the low of the day penetrates the lowest low of x bars back. If you optimize the number of bars to determine your best entry and exit levels, you will discover that different markets work better with different parameters. You will also discover that a particular market goes through different cycles and works better with different parameters through time. For example, the Japanese Yen may have performed better with a look back of 40 days in the 1980s, but now works bet-ter with a look back of 20 days. That is the major problem with using a static parameter for all markets. The Dynamic Break Out II system allows the number of look-back days to change with the current market. Instead of using a static parameter, this system changes the parameters based on an aspect of the current market. 
Before you can use an adaptive parameter, you must come up with a function or adaptive engine that automatically changes the value of the once-static parameter. The input of this adaptive engine should be some form of market statistic. In the case of the Dynamic Break Out II, we used market volatility. When market volatility expands, so does the number of look-back days in our [[Breakout|breakout]] calculation. Increased market volatility usually equates to market indecisiveness. By increasing the number of look-back days when market volatility increases, we make it more difficult for the system to initiate a trade. When market volatility decreases, we reduce the number of look-back days. Low market volatility equates to a trending market. By decreasing the number of look-back days, we encourage the system to initiate a trade. This helps the Dynamic Break Out II to lock into long-term profits and be on the lookout for a change in the long-term trend. 
We use market volatility to fuel our adaptive engine, but you could use any mar-ket characteristic. We can visualize an engine that uses a market’s overbought/oversold state. If we had a long position in a market, and it became overbought, we could use an overbought/ oversold indicator to adapt the parameter that determines the sell point. Once an adaptive engine is dreamed up and it is pumping out values, you must maintain
142 BUILDING WINNING TRADING SYSTEMS WITH TRADESTATION 
the values in an acceptable range. The Dynamic Break Out II system will not let the look-back days go above 60 or below 20. Through optimization, we discovered that look-back lengths that fell beyond these boundaries did not generate acceptable expectations. An adaptive engine that generates useless values is useless in itself. The Dynamic Break Out II initially looks back 20 days to determine its buy and sell levels. So when you start trading this system, your first buy point is the highest high of the past 20 days and your sell point is the lowest low of the past 20 days. At the end of each day, you measure the current market volatility by calculating the standard deviation of the past 30 days’ closing prices. Market volatility can be measured using different calculations: average range, average true range, standard deviation of change in closing prices, and others. Once we determine today’s market volatility, we compare it with yesterday’s. If the volatility increases, then the number of look-back days also increases. We change the number of look-back days to the exact amount of the change in market volatility; if volatility increases by 10 percent, then so does the number of look-back days, and vice versa. 
The original Dynamic Break Out made its buying and selling decisions solely based on the highest high and lowest low values that were generated by our volatility-based adaptive engine. Once a position was initiated, a simple, yet effective, $1,500 money man-agement stop was put into place. The newer version uses the same entry technique in concert with an adaptive Bollinger Band. The length of the Bollinger Band calculation is the same number of look-back days that is generated by the adaptive engine. The close of yesterday must be above the upper band, and today’s high must be greater than or equal to the highest high of x bars back before a long position can be initiated (x bars back is equal to our adaptive look-back days value). Yesterday’s close must be below the lower band, and today’s low must be less than or equal to the lowest low of x bars back before a short position can be taken. Instead of the simple money management stop, we have incorporated a dynamic trailing stop. As we have discussed, the number of look-back days changes on a daily basis. The adaptive engine decides the amount of change. The liquidation point of an existing trade is determined by calculating a simple [[Moving Average|moving average]] of closing prices for the past look-back days. The sell liquidation would be just the opposite of the buy liquidation. 
Dynamic Break Out II Pseudocode 
If BarNumber = 1 then lookBackDays = 20 
Else do the following 
Today’s market volatility = StdDev(Close,30) 
Yesterday’s market volatility = StdDev(Close[1],30) 
deltaVolatility = (today’s volatility—yesterday’s volatility)/today’s volatility 
lookBackDays = (1 + deltaVolatility) * lookBackDays 
lookBackDays = MinList(lookBackDays,60) 
lookBackDays = MaxList(lookBackDays,20) 
upBand = Average(Close,lookBackDays) + StdDev(Close,lookBackDays) *2.00
Trading Strategies That Work (or the Big Damn Chapter on Trading Strategies) 143 
dnBand = Average(Close,lookBackDays) -
StdDev(Close,lookBackDays) *2.00 
buyPoint = Highest(High,lookBackDays) 
sellPoint = Lowest(Low,lookBackDays) 
longLiqPoint = Average(Close,lookBackDays) 
shortLiqPoint = Average(Close,lookBackDays) 
If Close of yesterday > upBand) then initiate a long 
position if today’s market action >= buyPoint 
If (Close of yesterday < dnBand) then initiate a short 
position if today’s market action <= sellPoint 
Liquidate long position if today’s market action <= 
longLiqPoint 
Liquidate short position if today’s market action >= 
shortLiqPoint 
Dynamic Break Out II Program 
{Dynamic Break Out II by George Pruitt 
This system is an extension of the original Dynamic Break Out system written 
by George for Futures Magazine in 1996. In addition to the channel break 
out methodology, DBS II incorporates [[Bollinger Bands]] to determine trade 
entry.} 
Inputs: ceilingAmt(60),floorAmt(20),bolBandTrig(2.00); 
Vars: lookBackDays(20),todayVolatility(0),yesterDayVolatility(0), 
deltaVolatility(0); 
Vars: buyPoint(0),sellPoint(0),longLiqPoint(0),shortLiqPoint(0),upBand(0), 
dnBand(0); 
todayVolatility = StandardDev(Close,30,1); 
yesterDayVolatility = StandardDev(Close[1],30,1); {See how I offset the 
function call to get 
yesterday’s value} 
deltaVolatility = (todayVolatility—yesterDayVolatility)/todayVolatility; lookBackDays = lookBackDays * (1 + deltaVolatility); 
lookBackDays = Round(lookBackDays,0); 
lookBackDays = MinList(lookBackDays,ceilingAmt); {Keep adaptive engine 
within 
bounds} 
lookBackDays = MaxList(lookBackDays,floorAmt); 
upBand = BollingerBand(Close,lookBackDays,+bolBandTrig); 
dnBand = BollingerBand(Close,lookBackDays,-bolBandTrig); 
buyPoint = Highest(High,lookBackDays); 
sellPoint = Lowest(Low,lookBackDays); 
longLiqPoint = Average(Close,lookBackDays); 
shortLiqPoint = Average(Close,lookBackDays); 
if(Close > upBand) then Buy(‘‘DBS-2 Buy’’) tomorrow at buyPoint stop; 
if(Close < dnBand) then SellShort(‘‘DBS-2 Sell’’) tomorrow at sellPoint stop; 
if(MarketPosition = 1) then Sell(‘‘LongLiq’’) tomorrow at longLiqPoint stop; 
if(MarketPosition = -1) then BuyToCover(‘‘ShortLiq’’) tomorrow at 
shortLiqPoint stop;
144 BUILDING WINNING TRADING SYSTEMS WITH TRADESTATION 
TABLE 6.4 Dynamic Break Out II Performance 
System Name: Dynamic Break Out Commission/Slippage = $75 Tested 2001—9/30/2011 
Total Net Max. # of Max. Cons. Markets Profit Draw Down Trades % Wins Losers 
British Pound $ 14,100.00 $ (18,375.00) 55 41.82% 6 Crude Oil $ 73,350.00 $ (45,585.00) 62 33.87% 11 Corn $ (6,512.50) $ (15,787.50) 60 30.00% 6 Copper $ 104,175.00 $ (25,125.00) 57 36.84% 4 Cotton $ 30,120.00 $ (26,490.00) 61 32.79% 7 Euro Currency $ 63,275.00 $ (28,700.00) 63 33.33% 6 Euro Dollar $ (4,595.00) $ (8,321.25) 57 31.58% 8 Heating Oil $ 53,876.40 $ (53,157.00) 54 31.48% 10 Japanese Yen $ (8,675.00) $ (32,187.50) 54 33.33% 6 Live Cattle $ 12,175.00 $ (8,552.50) 49 36.73% 7 Natural Gas $ 15,385.00 $ (89,640.00) 67 34.33% 6 Soybeans $ 42,762.50 $ (15,350.00) 52 40.38% 5 Swiss Franc $ 1,925.00 $ (25,087.50) 61 31.15% 12 Treasury Note $ 16,181.25 $ (14,681.25) 53 37.74% 9 U.S. Bonds $ (1,493.75) $ (28,175.00) 52 26.92% 11 Wheat $ (5,437.50) $ (24,437.50) 62 22.58% 8 Total $ 400,611.40 919 
The Dynamic Break Out II program demonstrates how to: 
 Measure market volatility by using the standard deviation of closing prices.  Create a dynamic parameter using an adaptive engine. 
Dynamic Break Out II trading performance is summarized in Table 6.4. A visual ex-ample of how this system enters and exits trades is shown in Figure 6.4. 
Dynamic Break Out II Summary 
The results of these trend-following systems seem to confirm that the trend is your friend. We guess we let the cat out of the bag . . . and what an ugly cat it is. The majority of successful trading systems are of the long-term trend-following variety. Almost all traders realize this fact, but it doesn’t stop them from searching out a shorter-term approach. See, the trend-following systems require diversification, which requires hefty capitalization. Also, trend-following systems can have substantial draw downs and go for years without making any money. The typical trader cannot persevere through these bad attributes, even though they know they will probably be rewarded in the long run. 
A different approach to trend following that has had a devout (almost cultlike) fol-lowing for years is the idea of cycles. Many markets, such as the grains, have been proven
Trading Strategies That Work (or the Big Damn Chapter on Trading Strategies) 145 
FIGURE 6.4 Dynamic Break Out II Trades 
to move in a cyclical fashion due to the seasonality aspect of their underlying fundamen-tals. If we do indeed know ahead of time that these markets have this cyclical nature, then why can’t we capture their movements? Cycles are very difficult to calculate and de-termine and, therefore, are usually overlooked. The two most predominant methods for finding cycles are trigonometric curve-fitting and Fourier (spectral) analysis. The mathe-matics behind these two methods is relatively complex and detailed. We personally have never seen a pure mathematically based, cycle-finding trading system outperform the typ-ical trend follower. If you do have any interest in this area, we refer you to John Ehlers, Rocket Science for Traders. Since we are on the subject of cycles and seasonality, why don’t we program a strategy that incorporates a seasonality filter? We will demonstrate how to use the keyword “date” to determine the current month and day. This system will trade the soybeans and will only take long signals from March 1 to July 1 and will only take short signals from July 2 to February 28. These dates were derived from cyclical analysis of historical data on soybeans. (Table 6.5 shows the performance of our sea-sonal soybean system.) 
Inputs: goLongStart(301),goLongEnd(701),goShortStart(702),goShortEnd(228); 
Vars: monthAndDay(0); 
{The inputs represent the months and days that we can enter long and short 
trades}
146 BUILDING WINNING TRADING SYSTEMS WITH TRADESTATION 
{301 is March 01 >> can only go long from this date and up to 
701 is July 01 >> this date 
702 is Jul7 02 >> can only go short from this date and up to 
228 is February 28 >> this date} 
{Let’s use the date and extract the information that we need from it to 
determine the month and the day} 
{If we divide the date by 10000, the remainder is the month and day. We 
can use the modulus function} 
monthAndDay = Mod(Date of tomorrow,10000); 
if(monthAndDay >= goLongStart and monthAndDay <= goLongEnd ) then 
begin 
if close > highest(h[1],20) then buy(‘‘Seasonal Buy’’) tomorrow at Open; 
end; 
TABLE 6.5 Seasonal Soybean Results 
All Trades Long Trades Short Trades 
Total Net Profit ($1,637.50) ($9,462.50) $7,825.00 Gross Profit $89,062.50 $28,462.50 $60,600.00 Gross Loss ($90,700.00) ($37,925.00) ($52,775.00) Profit Factor 0.98 0.75 1.15 
Total Number of Trades 68 26 42 Percent Profitable 41.18% 42.31% 40.48% Winning Trades 28 11 17 Losing Trades 40 15 25 Even Trades 0 0 0 
Avg. Trade Net Profit ($24.08) ($363.94) $186.31 Avg. Winning Trade $3,180.80 $2,587.50 $3,564.71 Avg. Losing Trade ($2,267.50) ($2,528.33) ($2,111.00) Ratio Avg. Win:Avg. Loss 1.4 1.02 1.69 Largest Winning Trade $27,900.00 $11,137.50 $27,900.00 Largest Losing Trade ($13,975.00) ($13,975.00) ($6,425.00) Largest Winner as % of Gross Profit 31.33% 39.13% 46.04% Largest Loser as % of Gross Loss 15.41% 36.85% 12.17% 
Max. Consecutive Winning Trades 4 4 3 Max. Consecutive Losing Trades 6 4 4 
Return on Initial Capital −1.64% Annual Rate of Return −0.08% Buy and Hold Return 252.08% Return on Account −6.66% Avg. Monthly Return $93.65 Std. Deviation of Monthly Return $3,089.63 
Max. Draw Down (Trade Close to Trade Close) Value ($24,587.50) ($18,375.00) ($20,262.50) Date 8/24/2011 14:15 Max. Trade Draw Down ($13,975.00) ($13,975.00) ($7,262.50)
Trading Strategies That Work (or the Big Damn Chapter on Trading Strategies) 147 
if(monthAndDay >= goShortStart or monthAndDay <= goShortEnd ) then 
{Notice that we had to use ‘‘or’’ instead of ‘‘and’’—this is due 
to the goShortEnd date is less than the goShortStart date} 
begin 
if close < lowest(l[1],20) then sellShort(‘‘Seasonal Sell’’) tomorrow 
at Open; 
end; 
If MarketPosition = 1 and close < lowest(l[1],20) then 
sell(‘‘LongLiq’’) tomorrow at open; 
If MarketPosition =-1 and close > highest(h[1],20) then 
buyToCover(‘‘shortLiq’’) tomorrow at open;end; 
THE SUPER COMBO [[Day Trading|DAY TRADING]] STRATEGY 
So far we have concentrated on longer-term trend-following systems using daily bar anal-ysis. We are now going to work with strategies that deal with intraday bars. Working with intraday bars is the same as working with daily bars. TradeStation doesn’t care what time frame you are working with (tick, minute, day, or week); all built-in indicators and func-tions work the same. The only time programming gets complex is when you are dealing with more than one time frame at a time. Many systems trade on intraday bars, but use daily bars to calculate their buy and sell signals. The Super Combo strategy falls under this category. This system is designed to day trade the stock indices. We should call this the kitchen-sink day trader, because we have thrown a lot of different ideas into this one system. This system is rather complex and, therefore, so is the programming code. If you can understand this code, then we doubt there are too many trading ideas that you couldn’t program. We will program a system in a modular format to make it easier to un-derstand. In addition, the program code will be heavily laden with comments to further aid in digestion. 
Of all of the day trade systems that Futures Truth monitors and ranks, the systems that feature both [[Breakout|breakout]] and failed [[Breakout|breakout]] technology always top the list of best performers. Instead of reinventing the wheel, we will borrow this overall concept and use it as a foundation for our own system. First, let’s discuss the [[Breakout|breakout]] component of the Super Combo. If you look at a daily bar on almost any trading instrument, you will notice that the high price is always greater than or equal to the open and close prices. On nonlimit days, it is always higher than the low. At some time during the day, there was more demand than there was supply and, therefore, the market moved up above the open. Conversely, when supply was greater than demand, the market moved down. The objective of an open-range [[Breakout|breakout]] system is to try to capture some of the market movement between the open and high (or close) or the open and low (or close). The key to successful [[Breakout|breakout]] systems is finding the “sweet spot” above or below the open that foretells further movement in that direction. The worst feeling in the world for a day trader comes from buying at or near the high and selling at or near the low. Your buy point must be above the high of the day when the market has no direction and at the same time must be well below the high when the market has a strong directional move.
148 BUILDING WINNING TRADING SYSTEMS WITH TRADESTATION 
Your sell point must have the same attributes. You are probably thinking to yourself that this is impossible. You would be right. But we all know that trading is not impossible. Difficult, yes, but not impossible. This is the beauty of the Super Combo; it knows it must stick its neck out and buy/sell breakouts, but it also knows that there is a great likelihood that the initial [[Breakout|breakout]] will fail. This is where the failed [[Breakout|breakout]] logic kicks into high gear. Once a certain price level is achieved (upside or downside), the system switches gears and begins to look for failed [[Breakout|breakout]] opportunities. How many times have you seen a bar chart where the open is near the high and the close is near the low or just the opposite? These are perfect examples of failed [[Breakout|breakout]] opportunities. These concepts are how the Super Combo enters the market. 
Once a trade has been initiated, the system uses protective, break-even, and trailing stops to manage the position. The system also utilizes a protective stop reversal. Some-times a trade is put on and failure occurs within the next couple of hours. This can occur without the system sensing a failed [[Breakout|breakout]]. So, under certain conditions, we allow the system to reverse its position at the protective stop level, even when a failed [[Breakout|breakout]] isn’t signaled. After the system reaches a certain profit level, the protective stop moves to a break-even level. Later in the afternoon, when the likelihood of profit taking and re-tracements of the overall trend increases, the protective or break-even stop switches to a trailing stop. It may seem to you that the exit techniques are much more complex and thought out than the entry techniques. Many traders don’t realize that trade management determines the success of the entry technique and, therefore, they spend all their time trying to figure out the best way to get into the market. Research time should be split between entries and exits. If all goes well with our entry, the position will be closed at the end of trading. 
There is one more important point concerning this system: No trade can be taken within 30 minutes of the open time. This filter (a technique to help pick out good trades) allows the market to digest any reports that come out before and slightly after the stock indices open. If you take a look at the first 30 minutes of a stock index, especially on report days, you will discover an extreme level of volatility. This volatility will play havoc with any [[Breakout|breakout]]-based trading strategy. So, let’s just skip it. 
Now that we know the overall approach of the Super Combo, let’s get a little more specific. The open-range [[Breakout|breakout]] shouldn’t be foreign to you because we described it in the Thermostat strategy. Nor should the buy easier day and sell easier day concept be unfamiliar. The Super Combo system utilizes both ideas to calculate the entry points for the [[Breakout|breakout]] component. The first step is to see if we can even take a trade today. We have spent many hours researching the consequences of wide range and small range bars, and have drawn the conclusion that small range bars usually give a hint to a subsequent wide range bar. So, if yesterday was a small range bar, then we can attempt a trade today; or else we simply skip today and look for something else to do. We consider a bar to be a small range bar (SRB) by comparing the absolute value of the Open – Close of yesterday’s bar to the average of the absolute values of the past 10 days’ Open – Close 
values. If the bar’s open-to-close range is less than 85 percent of the 10-day average open-to-close range, then it is considered an SRB. Once we find out that we can trade, we must
Trading Strategies That Work (or the Big Damn Chapter on Trading Strategies) 149 
then determine if today is a buy easier or a sell easier day. A buy easier day occurs when the close is less than or equal to the previous day’s close. A sell easier day is simply the converse; today’s close is greater than the previous day’s close. (Note: We give a slight bias to the buy easier day in case the close of today and the close of yesterday are exactly the same.) Remember, we are making it easier to buy or sell; we are not ruling out a potential buy or sell. Prior to the bear market of 2000, you would be surprised at the number of systems that only bought or made it difficult to sell. If today is a buy easier day, we can buy at the open of today plus 30 percent of the 10-day average true range, and sell at the open of today minus 60 percent of the 10-day average range (don’t use true ranges). On the other hand, if today is a sell easier day, we can sell at the open of today minus 30 percent of the 10-day average range, and buy at the open of today plus 60 percent of the 10-day average range. 
Now that we understand the [[Breakout|breakout]] component of the Super Combo, let’s delve into the failed [[Breakout|breakout]] methods. In terms of our system, the following three scenarios define a failed upside [[Breakout|breakout]]: 
1. The market gaps above yesterday’s high a certain amount and then trades below it a certain amount. 
2. The market opens below and moves above yesterday’s high a certain amount and then trades below it a certain amount. 
3. A long position is initiated and failure occurs before 12:00 noon Central Time (CT). Failure is defined as being stopped out. We take advantage of this if failure doesn’t happen too quickly. 
The opposite is true for a failed [[Breakout|breakout]] to the downside. We look to get in the market when any of these three scenarios occur. This type of entry can be defined as countertrend; a position is being entered against the prevailing trend. 
When we enter a trade from a [[Breakout|breakout]] method, we use a protective stop equal to 25 percent of the average range or three full points, whichever is greater. By using a percentage-based protective stop, we are adapting our protection to the current market condition. If a market is exhibiting high volatility, then a tight fixed stop will get you stopped out with a loss on most trades. On the flip side of the coin, if the market is exhibiting low volatility, then a large fixed stop will risk more than the potential reward and eventually net failure. Adaptive parameters or stops must have boundaries so they won’t take on ridiculous values, hence the three-point floor. In today’s volatile markets, a protective stop of less than three points is a disaster waiting to happen. We use the same protective stop on the failed [[Breakout|breakout]] entry with one exception. If we enter a position at a [[Stop Loss|stop loss]] level, we use 15 percent instead of 25 percent of the average range or three full points. The reason behind the different protective stop level for this entry is that there is a chance the market may not have any direction for the entire day. The market proved indecisive by stopping our initial position out. We will nibble on what the market is offering, but we will use a tight stop in case the market performs a double
150 BUILDING WINNING TRADING SYSTEMS WITH TRADESTATION 
whammy. If the market looks kindly on us and provides a profit equal to 50 percent of the 10-day average range, then we pull our protective stop up to a break-even point. In doing so, we achieve a free trade minus slippage and commission. Later in the afternoon, specifically after 2:30 p.m. CT, we trail our protective stop below/above the low/high of the prior three 5-minute bars. Again, through extensive studies, we have discovered that the market will more times than not fade the overall daily trend in the last 30 to 45 minutes of trading. Losing all of the day’s profit in the last 15 minutes is almost as heartbreaking as buying the high and selling the low. Since we are not trying to scalp the market, we will only test the waters twice on a daily basis. In other words, we will initiate only one long position and/or one short position during the day. Once we have entered the market twice, we stop looking for another entry. That’s it. Finito. 
We have just about given you everything except the kitchen sink. There should be enough ideas in this one system to build a whole slew of different strategies. The Super Combo sounds rather complicated, doesn’t it? If you think it sounds complicated, wait until we try to program it. The best way to attack this monster is one modular block at a time. First, let’s pseudocode all of the calculations that deal with daily bars. This may be a good time to introduce TradeStation’s capabilities that deal with multiple data streams and time frames. With TradeStation and EasyLanguage, you can analyze up to five different data and/or time frames. In the case of the Super Combo, we will deal with two different time frames: 5-minute and daily. We will use the daily bar data to feed our calculations and the 5-minute data to actually enter our trades. Why 5-minute bars instead of 15-minute or any other time interval bars, you may ask. If at all possible, it is always best to test your trading ideas on the smallest bar increment that you can. If we had the computer power and time, we would have tested on individual tick bars. The higher or finer the time resolution, the more accurate your testing will be. We will let the online TradeStation further explain this: 
Calculating Orders on Historical Data Time-based bars include the Open, High, 
Low, and Close for the specified time period. When you work with historical data, 
TradeStation doesn’t know the chronological order of the transactions that make 
up the bar. The only transactions for which the chronology is known are the Open, 
which occurred first, and the Close, which occurred last. With time-based bars 
based on historical data there is no way to know whether the market opened and 
then went down, or the market opened and then went up. 
However, because the order of ticks can be important, two general rules were es-
tablished about price movement and the chronological order in which ticks occur. 
Assumption 1—The order in which prices on a bar are reached relates to the prox-
imity of the Open to the Low and to the High. When the Open is closer to the Low 
than to the High, TradeStation assumes that the Low was reached first. Likewise, 
if the Open is closer to the High, TradeStation assumes that the High was reached 
first. For example, say you have a buy order at 100. You protect yourself against
Trading Strategies That Work (or the Big Damn Chapter on Trading Strategies) 151 
losses at 97 points or lower, and want to exit the position at 101 or higher. The 
Open is 99 points. The High of the day is 103 and the Low is 92, so the Open is 
closer to the High. In this case, your buy order is filled at 100 and your strategy 
will generate your profit-taking exit order at 101, thus recording a profit of 1 point. 
However, it’s possible that in reality the price climbed to 100, at which point your 
entry order was filled, and then it dipped, hitting 99, before climbing back up to 
101. In this case, you would actually have taken a loss of 1 point instead of a profit 
of 1 point. So, looking at historical data, and based on the market assumption 
described earlier, TradeStation would record this trade as a winner, when it would 
in fact have been a loser. The opposite could happen also, where a trade could be 
recorded as a loser when it was actually a winner. 
To more closely simulate market activity in these cases, TradeStation developed 
what is known as Bouncing Ticks. When enabled, TradeStation automatically 
sends the data down by a percentage (the TradeStation default is 10%) imme-
diately after a buy or sell order, and then comes back up to the next item on the 
bar (High, Low, or Close). This action more closely resembles what happens using 
real-time data. Using this 10 percent setting on the example above, the buy would 
have happened at 100, and would have dropped immediately by 10% to 99 (to more 
closely resemble real-time results), your exit would be recorded at 99, and the bar 
would more correctly reflect the losing trade that would have happened if you had 
been using real-time data. 
Assumption 2—Symbols trade at every price along the bar. 
The second assumption is that a symbol trades at every price along the bar. That 
may not always be an accurate assumption. If, using the example above again, 
you had a buy order at 100, and the symbol actually traded at 99 and then jumped 
to 101, the strategy would record your buy at 100, even though you actually were 
filled at 101. If your exit was at 110, then the strategy would record a profit of 
10 points, even though your true profit would be only 9 points. This assumption 
might cause a strategy to appear more or less profitable than it actually was. 
TradeStation allows you to avoid both of these assumptions by setting a back-
testing resolution. Setting a back-testing resolution allows your strategies to be 
evaluated according to the actual prices in the order they occurred. 
For instructions on enabling the Bouncing Ticks option, see “Setting the Bouncing 
Ticks Option.” 
The smaller the time increment that you are dealing with, the less chance there is for error. A 15-minute bar is made up of three 5-minute bars. Inside the 15-minute bar there
152 BUILDING WINNING TRADING SYSTEMS WITH TRADESTATION 
may be a price that was never traded, a [[Gap|gap]] between the high or low and the subsequent open price on a 5-minute bar. Also, the ambiguity of which occurred first, the high price or the low price, decreases with a finer time frame. Figure 6.5, which is the same as Figure 4.6, again illustrates how the accuracy of actual market movement increases with smaller time interval bars. The latest incarnation of TradeStation allows you to even use tick data, the finest data resolution, to accurately back-test your trading strategy. You can set the back-testing resolution by right clicking your chart and selecting Format Strategies 
and then selecting Properties For All. A familiar dialog will open and you will see the section where you can set the back-testing resolution. In a perfect world where data is limitless and computers are as fast as the speed of light, we would always enable this feature utilizing tick data. Since we are not perfect, then we must be discerning about when to enable this feature. If this feature is enabled, especially at the tick level, the amount of time to back-test increases dramatically. If you develop a system that trades just one time a day, then you wouldn’t enable the back-testing resolution. If you develop a system that has an intraday stop or a profit objective on the day of entry, you could get by with setting the resolution to a 5-minute bar. Again, this feature is limited to whatever data is available and computational speed. If you are already testing on 5-minute bars, then don’t worry about back-testing resolution unless you have incredibly tight limit or stop orders. 
Now that we know why we are using 5-minute bars, let’s move on. Before we got on the back-testing data resolution tangent, we were about to program the daily bar–based calculations. One more note, though! This system was programmed prior to the EasyLanguage engineers creating some very nifty functions. We are going to show the original version and then we will show an updated version that eliminates some of the code that can be eliminated with the updated EasyLanguage. 
Super Combo Daily Data Bar Calculation Pseudocode 
averageRange = Average(Range of Daily Data,10) 
averageOCRange = Average(Abs(Open-Close of Daily Data),10) 
canTrade = Abs(Open-Close of Daily Data) < 85% of averageOCRange 
buyEasierDay = 0 
sellEasierDay = 0 
if(Close of Daily Data<=Close[1] of Daily Data) then buyEasierDay= 1 
if(Close of Daily Data>Close[1] of Daily Data) then sellEasierDay= 1 
if(buyEasierDay) then 
buyBOPoint = Open of tomorrow + 30% of averageRange 
sellBOPoint = Open of tomorrow - 60% of averageRange 
if(sellEasierDay) then 
sellBOPoint = Open of tomorrow - 30% of averageRange 
buyBOPoint = Open of tomorrow + 60% of averageRange 
longBreakPt= High of Daily Data + 25% of averageRange {upsidebreak 
out achieved} 
shortBreakPt = Low of Daily Data - 25% of averageRange {dnside break 
out achieved}
Trading Strategies That Work (or the Big Damn Chapter on Trading Strategies) 153 
{dnside BO failure buy pt} 
longFBOPoint = Low of Daily Data + 25% of averageRange 
{upside BO failure sell pt} 
shortFBOPoint = High of Daily Data - 25% of averageRange 
Now for the 5-minute bar pseudocode. We must initialize some variables on the first bar of the day. 
if(Date <> Date[1]) then {a trick to determine the first bar of the day} 
barCount = 1 
intraHigh = 0 
intraLow = 99999999 
buysToday = 0 
sellsToday = 0 
currTrdType = 0 
If this bar’s date is the same as the previous bar, then we know that we are progress-ing through today. 
if(Date = Date[1]) then barCount = barCount + 1 
If barCount is greater than 6, then we know that we have surpassed the first six bars of the day. 
if(barCount > 6) then {skipped first 6 - 5min bars or first 30 mins} 
Let’s keep track of the number of buy entries and sell entries for today. 
if(MarketPosition = 1) then buysToday = 1 {if we are long we must have bought 
today} 
if(MarketPosition = -1) then sellsToday = 1 {same goes for being short} 
Now let’s enter the market on a buy or sell [[Breakout|breakout]]. 
if(buysToday = 0 and Time < 1430) then Buy(‘‘LBreakOut’’) next bar at 
buyBOPoint stop 
if(sellsToday = 0 and Time < 1430) then Sell(‘‘SbreakOut’’) next bar 
at sellBOPoint stop 
Has the market exceeded yesterday’s high plus 25 percent of the average range? 
if(high > longBreakPoint and Time < 1430) then 
If it has, look to sell as the market moves back down to yesterday’s high – 25 percent of the average range. 
if(sellsToday = 0) then SellShort(‘‘SfailedBO’’) next bar at shortFBOPoint stop
154 BUILDING WINNING TRADING SYSTEMS WITH TRADESTATION 
Another failed [[Breakout|breakout]] indicator occurs when the market breaks out and gets us into a position and then reverses and stops us out. We can enter a short position on this type of failed [[Breakout|breakout]] if we are stopped out from a long position and at least four 5-minute bars have passed since we entered the long position and it is before 12:00 noon Central Time. We don’t allow a reversal if the market immediately stops us out; this is usually a sign of a knee-jerk reaction. 
if(Time < 1200 and sellsToday = 0 and 
longLiqPoint <> EntryPrice and BarsSinceEntry >= 4) then 
SellShort(‘‘LongLiqRev’’) next bar at longLiqPoint stop; 
Ditto for the failed [[Breakout|breakout]] on the short side. 
if(low < shortBreakPoint and Time < 1430) then 
if(buysToday=0) then Buy(‘‘BfailedBO’’) next bar at longFBOPoint stop 
if(Time < 1200 and buysToday = 0 and 
shortLiqPoint <> EntryPrice and BarsSinceEntry >= 4) then 
Buy(‘‘ShortLiqRev’’) next bar at shortLiqPoint stop; 
Now, this is where it gets a little complicated with the trade management algorithm. 
if(MarketPosition = 1) then 
Most of the time, our long liquidation point will be the entry price – 25 percent of the average range or three full points, whichever is greater. 
longLiqPoint = MinList(EntryPrice - 25% of averageRange,EntryPrice—3.00 points) 
{normal reversal use 25%} 
However, if we are reversing a short position at a protective stop level, then we must use 15 percent. EasyLanguage doesn’t have a simple way to determine which filter got you into the current trade. We can figure that if the previous position was short and the current position is long and the last bar was the trigger bar and the high of the trigger bar is greater than or equal to our short liquidation point, and our short liquidation point is closer to the market than the short failed [[Breakout|breakout]] point, then we know we were reversed on to long from a short liquidation point. 
if(MarketPosition(1) = -1 and BarsSinceEntry(0) = 1 and 
High[1]>=shortLiqPoint and shortLiqPoint < shortFBOPoint) then 
curTrdType = -2 
if(curTrdType = -2) then 
longLiqPoint = MinList(EntryPrice - 15% of 
averageRange,EntryPrice-3.0 points){long liq reversal use 15%}
Trading Strategies That Work (or the Big Damn Chapter on Trading Strategies) 155 
If we are long and the high of the 5-minute bar has exceeded the entry price plus 50 percent, then we need to move our stop to break-even. 
if(High > EntryPrice + 50% of averageRange) then longLiqPoint = EntryPrice 
If time is greater than 2:30 p.m. CT, then we start trailing our long liquidation point from the lowest low of the past three 5-minute bars. 
if(time >= 1430) then longLiqPoint = 
MaxList(lonqLiqPoint,Lowest(Low,3) 
Order entry module for either liquidating our long position or initiating a short posi-tion at our long liquidation point: 
if(Time < 1200 and sellsToday = 0 and longLiqPoint <> EntryPrice) and 
BarsSinceEntry >= 4) then 
Sell Short (‘‘LongLiqRev’’) next bar at longLiqPoint stop 
else 
Sell (‘‘LongLiq’’) next bar at longLiqPoint stop 
Ditto for the short side. 
If(MarketPosition = -1) then 
shortLiqPoint = MaxList(EntryPrice + 25% of averageRange,EntryPrice + 3.00 
points) {normal reversal use 25%} 
if(MarketPosition(1) = 1 and BarsSinceEntry(0) = 1 and 
(Low[1] <= longLiqPoint and longLiqPoint > longFBOPoint) then 
curTrdType = +2 
if(curTrdType = +2) then 
shortLiqPoint = MinList(EntryPrice - 15% of 
averageRange,EntryPrice—3.00 points) 
{long liq reversal use 15%} 
if(Low <= EntryPrice - 50% of averageRange) shortLiqPoint = EntryPrice 
if(Time < 1200 and buysToday = 0 and shortLiqPoint <> EntryPrice) then 
Buy (‘‘ShortLiqRev’’) next bar at shortLiqPoint stop 
else 
BuyToCover (‘‘ShortLiq’’) next bar at shortLiqPoint stop 
If(time >= 1430) then shortLiqPoint = 
MinList(shortLiqPoint, Highest(High,3)) 
This next function call gets us out of the market at the closing bell. 
SetExitOnClose 
Did you notice how our pseudocode evolved into almost pure EasyLanguage? The more programming that you get under your belt, the less English-like you will be with
156 BUILDING WINNING TRADING SYSTEMS WITH TRADESTATION 
your pseudocode. You may think you can save time by cutting out this middle step, but you can’t. John and I have programmed thousands of systems, and simply outlining the structure and variables ahead of time always saves time in the long run. 
Super Combo Code 
{Super Combo by George Pruitt 
This intraday trading system will illustrate the multiple data handling 
capabilities of TradeStation. All pertinent buy and sell calculations will be 
based on daily bars and actual trades will be executed on 5-min bars. I have 
made most of the parameters input variables.} 
Inputs:waitPeriodMins(30),initTradesEndTime(1430),liqRevEndTime(1200), 
thrustPrcnt1(0.30),thrustPrcnt2(0.60),breakOutPrcnt(0.25), 
failedBreakOutPrcnt(0.25),protStopPrcnt1(0.25),protStopPrcnt2(0.15), 
protStopAmt(3.00),breakEvenPrcnt(0.50),avgRngLength(10),avgOCLength(10); 
Variables:averageRange(0),averageOCRange(0),canTrade(0),buyEasierDay(FALSE), 
sellEasierDay(FALSE),buyBOPoint(0),sellBOPoint(0),longBreakPt(0), 
shortBreakPt(0),longFBOPoint(0),shortFBOPoint(0),barCount(0), 
intraHigh(0),intraLow(999999),buysToday(0),sellsToday(0), 
currTrdType(0),longLiqPoint(0),shortLiqPoint(0),yesterdayOCRRange(0), 
intraTradeHigh(0),intraTradeLow(999999); 
{Just like we did in the pseudocode—let’s start out with the daily bar 
calculations. If Date <> Date[1]—first bar of day} 
if(Date <> Date[1]) then {save by doing these calculations once per day} 
begin 
averageRange = Average(Range,10) of Data2; {Data 2 points to daily bars} 
yesterdayOCRRange = AbsValue(Open of Data2-Close of Data2); 
averageOCRange = Average(AbsValue(Open of Data2-Close of Data2),10); 
canTrade = 0; 
if(yesterdayOCRRange< 0.85*averageOCRange) then canTrade = 1; 
buyEasierDay = FALSE; 
sellEasierDay = FALSE; 
{See how we refer to Data2—the daily data} 
if(Close of Data2 <= Close[1] of Data2) then buyEasierDay = TRUE; 
if(Close of Data2 > Close[1] of Data2) then sellEasierDay = TRUE; 
if(buyEasierDay) then 
begin 
buyBOPoint = Open of data1 + thrustPrcnt1*averageRange; 
sellBOPoint = Open of data1—thrustPrcnt2*averageRange; end; 
if(sellEasierDay) then 
begin 
sellBOPoint = Open of data1—thrustPrcnt1*averageRange; buyBOPoint = Open of data1 + thrustPrcnt2*averageRange; 
end; 
longBreakPt = High of Data2 + breakOutPrcnt*averageRange; 
shortBreakPt = Low of Data2—breakOutPrcnt*averageRange; shortFBOPoint = High of Data2—failedBreakOutPrcnt*averageRange; longFBOPoint = Low of Data2 + failedBreakOutPrcnt*averageRange;
Trading Strategies That Work (or the Big Damn Chapter on Trading Strategies) 157 
{Go ahead and initialize any variables that we may need later on in 
the day} 
barCount = 0; 
intraHigh = 0;intraLow = 999999; {Didn’t know you could do this} 
buysToday = 0;sellsToday = 0;{You can put multiple statements on one 
line} 
currTrdType = 0; 
end; {End of the first bar of data} 
{Now let’s trade and manage on 5-min bars} 
if(High > intraHigh) then intraHigh = High; 
if(Low < intraLow ) then intraLow = Low; 
barCount = barCount + 1; {count the number of bars of intraday data} 
if(barCount > waitPeriodMins/BarInterval and canTrade = 1) then 
{have we waited long enough—wait PeriodMin is an input variable and 
BarInterval is set by TradeStation. Wait PeriodMins = 30 and BarInterval = 5, 
so 30/5 = 6} 
begin if(MarketPosition = 0) then 
begin 
intraTradeHigh = 0; 
intraTradeLow = 999999; 
end; 
if(MarketPosition = 1) then 
begin 
intraTradeHigh = MaxList(intraTradeHigh,High); 
buysToday = 1; 
end; 
if(MarketPosition =-1) then 
begin 
intraTradeLow = MinList(intraTradeLow,Low); 
sellsToday = 1; 
end; 
if(buysToday = 0 and Time < initTradesEndTime) then 
Buy(‘‘LBreakOut’’) next bar at buyBOPoint stop; 
if(sellsToday = 0 and Time < initTradesEndTime) then 
SellShort(‘‘SBreakout’’) next bar at sellBOPoint stop; 
if(intraHigh > longBreakPt and sellsToday = 0 and Time < initTradesEndTime) 
then 
SellShort(‘‘SfailedBO’’) next bar at shortFBOPoint stop; 
if(intraLow < shortBreakPt and buysToday = 0 and Time < initTradesEndTime) then 
Buy(‘‘BfailedBO’’) next bar at longFBOPoint stop; 
{The next module keeps track of positions and places protective 
stops} 
if(MarketPosition = 1) then 
begin 
longLiqPoint = EntryPrice—protStopPrcnt1*averageRange; longLiqPoint = MinList(longLiqPoint,EntryPrice—protStopAmt); if(MarketPosition(1) = -1 and BarsSinceEntry = 1 and 
High[1] >= shortLiqPoint and shortLiqPoint < shortFBOPoint)then 
currTrdType = -2; {we just got long from a short liq reversal}
158 BUILDING WINNING TRADING SYSTEMS WITH TRADESTATION 
if(currTrdType = -2) then 
begin 
longLiqPoint = EntryPrice—protStopPrcnt2*averageRange; longLiqPoint = MinList(longLiqPoint,EntryPrice -protStopAmt); 
end; 
if(intraTradeHigh >= EntryPrice + breakEvenPrcnt*averageRange) then 
longLiqPoint = EntryPrice; {BreakEven trade} 
if(Time >= initTradesEndTime) then 
longLiqPoint = MaxList(longLiqPoint,Lowest(Low,3)); 
{TrailingStop} 
if(Time < liqRevEndTime and sellsToday = 0 and 
longLiqPoint <> EntryPrice and BarsSinceEntry ≥ 4) then 
begin 
SellShort(‘‘LongLiqRev’’) next bar at longLiqPoint stop; 
end 
else begin 
Sell(‘‘LongLiq’’) next bar at longLiqPoint stop; 
end; 
end; 
if(MarketPosition =-1) then 
begin 
shortLiqPoint = EntryPrice+protStopPrcnt1*averageRange; 
shortLiqPoint = MaxList(shortLiqPoint,EntryPrice + protStopAmt); 
if(MarketPosition(1) = 1 and BarsSinceEntry(0) = 1 and 
Low [1] <= longLiqPoint and longLiqPoint > longFBOPoint) then 
currTrdType = +2; {we just got long from a short liq reversal} 
if(currTrdType = +2) then 
begin 
shortLiqPoint = EntryPrice + protStopPrcnt2*averageRange; 
shortLiqPoint = MaxList(shortLiqPoint,EntryPrice+protStopAmt); 
end; 
if(intraTradeLow<= EntryPrice—breakEvenPrcnt*averageRange) then 
shortLiqPoint = EntryPrice; {BreakEven trade} 
if(Time >= initTradesEndTime) then 
shortLiqPoint = MinList(shortLiqPoint,Highest(High,3)); 
{Trailing stop} 
if(Time < liqRevEndTime and buysToday = 0 and 
shortLiqPoint <> EntryPrice and BarsSinceEntry ≥ 4) then 
begin 
Buy(‘‘ShortLiqRev’’) next bar at shortLiqPoint stop; 
end 
else begin 
BuyToCover(‘‘ShortLiq’’) next bar at shortLiqPoint stop; 
end; 
end; 
end; 
SetExitOnClose;
Trading Strategies That Work (or the Big Damn Chapter on Trading Strategies) 159 
The Super Combo program demonstrates how to: 
 Use the keyword “date” to determine the first intraday bar of the day.  Create and program a complete trade management scheme.  Use the keyword “time” to determine optimum trading periods.  Use and manage multiple data input.  Exit all positions at the close of the day. 
Super Combo trading performance is summarized in Table 6.6. A visual example of how this system enters and exits trades is shown in Figure 6.5. 
TABLE 6.6 Super Combo Performance 
All Trades Long Trades Short Trades 
Total Net Profit $148,137.50 $76,800.00 $71,337.50 Gross Profit $1,426,200.00 $689,250.00 $736,950.00 Gross Loss ($1,278,062.50) ($612,450.00) ($665,612.50) Profit Factor 1.12 1.13 1.11 
Total Number of Trades 2517 1228 1289 Percent Profitable 36.35% 38.60% 34.21% Winning Trades 915 474 441 Losing Trades 1602 754 848 Even Trades 0 0 0 
Avg. Trade Net Profit $58.85 $62.54 $55.34 Avg. Winning Trade $1,558.69 $1,454.11 $1,671.09 Avg. Losing Trade ($797.79) ($812.27) ($784.92) Ratio Avg. Win:Avg. Loss 1.95 1.79 2.13 Largest Winning Trade $13,400.00 $13,400.00 $10,600.00 Largest Losing Trade ($5,125.00) ($5,125.00) ($4,600.00) Largest Winner as % of Gross Profit 0.94% 1.94% 1.44% Largest Loser as % of Gross Loss 0.40% 0.84% 0.69% 
Max. Consecutive Winning Trades 7 6 5 Max. Consecutive Losing Trades 24 13 18 
Return on Initial Capital 148.14% Annual Rate of Return 4.54% Buy and Hold Return 49.32% Return on Account 304.03% Avg. Monthly Return $749.58 Std. Deviation of Monthly Return $5,245.32 
Max. Draw Down (Trade Close to Trade Close) Value ($48,725.00) ($39,125.00) ($39,187.50) Date 7/18/2007 11:50 Max. Trade Draw Down ($5,025.00) ($5,025.00) ($4,500.00)
160 BUILDING WINNING TRADING SYSTEMS WITH TRADESTATION 
FIGURE 6.5 Super Combo Trades 
Super Combo Summary 
Wow, this strategy was complicated to program. It wouldn’t have been if EasyLanguage had provided a little bit more information on which filter initiated the current trade. The complicated part of the program revolves around determining if we were reversed on a liquidation point and which protective stop to use. We used one liquidation variable for all of our trade management stops; the value of the liquidation variable changed depen-dent on trade type, time, and open trade profit. If you have simpler exit schemes, you can use the built-in EasyLanguage functions for protective stops and profit objectives. Analyzing different time frames with multiple data streams is much easier than doing the same with only one data stream. You could have done the same thing with a single 5-minute bar chart, but the programming would be considerably more difficult. The next statement was written in the first edition of this book, and even though the EasyLan-guage engineers have created the OpenD, HighD, LowD, and CloseD functions, it still holds true to a certain degree. You could build daily bars from the intraday bars and 
keep track of all the daily statistics. This could be accomplished by creating array 
variables and keeping track of when the day begins and ends and the highest and low-
est point achieved on an intraday basis. Like we said previously, most traders don’t 
use arrays in their programming, but they are handy when you start doing advanced 
analysis. Prior to the creation of the OpenD, HighD, LowD, and CloseD functions you always had to use a secondary daily data stream if you wanted to refer to the current
Trading Strategies That Work (or the Big Damn Chapter on Trading Strategies) 161 
day’s or prior days’ daily values and were testing on intraday data. With the use of these functions and intraday data, it is very simple to refer back to yesterday’s high, low, open, or close price. All that needs to be done is to invoke the function call with an offset as the function parameter. Let’s say you are testing on 5-minute bars and you want to buy yesterday’s high on a stop. The following snippet of code would take care of this: 
Buy next bar at HighD(1) stop; 
Compare this with the code incorporating a data2 stream. 
Buy next bar at High of Data2 stop; 
Other prior days’ values are just as easy to access: 
OpenD(2)—open price two days ago 
HighD(3)—high price three days ago 
HighD(0)—today’s current price updated on the close of the last intraday bar 
OpenD(1)—open price of yesterday 
You may be thinking that we can do away with the second data stream in the Su-per Combo program since we now have access to these neat functions. When we first learned of these functions, we thought the same thing; and you can, but it requires quite a bit more grunt programming. If we didn’t incorporate a daily 10-day average range cal-culation, then the second data stream could be eliminated with no problems. Why all this talk about eliminating the second data stream, you may be asking. Having just one data stream on a chart simply helps eliminate chart clutter and makes setup a little easier. 
The reason you can’t remove data2 from your chart and programming in Super Combo is that you cannot (as of now) call these functions from within a for-next loop. 
You would think you would be able to replace 
averageRange = Average(Range,10) of Data2; 
with 
averageRange = Average(RangeD(1),10); 
but there is no such thing as a RangeD function. No big deal; now that we know a little bit of programming, we can simply set up a for-next loop, right? 
For cnt = 1 to 10 
Begin 
value2 = value2 + (HighD(cnt)—LowD(cnt)); End; 
averageRange = value2/10;
162 BUILDING WINNING TRADING SYSTEMS WITH TRADESTATION 
It is logical to think this, but this code may not verify/compile based on what version of TradeStation you are currently using. The latest version as of this writing will compile. It still, however, warns that a series function should not be called more than once. Even if you don’t use these function calls inside a for loop, they can help us eliminate some coding in the Super Combo. 
if(High > intraHigh) then intraHigh = High; 
if(Low < intraLow) then intraLow = Low; 
Since HighD(0) and LowD(0) keep track of the current high/low price for the day, we don’t need to do this extra work. 
if(intraHigh > longBreakPt and sellsToday = 0 and Time < initTradesEndTime) 
then SellShort(‘‘SfailedBO’’) next bar at shortFBOPoint stop; 
if(intraLow < shortBreakPt and buysToday = 0 and Time < initTradesEndTime) then 
Buy(‘‘BfailedBO’’) next bar at longFBOPoint stop; 
now becomes: 
if(HighD(0) > longBreakPt and sellsToday = 0 and Time < initTradesEndTime) then 
SellShort(‘‘SfailedBO’’) next bar at shortFBOPoint stop; 
if(LowD(0) < shortBreakPt and buysToday = 0 and Time < initTradesEndTime) then 
Buy(‘‘BfailedBO’’) next bar at longFBOPoint stop; 
Now, if you heed the warning message concerning indexing the HighD(), LowD(), CloseD(0), and OpenD() and really want to eliminate the need for the data2, you could do some grunt programming and create the following code to calculate the 10-day average range. 
Value1 = HighD(10)—LowD(10); Value1 = Value1 + (HighD(9)—LowD(9); Value1 = Value1 + (HighD(8)—LowD(8); Value1 = Value1 + (HighD(7)—LowD(7); Value1 = Value1 + (HighD(6)—LowD(6); Value1 = Value1 + (HighD(5)—LowD(5); Value1 = Value1 + (HighD(4)—LowD(4); Value1 = Value1 + (HighD(3)—LowD(3); Value1 = Value1 + (HighD(2)—LowD(2); Value1 = Value1 + (HighD(1)—LowD(1); averageRange = Value1/10; 
The use of a data2 or more data streams in some cases is unavoidable. If you are using it only to access a few days of prior data, then use the functions. If not, and it would require crazy programming as a workaround, then by all means use data2.
Trading Strategies That Work (or the Big Damn Chapter on Trading Strategies) 163 
Super Combo did relatively well six years prior to its initial release date in 2002 and it performed quite well three years afterward. It did run into a roadblock and suffered its worst-case draw down in the summer of 2007. However, it did recover a year later and has since made new equity highs. During 2008, George was approached and asked by some readers if anything could be incorporated into the system to improve performance. After a strenuous optimization that did not yield much, he came to the conclusion that the parameters chosen in 2002 were probably the best. However, the concept of trading after a narrow open-to-close range was expanded to require only trading after a narrow range (high to low), and the concept of the buy day/sell day was reversed. These two changes made a tremendous impact on performance, which you can see for yourself in Table 6.7. 
TABLE 6.7 Improved Super Combo Performance 
All Trades Long Trades Short Trades 
Total Net Profit $336,350.00 $194,562.50 $141,787.50 Gross Profit $1,768,725.00 $925,675.00 $843,050.00 Gross Loss ($1,432,375.00) ($731,112.50) ($701,262.50) Profit Factor 1.23 1.27 1.2 
Total Number of Trades 2843 1477 1366 Percent Profitable 40.59% 42.18% 38.87% Winning Trades 1154 623 531 Losing Trades 1689 854 835 Even Trades 0 0 0 
Avg. Trade Net Profit $118.31 $131.73 $103.80 Avg. Winning Trade $1,532.69 $1,485.83 $1,587.66 Avg. Losing Trade ($848.06) ($856.10) ($839.84) Ratio Avg. Win:Avg. Loss 1.81 1.74 1.89 Largest Winning Trade $18,275.00 $18,275.00 $11,900.00 Largest Losing Trade ($4,900.00) ($4,200.00) ($4,900.00) Largest Winner as % of Gross Profit 1.03% 1.97% 1.41% Largest Loser as % of Gross Loss 0.34% 0.57% 0.70% 
Max. Consecutive Winning Trades 8 7 6 Max. Consecutive Losing Trades 15 11 14 
Return on Initial Capital 336.35% Annual Rate of Return 7.37% Buy and Hold Return 48.45% Return on Account 921.51% Avg. Monthly Return $1,203.54 Std. Deviation of Monthly Return $5,328.56 
Max. Draw Down (Trade Close to Trade Close) Value ($36,500.00) ($24,100.00) ($30,762.50) Date 10/28/1996 12:20 Max. Trade Draw Down ($4,800.00) ($4,350.00) ($4,800.00)
164 BUILDING WINNING TRADING SYSTEMS WITH TRADESTATION 
Below are the three lines of code that were changed to create the SuperComboBest version. 
if range of data2 < averageRange then canTrade = 1; 
if(Close of Data2 >= Close[1] of Data2) then buyEasierDay = TRUE; 
if(Close of Data2 < Close[1] of Data2) then sellEasierDay =TRUE; 
Check out the results of the system on the mini Russell 2000 contract in Table 6.8. Performing well in this market as well as the S&P 500 does demonstrate a certain 
level of robustness. Now the question that begs to be asked is, “Does this form of system modification fall into the category of overly curve-fitting?” Unfortunately there is not a 
TABLE 6.8 Improved Super Combo Mini Russell Performance 
All Trades Long Trades Short Trades 
Total Net Profit $42,620.00 $24,560.00 $18,060.00 Gross Profit $277,420.00 $137,030.00 $140,390.00 Gross Loss ($234,800.00) ($112,470.00) ($122,330.00) Profit Factor 1.18 1.22 1.15 
Total Number of Trades 1442 748 694 Percent Profitable 42.30% 44.65% 39.77% Winning Trades 610 334 276 Losing Trades 832 414 418 Even Trades 0 0 0 
Avg. Trade Net Profit $29.56 $32.83 $26.02 Avg. Winning Trade $454.79 $410.27 $508.66 Avg. Losing Trade ($282.21) ($271.67) ($292.66) Ratio Avg. Win:Avg. Loss 1.61 1.51 1.74 Largest Winning Trade $2,685.00 $2,205.00 $2,685.00 Largest Losing Trade ($755.00) ($725.00) ($755.00) Largest Winner as % of Gross Profit 0.97% 1.61% 1.91% Largest Loser as % of Gross Loss 0.32% 0.64% 0.62% 
Max. Consecutive Winning Trades 7 7 6 Max. Consecutive Losing Trades 11 7 9 
Return on Initial Capital 42.62% Annual Rate of Return 3.51% Buy and Hold Return 42.21% Return on Account 403.60% Avg. Monthly Return $359.56 Std. Deviation of Monthly Return $1,507.07 
Max. Draw Down (Intraday Peak to Valley) Value ($11,585.00) ($7,380.00) ($10,085.00) Date 4/8/2010 10:40 Max. Draw Down (Trade Close to Trade Close)
Trading Strategies That Work (or the Big Damn Chapter on Trading Strategies) 165 
black-and-white answer to this question. Did the change bring about better performance? Yes, but we had the benefit of hindsight. Was the increase in performance a direct result of many, many computer simulations? No, we simply changed two existing trade filters. Did the changes nullify the initial hypothesis? No, the system is still a [[Breakout|breakout]] approach with a majority of the initial parameters staying exactly the same. So did we curve fit? The answer would have to be yes, but in our opinion we did not overly curve-fit and that’s the best you can expect. The framework of Super Combo is the same framework of many systems that sell for thousands of dollars, so it is up to you to transform this system into your own and make it 10 times better. The complete logic of the SuperComboBest is located on the Website. 
THE GHOST TRADER TRADING STRATEGY 
The code for the Ghost Trader is designed more as a template than as a complete trading strategy. Some trading strategies incorporate the success of the last trade signal in the calculation/determination of the next trade signal. We have tested several methodologies that initiate new positions only after a losing trade. Some traders feel that there exists a high probability of failure on the next trade signal if the last trade was closed out with a profit. This approach is much easier to trade than to historically back-test. It’s easy to keep track of your trades and then skip the hypothetical trades that don’t meet your criteria. In our example of waiting for a losing trade before initiating a new trade, you would simply stop trading your account after a winning trade and start paper trading and wait until you have a loser on paper. Once a paper loser occurs, the next trade would be initiated in the real world. The code for Ghost Trader demonstrates how to keep track of simulated trades and only issue the trades that meet a certain criteria. The core trading strategy of the Ghost Trader is based off of an exponential [[Moving Average|moving average]] and an [[RSI]] indicator. 
if(marketPosition = 0 and myProfit < 0 and Xaverage(Close,9) > 
Xaverage(High,19) and [[RSI]](Close,9) crosses below 70) then 
begin 
buy next bar at High stop; 
end; 
if(marketPosition = 0 and myProfit < 0 and Xaverage(Close,9) < 
Xaverage(Low,19) and [[RSI]](Close,9) crosses above 30) then 
begin 
sellShort next bar at Low stop; 
end; 
Long positions are initiated on the next day at today’s high on a stop order. This order is issued only if the 9-day exponential [[Moving Average|moving average]] of closes is greater than the 19-day exponential [[Moving Average|moving average]] of high prices, and the 9-day [[RSI]] of closing prices is crossing from above to below the 70 reading. Short positions are initiated in just the opposite
166 BUILDING WINNING TRADING SYSTEMS WITH TRADESTATION 
fashion. Long positions are liquidated if today’s market action penetrates the lowest low of the past 20 days and short positions are liquidated if today’s market action penetrates the highest high of the past 20 days. These entry/exit techniques are interesting but are not the main focus of the Ghost Trader. The main focus of the Ghost Trader is to keep track of a trading system and issue only the trade signals that meet certain criteria. In our case, actual trade signals should be issued only after a real or simulated losing trade. The following code keeps track of all trades—real and simulated. 
Ghost System Code 
{Ghost system} 
{Look to see if a trade would have been executed today and keep track 
of our position and our entry price. Test today’s high/low price 
against the trade signal that was generated by offsetting our calculations 
by one day.} 
if(myPosition = 0 and Xaverage(Close[1],9) > Xaverage(High[1],19) and 
[[RSI]](Close[1],9) crosses below 70 and High >= High[1]) then 
begin 
myEntryPrice = MaxList(Open,High[1]); {Check for a [[Gap|gap]] open} 
myPosition = 1; 
end; 
if(myPosition = 1 and Low < Lowest(Low[1],20))then 
begin 
value1 = MinList((Lowest(low[1],20)),Open); {Check for a [[Gap|gap]] open} 
myProfit = value1—myEntryPrice {Calculate our trade 
profit/loss} 
myPosition = 0; 
end; 
if(myPosition = 0 and Xaverage(Close[1],9) < Xaverage(Low[1],19) and 
[[RSI]](Close[1],9) crosses above 30 and Low <= Low[1]) then 
begin 
myEntryPrice = MinList(Open,Low[1]); 
myPosition =-1; 
end; 
if(myPosition =-1 and High > Highest(High[1],20)) then 
begin 
value1 = MaxList((Highest(High[1],20)),Open);{Check again for 
a [[Gap|gap]] open} 
myProfit = myEntryPrice—value1; {Calculate our trade profit/loss} 
myPosition = 0; 
end; 
See how we compare today’s market action against the signal that was potentially generated on yesterday’s bar: 
if(myPosition = 0 and Xaverage(Close[1],9) > Xaverage(High[1],19) and 
[[RSI]](Close[1],9) crosses below 70 and High >= High[1]) then 
We are checking to see if yesterday’s 9-day exponential [[Moving Average|moving average]] of closes crossed above yesterday’s 19-day exponential [[Moving Average|moving average]] of highs and yesterday’s
Trading Strategies That Work (or the Big Damn Chapter on Trading Strategies) 167 
9-day [[RSI]] of closes crossed down below 70 and today’s high price penetrated yester-day’s high price. If all of these criteria were met yesterday and today, then we know we should be in a long position (real or simulated) and the following block of code is executed: 
begin 
myEntryPrice = MaxList(Open,High[1]); {Check for a [[Gap|gap]] open} 
myPosition = 1; 
end; 
Notice that we did not instruct TradeStation to issue an order. We are just trying to keep track of all trades and we do so by setting our own variables, myEntryPrice and myPosition, accordingly. Remember that we are placing stop orders for the next day at the price of today’s high, and since we are keeping track of myEntryPrice, we need to check and see if the open price of today gapped above our stop price. If the open did [[Gap|gap]] above our stop, then we need to manually set myEntryPrice equal to the open. We also keep track of 
liquidated trades: 
if(myPosition = 1 and Low < Lowest(Low[1],20))then 
begin 
value1 = MinList((Lowest(low[1],20)),Open);{Check a [[Gap|gap]] open} 
myProfit = value1—myEntryPrice; {Calculate our trade 
profit/loss} 
myPosition = 0; 
end; 
Since TradeStation is not keeping track of all our trades, in addition to myPosition 
and myEntryPrice, we must keep track of the profit/loss from the last trade by storing the information in myProfit. Once myProfit is negative (a loss occurred) we can start issuing real trade orders. The following code issues the real signals based on the entry technique and the value of myProfit. 
Real System Code 
{Real System} 
{Only enter a new position if the last simulated or real trade was a loser. 
If last trade was a loser, myProfit will be less than zero.} 
if(marketPosition = 0 and myProfit < 0 and Xaverage(Close,9) > 
Xaverage(High,19) and [[RSI]](Close,9) crosses below 70) then 
begin 
buy next bar at High stop; 
end; 
if(marketPosition = 0 and myProfit < 0 and Xaverage(Close,9) < 
Xaverage(Low,19) and [[RSI]](Close,9) crosses above 30) then 
begin 
sellShort next bar at Low stop; 
end;
168 BUILDING WINNING TRADING SYSTEMS WITH TRADESTATION 
if(marketPosition = 1) then sell next bar at Lowest(Low,20) stop; 
if(marketPosition =-1) then buytocover next bar at Highest(High,20) stop; 
The core entry/exit strategy issued the following signals: 
Date Trade # Price 
12/01/2000 Sell 1 .9446 Short 
02/05/2001 SExit 1 .9098 Cover 4350.0000 
03/14/2001 Sell 1 .8674 Short 
05/03/2001 SExit 1 .8563 Cover 1387.5000 
07/03/2001 Sell 1 .8272 Short 
07/20/2001 SExit 1 .8342 Cover (875.0000) 
08/13/2001 Buy 1 .8433 Buy 
10/11/2001 LExit 1 .8385 Sell (600.0000) 
10/30/2001 Sell 1 .8323 Short 
11/08/2001 SExit 1 .8443 Cover (1500.0000) 
11/21/2001 Sell 1 .8250 Short 
03/06/2002 SExit 1 .7669 Cover 7262.5000 
03/11/2002 Buy 1 .7903 Buy 
04/01/2002 LExit 1 .7543 Sell (4500.0000) 
05/01/2002 Buy 1 .7861 Buy 
The core entry/exit technique with “the last trade was a loser” criteria issued the following trades: 
Date Trade # Price 
12/01/2000 Sell 1 .9446 Short 
02/05/2001 SExit 1 .9098 Cover 4350.0000 
08/13/2001 Buy 1 .8433 Buy 
10/11/2001 LExit 1 .8385 Sell (600.0000) 
10/30/2001 Sell 1 .8323 Short 
11/08/2001 SExit 1 .8443 Cover (1500.0000) 
11/21/2001 Sell 1 .8250 Short 
03/06/2002 SExit 1 .7669 Cover 7262.5000 
05/10/2002 Buy 1 .7861 Buy 
Over this time period, waiting for a losing trade proved to be much more successful. The Ghost Trader was designed as a template to help in the programming of trading strategies that base the next trade signal off of the results of the prior signal. You could easily modify the code and only issue real trade signals after two consecutive losers. 
THE MONEY MANAGER TRADING STRATEGY 
An effective trading strategy is only part of a successful trading plan. If you want your trading to perpetuate, you better have some form of money management built into your
Trading Strategies That Work (or the Big Damn Chapter on Trading Strategies) 169 
overall trading approach. Money management involves examining the concepts of risk and return in reference to investor preference. The objective is to choose a desired rate of return and then minimize the risk associated with that rate of return. Money manage-ment concepts should be used to make the most efficient use of trading capital. We can’t emphasize enough the importance of using money management in a trading plan. The Money Manager strategy is a simple system that incorporates and demonstrates some simple money management concepts. The concepts we are presenting go beyond simple profit objectives or protective stops. These ideas fall within the realm of the underly-ing trading strategy. We go beyond this and move into the areas of capital allocation. The concepts that are presented in this strategy are based on capital preservation and market normalization. We all know what capital preservation is, but some may not un-derstand the concept of market normalization. The ability to diversify equal amounts of capital across a portfolio of different markets is the backbone of any money management scheme. If we want to risk 5 percent of our equity on soybeans and 5 percent on Trea-sury bonds, we need the ability to treat the two markets on an apples-to-apples basis. Most of the time one contract of Treasury bonds involves more risk than one contract of soybeans. Since we want to maintain a constant amount of capital to risk on the two mar-kets, we will need to trade less Treasury bonds and more soybeans. Let’s say the implied market risk for Treasury bonds is $1,000, and is $500 for soybeans. If we were risking $2,000 on each market, we would then trade two contracts of bonds and four contracts of soybeans. We would be maintaining the same amount of risk by varying the number of contracts for the two markets. Measuring market risk is the first step in the market normalization process. Money managers use several different measures to monitor mar-ket risk: average true range, mean change in closing prices, standard deviation in closing prices, and numerous others. The Money Manager strategy uses the 
standard deviation in closing prices to calculate market risk. 
Inputs: initCapital(100000),rskAmount(.02); 
Vars: marketRisk(0),numContracts(0); 
marketRisk = StdDev(Close,30) * BigPointValue; 
The StdDev function returns the standard deviation in terms of points, so we mul-tiply by BigPointValue (dollar value of a big point move) to get market risk in terms of dollars. Once we know the market risk, we then can calculate the number of contracts. 
numContracts = initCapital * rskAmount / marketRisk; 
For demonstration purposes, let’s assume we are trading the Japanese Yen and the market risk is equal to $750. The number of contracts would be calculated by using the formula from above: 
numContracts = 100000 * .02 /750 numContracts = 2000/750 numContracts = 2.66667
170 BUILDING WINNING TRADING SYSTEMS WITH TRADESTATION 
Since we can trade only with whole contracts, we round down to the nearest whole number. Since market risk is the denominator in our formula, whenever market risk increases the number of contracts decreases, hence the risk aversion component of our money management scheme. In similar fashion to the Ghost Trader, the Money Manager was designed as more of a template than an actual trading strategy. We wanted to provide the tools necessary to build a money management platform. The source code for Money Manager follows. 
The Money Manager Code 
{The Money Manager} 
{Demonstrates the programming and use of a money management scheme.} 
{The user inputs initial capital and the amount he wants to risk on each 
trade.} 
Inputs: initCapital(100000),rskAmt(.02); 
Vars: marketRisk(0),numContracts(0); 
marketRisk = StdDev(Close,30) * BigPointValue; 
numContracts = (initialCapital * rskAmt) / marketRisk; 
value1 = Round(numContracts,0); 
if(value1 > numContracts) then 
numContracts = value1—1 else 
numContracts = value1; 
numContracts = MaxList(numContracts,1); {make sure at least 1 
contract is traded} 
Buy(‘‘MMBuy’’) numContracts shares tomorrow at Highest(High,40) stop; 
SellShort(‘‘MMSell’’) numContracts shares tomorrow at Lowest(Low,40) stop; 
if(MarketPosition = 1) then 
Sell(‘‘LongLiq’’) next bar at Lowest(Low,20)stop; 
if(MarketPosition =-1) then 
BuyToCover(‘‘ShortLiq’’) next bar at Highest(High,20) stop; 
Overall the logic should be easy to follow. However, there is some code that may not be totally intuitive. The formula that we used to determine the number of contracts doesn’t always produce a whole number. Since we are trading stocks or futures, we can’t have a fractional number of contracts (shares). The Round function was used to elim-inate the fractional part. The Round function requires two parameters: the value to be rounded and the level of precision. The level-of-precision parameter relates to how many decimal places are to be rounded to. If we had used one instead of zero, then the number of contracts would have been rounded to the nearest tenth place. We used zero to round to the nearest whole number. If we had passed two as the parameter, then the function would round to the nearest hundredth place. Since we developed a risk-averse money management model, the number of contracts should never be rounded up (risk exposure is directly proportional to the number of contracts that we are trading). EasyLanguage does not provide a truncation function (a function that eliminates the fractional part of a number), so we used the following code to always round down: 
value1 = Round(numContracts,0); 
if(value1 > numContracts) then
Trading Strategies That Work (or the Big Damn Chapter on Trading Strategies) 171 
numContracts = value1—1 else 
numContracts = value1; 
Value1 is assigned numContracts rounded to the nearest integer. If the Round 
function rounds up, then value1 will be greater than the numContracts variable. If value1 is greater than numContracts, we simply subtract one from value1 and reassign the difference to numContracts. If value1 is not greater than numContracts, then the Round function rounded down and we can simply reassign numContracts this value. We introduced the keyword “shares” in the order placement logic. 
Buy(‘‘MMBuy’’) numContracts shares tomorrow at Highest(High,40) stop; 
SellShort(‘‘MMSell’’) numContracts shares tomorrow at Lowest(Low,40) 
stop; 
The keyword “shares” must be used when trading a variable number of contracts or shares. The number of shares (in the form of a variable name or a literal) must follow the “Buy/SellShort” keyword and precede the keyword “shares.” 
Buy(‘‘myBuy’’) 50 shares tomorrow at Open; 
or 
Buy(‘‘myBuy’’) myNumShares shares tomorrow at Open; 
You can use Money Manager as a platform to further research into other money management schemes. You can get some great money management ideas out of Nauzer J. Balsara’s Money Management Strategies for Futures Traders. 
BONUS TRADING STRATEGIES 
George developed this strategy in 2009, and it can be applied to the mini Russell or emini S&P. This strategy (let’s call it the GeoRussell) illustrates how to put on two contracts initially and then pull one off at a profit and establish a break-even trade for the second contract. This system works well as is but can be, and should be, used as a template for further research. When you compile this code, you might be given a warning concerning calling a series function more than once, but just ignore it. As long as it compiles, you should be good to go. The strategy’s weakness is that it gets stopped right off the bat with the two initial contracts. The following code is set up for trading the mini Russell. A 10-year test period shows profits around $92,000 with a maximum draw down of $22,000. 
{GeoRussel - put two contracts on and hope the first one is taken off at a 
profit so that the second contract can become a free trade}
172 BUILDING WINNING TRADING SYSTEMS WITH TRADESTATION 
inputs: 
atrLen(10),stopAmtPoints(10.00),offSetAmt(.2),profitObj1(5), 
endTradeTime(1530); 
vars: 
atrAmt(0),smallRange(false),canBuy(true),canSell(true),stb(0),sts(0), 
tkpS(0),tkpL(0),yesTrueRange(0); 
vars: buysToday(0),sellsToday(0),j(0),longLossPt(0),shortLossPt(0); 
{Plot on 5 minute day session - programmed by George Pruitt } 
{I used the OpenD(),HighD(),LowD(),CloseD() functions to get 
the prior day’s highs and lows and closes } 
if(date<>date[1]) then // first bar of the day 
begin 
canBuy = false; 
canSell = false; 
buysToday = 0; 
sellsToday = 0; 
value1 = 0; 
for j = 1 to atrLen 
begin 
value1 = value1 + 
maxList(closeD(j+1),highD(j))minList(closeD(j+1),lowD(j)); 
end; 
atrAmt = value1/atrLen; 
yesTrueRange = maxList(closeD(2),highD(1)) - minList(closeD(2),lowD(1)); 
smallRange = yesTrueRange < atrAmt; 
end; 
if marketPosition = 1 then buysToday = 1; // if we already bot then no more buys 
if marketPosition =-1 then sellsToday = 1; 
stb = openD(0) + offSetAmt * atrAmt; 
sts = openD(0) - offSetAmt * atrAmt; 
if(closeD(1)>=closeD(2) and smallRange) then canBuy = true; 
if(closeD(1)<closeD(2) and smallRange) then canSell = true; 
if(canBuy and buysToday = 0 and time < endTradeTime ) then 
buy(‘‘GeoRusBuy’’) 2 contracts next bar stb stop; 
if(canSell and sellsToday = 0 and time < endTradeTime) then 
sellShort(‘‘GeoRusSell’’) 2 contracts next bar sts stop; 
if currentContracts=2 and marketPosition=1 and highD(0) > entryPrice + profi-
tObj1 then 
sell(‘‘LongProf1’’) 1 contract next bar at highD(0) - 5 stop;
Trading Strategies That Work (or the Big Damn Chapter on Trading Strategies) 173 
if currentContracts=2 and marketPosition=-1 and lowD(0) < entryPrice - profi-
tObj1 then 
buyToCover(‘‘ShrtProf1’’) 1 contract next bar at lowD(0) + 5 stop; 
if currentContracts = 1 then 
sell(‘‘L-BreakEven’’) next bar at entryPrice stop; 
if currentContracts = 1 then 
buyToCover(‘‘S-BreakEven’’) next bar at entryPrice stop; 
if marketPosition=1 then sell(‘‘MM-L-Out’’) next bar at entryPrice - stopAmt-
Points stop; 
if marketPosition=-1 then 
buyToCover(‘‘MM-S-Out’’) next bar at entryPrice + stopAmtPoints stop; 
setExitOnClose; 
This strategy tries to take advantage of [[Gap|gap]] openings in the mini Russell. Many traders think you can fade the [[Gap|gap]] and be successful. Fading, in other words, is tak-ing the opposite trade direction; if the market gaps down from the prior day’s close, then you buy, and the opposite holds true if the market gaps up. The GapBackFiller strategy looks for [[Gap|gap]] openings and then buys/sells once the [[Gap|gap]] is back filled a certain amount. If the market gaps down 1 percent and then retraces back toward the prior day’s close 1/2 percent, then the system could buy at this level. The amount of [[Gap|gap]] and retracement are inputs in the strategy. This strategy also illustrates how to capture the open tick of the day and use the case-switch decision construct. 
{[[Gap]] Back Filler by George Pruitt} 
inputs:usePerOfPrice(0.01),firstBarTimeStamp(835),stopLoss$(1000), 
gapFillPerAmt(.005); 
vars: buyStopPrice(0),sellStopPrice(0),tradeSwitch(0); 
If time of next bar = firstBarTimeStamp then 
Begin 
tradeSwitch = 0; 
buyStopPrice = 0; 
sellStopPrice = 0; 
If usePerOfPrice > 0 then 
Begin 
If Open of next bar < Close - usePerOfPrice*close then tradeSwitch = 1; 
If Open of next bar > Close + usePerOfPrice*close then tradeSwitch = -1; 
End; 
switch(tradeSwitch) 
Begin 
case Is 1: 
buyStopPrice = open next bar + c*gapFillPerAmt; 
case Is -1:
174 BUILDING WINNING TRADING SYSTEMS WITH TRADESTATION 
sellStopPrice = Open next bar - c*gapFillPerAmt; 
default: sellStopPrice = 0;buyStopPrice =0; 
end; 
end; 
If buyStopPrice <> 0 and entriesToday(date) = 0 
then buy(‘‘BackFillGapB’’) next bar at buyStopPrice stop; 
If sellStopPrice <> 0 and entriesToday(date) = 0 then 
sellShort(‘‘BackFillGapS’’) next bar at sellStopPrice stop; 
SetStopLoss(stopLoss$); 
SetExitOnClose; 
CONCLUSIONS 
Serious programming was introduced as well as some robust trading system principles: [[Bollinger Bands]], Keltner Channels, Donchian Break Outs, Open Range Break Outs, [[Day Trading]], and the usage of multiple time frames, as well as Ghost Trader and Money Manager Trading Strategies. Of course, these aren’t the only trading principles available. There are many other existing principles, and some that have yet to be uncovered. The search for market principles is what keeps a system trader, researcher, and programmer excited about what he or she is doing. Over the next few chapters, we will try to introduce a few more morsels of research. The next chapter will focus on the art of debugging—the ugly side of programming.
C H A P T E R 7 
Debugging and Output 
T hroughout this book, we have compared EasyLanguage to some of today’s pow-
erful programming languages. Prior to version 8.8 the power of the language was somewhat diminished by the integrated development environment (IDE) in which 
it was encapsulated. Today’s contemporary programming environments usually consist of three elements: (1) editor, (2) compiler, and (3) in-line debugger. TradeStation had two out of the three originally. Guess which one was missing. If you guessed debugger, then you are absolutely correct. You have already seen the editor and compiler in ac-tion. If you are coming from a nonprogramming background, this may not seem like a big deal. First, let us explain what a debugger is. A debugger is a program that allows a user to step through each individual line of code and evaluate the program statements as they are executed. “Why on earth would you want to do this?” you may ask. Unfor-tunately, most programs don’t work properly the instant you finish typing them. Even though your program may compile or verify, this doesn’t mean it will work in the way you intended. Usually the most difficult part of the process of programming starts after you have carefully typed your ideas into the EasyLanguage Editor and verified your pro-gram. The Super Combo system that we programmed in the last chapter required about an hour to pseudocode, an hour to type the program in, and a couple of hours to de-bug. Even with careful planning and typing, we didn’t initially get the Super Combo to work in the manner that we intended. The code that you saw in the last chapter was the result of trial and error. The latest incarnation of TradeStation now includes an in-line debugger that can make debugging much easier. The included debugger is good but not great. Therefore two debugging tools (the debugger and printing to the EasyLanguage Print Log) will be included in this chapter. 
This chapter discusses topics associated with the process of fixing your program code to accurately reflect your trading ideas. In addition, we will also discuss the tools that can be used to create customized reports. 
175
176 BUILDING WINNING TRADING SYSTEMS WITH TRADESTATION 
LOGICAL VERSUS SYNTAX ERRORS 
As you verify your analysis technique, TradeStation pauses to look for syntax errors in your code. If there are any syntax errors, TradeStation opens up a dialog box explain-ing the error and places the cursor on the offending piece of code. You can fix the error and then reverify, and then move on to the next error, if one exists. The Output win-dow that is usually docked at the bottom of the EasyLanguage Editor will give further details concerning the type of syntax error and the line number where the error is lo-cated. This window will tell you a description of the error, the analysis technique that caused it, the offending line number, and the type of error. We always verify with this window open. These syntax errors are tedious and time-consuming but are relatively easy to correct. We give a large list of the more common syntax errors on our Website, www.wiley.com/go/tradingsystems. 
There are basically two types of errors in programming: syntax and logical. The log-ical errors are sometimes quite difficult to fix and are usually the ones that instigate the violent action of throwing one’s monitor through the closest open or shut window. A logical error is an imperfection in your translation of your ideas into programming code. This error may simply be a typo, or it may be a complete misunderstanding of a concept. A typo is a simple fix, whereas a flawed conception of an idea may take hours to work through. A debugger is the most common cure for the logical error, and we do have ac-cess to one, but let’s assume we don’t for this exercise. Never fear, because neither did the programming pioneers. We can effectively debug with the use of cleverly placed Print Statements and the Print Log. The Print Log can be accessed by selecting EasyLanguage 
Print Log from under the View menu in TradeStation. 
DEBUGGING WITH THE PRINT STATEMENT AND THE PRINT LOG 
The Print Log and the Print Statement aren’t perfect, but they should be an acceptable substitute for a debugger. The following snippet of code has a logical error; see if you can visually find it. 
{Protective stop logic} 
lonqLiqPoint = EntryPrice + 1.5*Range; 
shortLiqPoint = EntryPrice + 1.5*Range; 
if (MarketPosition = 1) then sell next bar at longLiqPoint stop; 
if (MarketPosition) = -1) then buy to cover next bar at 
shortLiqPoint stop; 
If you found the error, then keep it to yourself for the moment and continue on as if you didn’t. If we had actually typed in this code, it would have verified with no problems. The problems wouldn’t arise until we applied the logic to a chart and started to analyze the trades. After looking at the trades, you will notice that there is something wrong with
Debugging and Output 177 
our long liquidation logic. Let’s push our sleeves up, delve in, and debug it by adding a few lines of code. Remember, TradeStation performs testing by looping through every bar from the first to the last and performing the necessary calculations and keeping track when trades occur. 
Vars: longLiqPoint(0),shortLiqPoint(0); 
{System uses William’s Percent R indicator to determine OB/OS situations} 
if(percentR(14) crosses above 20) then buy next bar at 
Highest(High,3) stop; 
if(percentR(14) crosses below 80) then sellShort next bar at 
Lowest(Low,3) stop; 
longLiqPoint = EntryPrice + 1.5 * Range; 
shortLiqPoint = EntryPrice + 1.5 * Range; 
{Debugging Starts Here!} 
if(MarketPosition = 1) then print(Date,EntryPrice,longLiqPoint); 
{Debugging Ends Here!} 
if(MarketPosition = 1) then sell next bar at longLiqPoint stop; 
if(MarketPosition = -1) then buyToCover next bar at shortLiqPoint 
stop; 
TABLE 7.1 Print Log Output 
1090225 721.40 763.70 1090311 667.90 695.65 1090527 857.00 890.30 1090625 857.70 897.00 1090714 849.40 865.15 1091006 1003.30 1024.30 1100202 1056.80 1082.60 1100526 1052.70 1096.20 1100708 1032.90 1053.60 1100902 1050.50 1066.70 1101119 1172.10 1190.55 1101202 1180.20 1204.65 1110228 1301.90 1316.15 1110318 1268.10 1289.25 1110519 1326.30 1342.35 1110527 1311.60 1321.35 1110621 1267.50 1290.00 1110812 1172.50 1200.25 1110824 1148.70 1183.20 1111129 1190.20 1208.20 1111130 1190.20 1219.45 1111201 1190.20 1207.75 1111202 1190.20 1215.85 1111205 1190.20 1215.70 1111206 1190.20 1210.15 1111207 1190.20 1223.80 1111208 1190.20 1227.55 1111209 1190.20 1221.70
178 BUILDING WINNING TRADING SYSTEMS WITH TRADESTATION 
The Print Statement can print any variable out to the Print Log. Here we are printing the current date, the entry price for our long position, and the liquidation price. Once you verify the program with the new debugging code and apply it to an S&P 500 chart, the information will be output to the Print Log and will look like the information in Table 7.1. 
If you examine the information in the Print Log, you’ll notice something wrong with our long liquidation stop; it’s above the entry price. We intended this stop to be a protec-tive stop and not a profit objective. This problem can be fixed simply by changing the “+” to a “–” in the line of code that sets the longLiqPoint. 
DEBUGGING WITH THE BUILT-IN DEBUGGER 
Now let’s debug the code with the help of the EasyLanguage Debugger. The debugger is invoked by incorporating a BreakPoint in your EasyLanguage code. Here is the code again, including the “BreakPoint” reserved word in place of the Print Statement and one additional variable—myEntryPrice. 
Vars: longLiqPoint(0),shortLiqPoint(0),myEntryPrice(0); 
{System uses William’s Percent R indicator to determine OB/OS situations} 
if(percentR(14) crosses above 20) then buy next bar at 
Highest(High,3) stop; 
if(percentR(14) crosses below 80) then sellShort next bar at 
Lowest(Low,3) stop; 
longLiqPoint = EntryPrice + 1.5 * Range; 
shortLiqPoint = EntryPrice + 1.5 * Range; 
{Debugging Starts Here!} 
{if(MarketPosition = 1) then print(Date," ",EntryPrice," ",longLiqPoint);} 
If(Marketposition = 1) then myEntryPrice = entryPrice; 
if(MarketPosition = 1) then BreakPoint("BreakLongLiq"); 
{Debugging Ends Here!} 
if(MarketPosition = 1) then sell next bar at longLiqPoint stop; 
if(MarketPosition = -1) then buyToCover next bar at shortLiqPoint 
stop; 
You have to put some type of name in quotations as the parameter for the BreakPoint call to work properly. Use something appropriate—we use “BreakLongLiq” because we are evaluating a problem with the long liquidation logic. Go ahead and change the logic by replacing the Print Statement with BreakPoint(“BreakLongLiq”) and make sure it is applied to an S&P 500 chart. Almost immediately after the strategy is applied, a new dialog box labeled TradeStation EasyLanguage Debugger—Breakpoint will appear. It should look very similar to Figure 7.1. 
Click on the + symbol beside the folder labeled AT/S (2). It will expand and pro-vide information about the different variables and function calls that are utilized in this particular strategy. Use Figure 7.2 as a guide and expand the same folders.
FIGURE 7.1 TradeStation EasyLanguage Debugger 
FIGURE 7.2 TradeStation Debugger with Variables Expanded 
179
180 BUILDING WINNING TRADING SYSTEMS WITH TRADESTATION 
FIGURE 7.3 TradeStation Debugger Highlighting longLiqPoint 
Before you do anything else, look at the pane in the top right that has Properties and Values listed. Right now it should state that the Symbol Name is @SP.P and it’s a daily chart. This pane also tells us what bar number we are currently sitting on and its current date and time and how many days back the strategy is using. We are attempting to debug a problem with our longLiqPoint, so go ahead and expand the longLiqPoint 
and myEntryPrice variables. Refer to Figure 7.3. You can already see the problem. The longLiqPoint value is above the EntryPrice, 
and this is wrong because we wanted it to be a protective stop. This could simply be a freak occurrence, so let’s go ahead and check out another trade. The debugger is con-trolled by the tool bar shown in Figure 7.4. 
The two most important buttons are the ones that control the execution of the pro-gram. The two buttons on the right will cause the execution to stop at the end of the bar or go to the next break point. Go ahead and click on the second button from the left and have the debugger move you to the next break point—remember this. Again you will see that the longLiqPoint is above the EntryPrice. Now all we need to do is kill the bug 
FIGURE 7.4 TradeStation Debugger Toolbar
Debugging and Output 181 
by correcting the problem. You probably noticed that we had to include a new variable (myEntryPrice) before we cranked up the debugger. This was necessary because we needed a temporary holding place for the EntryPrice so that it could be evaluated. The debugger provides access to all of the variables and function calls but not to all built-in reserved words such as “EntryPrice.” Keep this in mind if you plan on using the debugger on a potential programming project. But before we tell the debugger to either abort (the red circle with the X in the toolbar) or run through the rest of the code without stopping (exclamation mark), let’s examine a few more features of the debugger. 
Right click on the variable longLiqPoint in the panel titled Tree and select Add to 
Watch. Do the same with the myEntryPrice variable. After adding these two variables to watch, they should appear in the lower-right pane (refer to Figure 7.5). 
There is a pane divider between the Tree pane and the two others. Go ahead and grab the divider and squish the Tree so you can see more of the Watch pane. As you pro-ceed through the different break points, you will notice these variables changing values. This Watch pane makes it easier to see only the variables you are interested in. It also provides the ability to see not just the current bar value but prior values as well. This is accomplished by changing the settings in the Range for each variable. Click once in the Range area, and they will be highlighted with dark blue. Click once more, and you then can change the variables. There are three parameters and they default to 0,1,2. The first parameter tells the Watch pane which bar to show its value. The “0” bar is the current 
FIGURE 7.5 TradeStation Debugger with Watch Pane
182 BUILDING WINNING TRADING SYSTEMS WITH TRADESTATION 
bar. If you change this to “1,” then it would show the value of the prior bar. The second number in the series informs the debugger to show this number of variable values. If you change this to “2,” then you would see the current and prior bar value. The last number in the series informs the debugger to show this number of decimals in the values of the variables. See Figure 7.5. 
Since the strategy we are debugging is so simple, we really can’t illustrate how chang-ing the Range of these variables changes how they are displayed. However, we have cre-ated the following sequence of figures on a more complicated strategy to help show how you can change the way the variables are displayed. See Figure 7.6. 
By changing the last number in the Range series to “4,” you are telling the debugger to display four decimal places. See Figure 7.7. 
Changing the second number in the range series to a “2” informs the debugger to show two bars’ values. See Figure 7.8. 
Accordingly, changing the second number to “3” will show the values of three bars. You may have gleaned from our discussion on the two forms of debugging that the 
built-in debugger may be more powerful and the best way to go. However, we previously stated that it was good but not great. Compared to other professional-level debuggers, it leaves a lot to be desired. It does not allow you to visually watch each line of the strategy/program being evaluated, so you don’t know where you are in the code. Also, you must prep your code before running it through the debugger by creating additional variables and logically placing the BreakPoint function call. If you have a small program with a small bug, then simply use the old-fashioned printout method. On the other hand, 
FIGURE 7.6 TradeStation Debugger Evaluating a More Complicated Program
Debugging and Output 183 
FIGURE 7.7 TradeStation Debugger Watch Variables (sequence 1) 
FIGURE 7.8 TradeStation Debugger Watch Variables (sequence 2) 
FIGURE 7.9 TradeStation Debugger Watch Variables (sequence 3)
184 BUILDING WINNING TRADING SYSTEMS WITH TRADESTATION 
if the program is large and convoluted, then you should plan to use the EasyLanguage debugger and take the appropriate steps. 
We wish all logical errors were as simple as our first example. If you have no idea where a logical error may be located, then you basically have to print out or evaluate the values of all of your variables on a bar-by-bar basis. We have worked on programs where the number of Print Statements outnumbered the actual program statements two to one. The larger and more complex a program is, the more difficult and tedious the debugging will be. This is yet another reason to program in a modular format. If you have a complicated program that consists of several different modules, then program and debug each module one at a time. Program and debug module A and then move on to module B and so on. In doing so, if a logical error does creep into your code, then you will know its relative location. 
TABLE CREATOR 
The following code demonstrates how we used Print Statements to locate our logical errors and at the same time create a report. Before we go into the actual code, let us first explain what the program is attempting to do. We thought it would be interesting to do research on the relationship of the opening price and closing price to different zone levels. We got the idea for this type of research from Detecting High Profit Trades in the 
Futures Markets, by J. T. Jackson We cut today’s bar into four different zones: Zone1 is anything greater than today’s high; Zone2 is anything less than or equal to today’s high and greater than or equal to today’s midpoint; Zone3 is anything less than today’s mid-point and greater than or equal to today’s low; and Zone4 is anything less than today’s low. Our program will count the number of times the market opens in the four zones and keep track of the relationship between the opening and closing zones. In other words, we are trying to find the probability of the market opening in Zone1 and closing in Zone1, opening in Zone1 and closing in Zone2, and so on. In the end, the program will generate a report that looks something like the following: 
Close Zone1 Zone2 Zone3 Zone4 
Open Zone1 25% 18% 17% 40% Zone2 — — — — Zone3 — — — — Zone4 — — — — 
{Table Creator by George Pruitt 
We knew this program was going to be complicated, so we began with setting 
up a debugging framework to start. This program isn’t a simple strategy, 
but instead a platform for research and analysis. We wanted to set up a 
probability study based on the relationship between the opening and closing 
prices and different zone levels.}
Debugging and Output 185 
Vars: traceOn(FALSE),debugOn(FALSE),createReport(FALSE); 
Vars: zone1(0),zone2(0),zone3(0); 
Vars: inZone1(0),inZone2(0),inZone3(0),inZone4(0); 
Vars: inZone1.outZone1(0),inZone1.outZone2(0),inZone1.outZone3(0), 
inZone1.outZone4(0); 
Vars: inZone2.outZone1(0),inZone2.outZone2(0),inZone2.outZone3(0), 
inZone2.outZone4(0); 
Vars: inZone3.outZone1(0),inZone3.outZone2(0),inZone3.outZone3(0), 
inZone3.outZone4(0); 
Vars: inZone4.outZone1(0),inZone4.outZone2(0),inZone4.outZone3(0), 
inZone4.outZone4(0); 
Vars: myBarCounter(0); 
{Module 1 starts here!} 
debugOn = TRUE; {This turns the flag on to print out various debug info} 
traceOn = FALSE; {This turns the flag on to print out almost all statements} 
createReport = TRUE; {Print the report to the print log} 
{Start the analysis with the calculation of the different zones} 
zone1 = High[1]; 
zone2 = High[1] + Low[1]/2.0; 
zone3 = Low[1]; 
{Here we will print out the elements of our zone calculations to assist with 
our debugging} 
if(debugOn) then print(Date:8:0,High[1],Low[1],High[1] + Low[1]/2.0); 
{If we turn trace on, then the program will dump a ton of information} 
if(traceOn) then 
begin 
if(BarNumber = 1) then print("**Start Trace",Date:6:0," **"); 
print(" Zones for ",Date:8:0); 
print(" Zone1 = ",zone1); 
print(" Zone2 = ",zone2); 
print(" Zone3 = ",zone3); 
end; 
{!!!! Module 1 ends here} 
myBarCounter = myBarCounter + 1; 
if(Open > zone1) then {This begins opening in Zone1 Module} 
begin 
inZone1 = inZone1 + 1; 
if(Close > zone1) then inZone1.outZone1 = inZone1.outZone1 + 1; 
if(Close <= zone1 and Close > zone2) then 
inZone1.outZone2 = inZone1.outZone2 + 1; 
if(Close <= zone2 and Close > zone3) then 
inZone1.outZone3 = inZone1.outZone3 + 1; 
if(Close <= zone3) then inZone1.outZone4 = inZone1.outZone4 + 1; 
if(debugOn) then {Here we print the stats for an open in zone1} 
begin 
print("Open in Zone1 ",Date:6:0,zone1,Open,Close,inZone1, 
inZone1.outZone1,inZone1.outZone2,inZone1.outZone3, 
inZone1.outZone4); 
end; 
end; {This concludes opening in Zone1 Module}
186 BUILDING WINNING TRADING SYSTEMS WITH TRADESTATION 
TABLE 7.2 Debug Output 
1111109 1269 1246 1892 1111110 1243 1218 1852 1111111 1238 1219 1847 
Open in Zone1 1111111 1238 1247 1256 854 552 0 797 57 1111114 1259 1247 1882 1111115 1252 1238 1871 1111116 1256 1236 1874 1111117 1252 1225 1864 1111118 1230 1201 1830 1111121 1216 1203 1818 1111122 1192 1175 1779 1111123 1189 1174 1776 1111125 1170 1153 1747 1111128 1165 1145 1738 
Open in Zone1 1111128 1165 1184 1185 855 553 0 798 57 1111129 1190 1177 1779 1111130 1197 1185 1790 
Open in Zone1 1111130 1197 1224 1240 856 554 0 799 57 1111201 1241 1221 1851 1111202 1245 1233 1862 
Open in Zone1 1111202 1245 1250 1238 857 554 0 800 57 1111205 1254 1237 1872 
Open in Zone1 1111205 1254 1257 1249 858 554 0 801 57 1111206 1260 1243 1882 1111207 1260 1246 1883 1111208 1261 1238 1880 1111209 1250 1225 1862 1111212 1254 1233 1871 1111213 1239 1221 1849 1111214 1244 1213 1850 1111215 1218 1203 1820 
Open in Zone1 1111215 1218 1219 1212 859 554 0 802 57 1111216 1220 1208 1824 1111219 1225 1209 1829 
At this point in the program, we would take a break from programming and verify and apply the logic to an S&P 500 chart. We would examine the output in the Print Log to make sure that we had programmed everything accurately. 
Table 7.2 shows the output of our initial programming. Remember the statement: 
if(debugOn) then print(Date:8:0,High[1],Low[1],High[1] + Low[1]/2.0); 
We print out the date, high of yesterday, low of yesterday, and the midpoint of yes-terday (Zone1, Zone3, Zone2, respectively). Do you see something wrong in the printout? It looks like Zone2 is greater than Zone1. Our debugging already caught its first bug.
Debugging and Output 187 
Remember, Zone2 is the area between and including today’s midpoint and today’s high price. According to our printout, Zone2 is above Zone1. Let’s take a look at our Zone2 calculation: 
zone2 = High + Low/2.0; 
What’s wrong with this? Argh! We don’t want this. We want the midpoint or the average of today’s extreme prices: 
zone2 = (High + Low)/2.0; 
Remember the order of operations? Division is done first, and the low is first divided by 2.0 and then added to the high. We must use parentheses to get the correct order. It was a good thing we caught this right off the bat, or it may have caused several headaches down the road. Now back to the program. Let’s program for the occurrence of the open between Zone1 and Zone2. 
if(Open <= zone1 and Open >= zone2) then 
begin 
inZone2 = inZone2 + 1; 
if(Close > zone1) then inZone2.outZone1 = inZone2.outZone1+ 1; 
if(Close <= zone1 and Close > zone2) then 
inZone2.outZone2 = inZone2.outZone2 + 1; 
if(Close <= zone2 and Close > zone3) then 
inZone2.outZone3 = inZone2.outZone3 + 1; 
if(Close <= zone3) then inZone2.outZone4 = inZone2.outZone4+1; 
if(debugOn) then{Here we print the stats for an open in zone2} 
begin 
print("Open in Zone1", zone1Open, Close,inZone2, 
inZone2.outZone1, inZone2.outZone2, 
inZone2.outZone3,inZone2.outZone4); 
end; 
end; 
{!!!!! Module 2 ends here and Module 3 starts here} 
For brevity’s sake, we will skip the other two zone calculations and move on to cre-ating the probability analysis table. 
If(LastBarOnChart and createReport) then 
begin 
Print("Close "," Zone1 Zone2 Zone3 Zone4"); 
Print("————————————"); Print("Open |"); {How many times did we open in zone1 and close 
inzone1} 
value1 = inZone1.outZone1/inZone1*100; {value1 is a 
temporary variable}
188 BUILDING WINNING TRADING SYSTEMS WITH TRADESTATION 
value2 = inZone1.outZone2/inZone1*100; {value2 is a 
temporary variable} 
value3 = inZone1.outZone3/inZone1*100; {and so on} 
value4 = inZone1.outZone4/inZone1*100; 
Print("Zone1 | ",inZone1,value1:3:0,"% ", value2:3:0,"% 
",value3:3:0,"% ", value4:3:0,"%"); 
value1 = inZone2.outZone1/inZone2*100; {value1 is a 
temporary variable} 
value2 = inZone2.outZone2/inZone2*100; {value2 is a 
temporary variable} 
value3 = inZone2.outZone3/inZone2*100; {and so on} 
value4 = inZone2.outZone4/inZone2*100; 
Print("Zone2 | ",inZone3,value1:3:0,"% ", value2:3:0,"% 
", value3:3:0,"% ", value4:3:0,"%"); 
Again for brevity, we will skip the remaining portion of the report creation code. Don’t worry, you will find the program in its entirety on the Website. We are sure you will find the research quite interesting. We do include the probability table of the S&P 500 at the end of this chapter, the exact one generated by this code. 
Remember when we said that the Super Combo strategy was the end result of trial and error and a couple of hours of debugging? Take a look at a portion of the code that dealt with setting the longLiqPoint with our debug statements. 
{The next module keeps track of positions and places protective stops} 
if(MarketPosition = 1) then 
begin 
longLiqPoint = EntryPrice—protStopPrcnt1*averageRange; print("1 Long",longLiqPoint,entryPrice); 
longLiqPoint = MinList(longLiqPoint,EntryPrice—protStopAmt); print("2",longLiqPoint); 
if(MarketPosition(1) = -1 and BarsSinceEntry = 1 and 
High[1] >= shortLiqPoint and shortLiqPoint < shortFBOPoint) then 
currTrdType = -2; {we just got long from a short liq reversal} 
if(currTrdType = -2) then 
begin 
longLiqPoint = EntryPrice—protStopPrcnt2*averageRange; longLiqPoint = MinList(longLiqPoint,EntryPrice—protStopAmt); print("3",longLiqPoint,currTrdType,barssinceentry(0)); 
end; 
if(High >= EntryPrice + breakEvenPrcnt*averageRange) then 
longLiqPoint = EntryPrice; {Break-even trade} 
print("4",longLiqPoint); 
if(Time >= initTradesEndTime) then {Trailing stop} 
longLiqPoint = MaxList(longLiqPoint,Lowest(Low,3)); 
print("5",longLiqPoint); 
if(Time < liqRevEndTime and sellsToday = 0 and 
longLiqPoint <> EntryPrice) then
Debugging and Output 189 
begin 
SellShort("LongLiqRev") next bar at longLiqPoint stop; 
end 
else begin 
Sell("LongLiq") next bar at longLiqPoint stop; 
end; 
end; 
See how we printed the value of the protective stop each and every time it was changed? We printed a different number for each condition that could change the pro-tective stop and the actual value of the protective stop. Even professional programmers have to debug. Heck, most of them use debugging as a programming tool and not a fix. The truth of the matter is that most programmers (EasyLanguage or whatever language) do very little planning. They start coding right off the bat. If they don’t know how a func-tion works or the correct keyword, they will output the results to a debugger to find out. In most cases, they spend way too much time in front of the computer. We aren’t look-ing down our noses at these programmers, because we do the same thing. However, if you can learn the correct way and be disciplined enough, you can considerably decrease debugging time and prevent your monitor from flying out a window. Well, enough with the lecture. The output from the Table Creator strategy is shown in Table 7.3. The anal-ysis indicates that the S&P 500 market usually closes in the zone it opened in and rarely works its way back to the opposite extreme zone. 
The Print Statement can be used to print out to a text file. The probability table that we created could be printed to a file instead of the Print Log. To do this, you would simply insert the name of the file into the existing Print Statements: 
Before: Print(" Close "," Zone1 Zone2 Zone3 Zone4"); 
After: Print("c:\MyFile"," Close "," Zone1 Zone2 Zone3 Zone4"); 
This Print Statement will print to MyFile on the C drive. Each time you apply your code with this Print Statement to a chart, MyFile will be deleted and recreated and printed to. After the analysis technique is applied, the file can then be opened with a word processor, emailed to others, copied to a disk, or anything else you can do with a 
TABLE 7.3 Results of Table Creator 
Close Zone1 Zone2 Zone3 Zone4 
Open Zone1 64% 20% 9% 7% Zone2 35% 33% 19% 13% Zone3 13% 25% 30% 32% Zone4 6% 12% 22% 60%
190 BUILDING WINNING TRADING SYSTEMS WITH TRADESTATION 
file. This is a powerful tool for creating reports and analysis. Table 7.3 is a sample of the output that we created with our CreateReport program. 
CONCLUSIONS 
Debugging is an essential part of programming. Without it, how would we fix our logic and our programs? The Print Statement can be used to print out the values of our vari-ables to the Print Log or a file. The Print Statement and the EasyLanguage debugger should provide all the tools necessary to squash any bugs you come across in your pro-gramming endeavors. You can also format the output of the Print Statement like in the following: 
myValue1 = 132.4444455; 
Format Output 
Print(myValue1:4:2); 132.45 
Print(myValue1:4:0); 132 
Print(myValue1:4.1); 133.5 
In the examples above, the Print Statements are formatted by adding the semicolon and the minimum number of integers to display and then another semicolon with the maximum number of decimals. Using formatting can make your printout much easier to interpret and therefore speed up debugging. Printing to a file is as easy as printing to the print log: 
Print("C:\myDataFile",myValue1); 
This statement prints myValue1 to myDataFile on the C drive. Each time a new Print Statement is encountered, a line feed is generated. So for every Print Statement, you will have a line of output. The file is destroyed and recreated every time a new bar is added to the chart, the program is verified, or the program is applied to a new chart. You will soon discover how helpful the Print Statement really is. 
So far, our discussions have revolved mostly around programming strategies. The next chapter shifts gears and we concentrate on the research and analysis capabilities of EasyLanguage and TradeStation.
C H A P T E R 8 
TradeStation as a Research Tool 
B efore you can create a trading strategy, you must develop and research a trading 
idea. A strategy starts out as an initial hunch: “What if I buy when the market makes a new five-day high and the ADX is greater than 40?” The life of this trading 
idea is either ended quickly or extended through research. If we program an idea and test it and it fails miserably, then we usually file it in the circular file. However, if the idea shows some potential, then we go on from there. The next step is adding some other ideas to the core: “What if I force a 19-bar Stochastic reading to be in the oversold region in addition to a new five-day high and the ADX reading is greater than 40?” This is usually how the developmental cycle of a trading strategy works. In this chapter, we will show how to use TradeStation, EasyLanguage, and optimization as tools for developing, researching, and testing trading ideas. These ideas may or may not evolve into complete trading strategies. The ideas that we will expound upon involve the use of fundamental data, pattern recognition, and intermarket analysis. We hope the ideas and programming that we present in this chapter will provide a sound foundation for you to build your research tools on. 
COMMITMENT OF TRADERS REPORT 
Many of the trading strategies and ideas that we have tested over the past 15 years have relied solely on price data. However, there are trading ideas and strategies that incor-porate data outside of market prices. The next programming project will demonstrate how to include external nonprice data in your testing. The Commodity Futures Trad-ing Commission’s (CFTC) Commitment of Traders (COT) report is an example of useful non-price-specific data. This report summarizes the positions held by reporting and non-reporting traders. If a trader’s position exceeds a certain level, it must be reported to the 
191
T A B 
L E 
8 .1 
C o m 
m it 
m en 
t o f 
T ra 
d er 
s R 
ep o rt 
S & P 
5 0 0 
S T O C K 
I N D E X 
-C H I C A G O 
M E R C A N T I L E 
E X C H A N G E 
C O M M I T M E N T S 
O F 
T R A D E R S 
I N 
A L L 
F U T U R E S 
C O M B I N E D 
A N D 
I N D I C A T E D 
F U T U R E S , 
A p r i l 
9 , 
2 0 0 2 
---------------------------------------------------------------------------------------------------
: T O T A L 
: R E P O R T A B L E 
P O S I T I O N S 
: 
F : --------------------------------------------------------------------------: 
N O N R E P O R T A B L E 
U : 
: N O N -C O M M E R C I A L 
: : 
: P O S I T I O N S 
T : 
: --------------------------------: 
: : 
U : 
O P E N 
: L O N G 
O R 
S H O R T : 
L O N G 
A N D 
S H O R T : 
C O M M E R C I A L 
: T O T A L 
: 
R : 
I N T E R E S T : 
O N L Y 
: ( S P R E A D I N G ) 
: : 
: 
E : 
: ----------------------------------------------------------------------------------
S : 
: L O N G 
: S H O R T : 
L O N G 
: S H O R T : 
L O N G 
: S H O R T : 
L O N G 
: S H O R T : 
L O N G 
: S H O R T 
---------------------------------------------------------------------------------------------------
: : ( S & P 
5 0 0 
I N D E X 
X $ 2 5 0 . 0 0 ) 
: 
: : 
: 
A L L 
: 5 0 5 , 8 1 3 : 
3 0 , 1 7 6 
4 2 , 7 6 1 
4 , 2 9 9 
4 , 2 9 9 
3 2 0 , 1 0 1 
4 1 1 , 0 7 5 
3 5 4 , 5 7 6 
4 5 8 , 1 3 5 : 
1 5 1 , 2 3 7 
4 7 , 6 7 8 
O L D 
: 5 0 5 , 8 1 3 : 
3 0 , 1 7 6 
4 2 , 7 6 1 
4 , 2 9 9 
4 , 2 9 9 
3 2 0 , 1 0 1 
4 1 1 , 0 7 5 
3 5 4 , 5 7 6 
4 5 8 , 1 3 5 : 
1 5 1 , 2 3 7 
4 7 , 6 7 8 
O T H E R 
: 0 : 
0 0 
0 0 
0 0 
0 0 : 
0 0 
: : 
: 
: : 
C H A N G E S 
I N 
C O M M I T M E N T S 
F R O M 
A p r i l 
2 , 
2 0 0 2 
: 
A L L 
: 9 , 7 9 0 : 
9 0 5 
2 2 3 
2 9 0 
2 9 0 
6 , 8 0 7 
4 , 7 3 8 
8 , 0 0 2 
5 , 2 5 1 : 
1 , 7 8 8 
4 , 5 3 9 
: : 
: 
192
: : P E R C E N T 
O F 
O P E N 
I N T E R E S T 
R E P R E S E N T E D 
B Y 
E A C H 
C A T E G O R Y 
O F 
T R A D E R S : 
A L L 
: 1 0 0 . 0 % 
: 6 . 0 
8 . 5 
0 . 8 
0 . 8 
6 3 . 3 
8 1 . 3 
7 0 . 1 
9 0 . 6 : 
2 9 . 9 
9 . 4 
O L D 
: 1 0 0 . 0 % 
: 6 . 0 
8 . 5 
0 . 8 
0 . 8 
6 3 . 3 
8 1 . 3 
7 0 . 1 
9 0 . 6 : 
2 9 . 9 
9 . 4 
O T H E R 
: 1 0 0 . 0 % 
: 0 . 0 
0 . 0 
0 . 0 
0 . 0 
0 . 0 
0 . 0 
0 . 0 
0 . 0 : 
0 . 0 
0 . 0 
: ---------: 
: 
: N U M B E R 
O F : 
: 
: T R A D E R S 
: N U M B E R 
O F 
T R A D E R S 
I N 
E A C H 
C A T E G O R Y 
: 
: ---------: 
: 
A L L 
: 1 3 8 
: 1 8 
1 9 
1 0 
1 0 
8 0 
5 9 
1 0 6 
8 0 : 
O L D 
: 1 3 8 
: 1 8 
1 9 
1 0 
1 0 
8 0 
5 9 
1 0 6 
8 0 : 
O T H E R 
: 0 
: 0 
0 0 
0 0 
0 0 
0 : 
: --------------------------------------------------------------------------------------------
: C O N C E N T R A T I O N 
R A T I O S 
: P E R C E N T 
O F 
O P E N 
I N T E R E S T 
H E L D 
B Y 
T H E I N D I C A T E D 
N U M B E R 
O F 
L A R G E S T 
T R A D E R S 
: --------------------------------------------------------------------------------------------
: B Y 
G R O S S 
P O S I T I O N 
: B Y 
N E T 
P O S I T I O N 
: --------------------------------------------------------------------------------------------
: 4 O R 
L E S S 
T R A D E R S 
: 8 
O R 
L E S S 
T R A D E R S 
: 4 
O R 
L E S S 
T R A D E R S 
: 8 O R 
L E S S 
T R A D E R S 
: --------------------------------------------------------------------------------------------
: L O N G 
: S H O R T 
: L O N G 
: S H O R T 
: L O N G 
: S H O R T 
: L O N G 
: S H O R T 
: --------------------------------------------------------------------------------------------
A L L 
: 2 1 . 6 
3 1 . 6 
3 0 
4 5 . 4 
2 1 . 3 
3 0 . 8 
2 9 . 5 
4 4 . 5 
O L D 
: 2 1 . 6 
3 1 . 6 
3 0 . 2 
4 5 . 4 
2 1 . 3 
3 0 . 8 
2 9 . 5 
4 4 . 5 
O T H E R 
: 0 . 0 
0 . 0 
0 . 0 
0 . 0 
0 . 0 
0 . 0 
0 . 0 
0 . 0 
---------------------------------------------------------------------------------------------------
193
194 BUILDING WINNING TRADING SYSTEMS WITH TRADESTATION 
CFTC. This reporting procedure prevents any one individual or group from controlling or cornering the market. The COT report subdivides the open interest (all positions held) into commercial (hedgers) interest and speculative interest. The commercial and specu-lative positions are then divided into long and short positions. This report was originally released on the eleventh day of the month but is now released on a weekly basis. We thought it would be interesting research to find out if the commercial interest had any insight in the direction of the market. If the commercial positions were net bullish, we would buy. If the commercial positions were net bearish, we would sell. The Commit-ment of Traders report can be accessed through the CFTC Website, www.cftc.gov. The daily report looks like the one in Table 8.1. 
Fortunately for TradeStation users, access to this data requires only a few keystrokes. EasyLanguage provides functions that can return an enormous amount of fundamental data. The function FundValue is one of a family of five functions that can be used to obtain fundamental data and to check for errors that may occur when the requested fundamental data item is retrieved. The use of this function is relatively com-plicated, but we knew that TradeStation included the COT data in an indicator, so we opened up the indicator and utilized its code to create a trading strategy. This is another great asset of EasyLanguage; a lot of code for indicators and strategies is included in the library. 
The following code was copied from the built-in Cot NetPosition indicator and pasted into a new strategy named NewCotTrader. Any line that had the keyword “PLOT” was commented out. Just a quick refresher—a line of code can be commented out so that it is ignored by the compiler by using the curly brackets ({}) or by simply putting two slashes (//) in front of the line of code. The curly brackets are used to comment out multiple lines of code, and the slashes are used to comment out a single line. 
variables: 
Initialized( false ),FieldNamePrefix( "" ),CommLongFieldNme( "" ), 
CommShortFieldNme( "" ),NonCommLongFieldNme( "" ), 
NonCommShortFieldNme( "" ),SpecLongFieldNme( "" ), 
SpecShortFieldNme( "" ),CommLong( 0 ), 
oCommLongErr( 0 ),CommShort( 0 ),oCommShortErr( 0 ), 
NonCommLong( 0 ),oNonCommLongErr( 0 ),NonCommShort( 0 ), 
oNonCommShortErr( 0 ),SpecLong( 0 ),oSpecLongErr( 0 ), 
SpecShort( 0 ),oSpecShortErr( 0 ),CommNet( 0 ),NonCommNet( 0 ), 
SpecNet( 0 ); 
if Initialized = false then 
begin 
if Category > 0 then 
RaiseRuntimeError( "Commitments of Traders studies can be 
applied only to" +" futures symbols." ); 
Initialized = true; 
FieldNamePrefix=IffString(FuturesOnly_Or_FuturesAndOptions_1_or_2=1, "COTF-", "COTC-" ); 
CommLongFieldNme = FieldNamePrefix + "12"; 
CommShortFieldNme = FieldNamePrefix + "13";
TradeStation as a Research Tool 195 
NonCommLongFieldNme = FieldNamePrefix + "9"; 
NonCommShortFieldNme = FieldNamePrefix + "10"; 
SpecLongFieldNme = FieldNamePrefix + "16"; 
SpecShortFieldNme = FieldNamePrefix + "17"; 
end; 
CommLong = FundValue( CommLongFieldNme, 0, oCommLongErr ); 
CommShort = FundValue( CommShortFieldNme, 0, oCommShortErr); 
NonCommLong = FundValue( NonCommLongFieldNme, 0, oNonCommLongErr ); 
NonCommShort = FundValue( NonCommShortFieldNme, 0, oNonCommShortErr ); 
SpecLong = FundValue( SpecLongFieldNme, 0, oSpecLongErr ); 
SpecShort = FundValue( SpecShortFieldNme, 0, oSpecShortErr ); 
if oCommLongErr = fdrOk and oCommShortErr = fdrOk then 
begin 
CommNet = CommLong—CommShort; // Plot1( CommNet, "Comm" ); 
Print(date," ",CommNet); 
end; 
if oNonCommLongErr = fdrOk and oNonCommShortErr = fdrOk then 
begin 
NonCommNet = NonCommLong—NonCommShort; // Plot2( NonCommNet, "NonComm" ); 
end; 
if oSpecLongErr = fdrOk and oSpecShortErr = fdrOk then 
begin 
SpecNet = SpecLong—SpecShort; // Plot3( SpecNet, "Spec" ); 
end; 
//Plot4( 0, "ZeroLine" ); 
If CommNet < 0 then sellShort tomorrow at open; 
If CommNet > 0 then buy tomorrow at open; 
There is a lot of code that you probably don’t recognize. Heck, there is code in here that even George doesn’t recognize, but that is okay. We are simply adapting an existing tool to our own use. Why reinvent the wheel? The important thing that we need for this system to work is the net commitment of the commercial interests. Looking through the code, we can see that this exact number is what is being plotted in Plot1. So why don’t we just comment out the Plots by using the “//” and install two lines of code to tell TradeSta-tion when to buy and when to sell short. The following two lines will do this for us: 
If CommNet < 0 then sellShort tomorrow at open; 
If CommNet > 0 then buy tomorrow at open; 
The computer will initiate a buy signal when the number of commercial long posi-tions is greater than the number of commercial short positions. The opposite holds true for initiating short positions. Simple as that! Table 8.2 shows how the strategy performed when it was applied to the S&P 500 futures.
196 BUILDING WINNING TRADING SYSTEMS WITH TRADESTATION 
TABLE 8.2 CotTrader Strategy Performance 
All Trades Long Trades Short Trades 
Total Net Profit $404,550.00 $258,487.50 $146,062.50 Gross Profit $756,775.00 $359,700.00 $397,075.00 Gross Loss ($352,225.00) ($101,212.50) ($251,012.50) Profit Factor 2.15 3.55 1.58 
Total Number of Trades 82 41 41 Percent Profitable 56.10% 58.54% 53.66% Winning Trades 46 24 22 Losing Trades 36 17 19 Even Trades 0 0 0 
Avg. Trade Net Profit $4,933.54 $6,304.57 $3,562.50 Avg. Winning Trade $16,451.63 $14,987.50 $18,048.86 Avg. Losing Trade ($9,784.03) ($5,953.68) ($13,211.18) Ratio Avg. Win:Avg. Loss 1.68 2.52 1.37 Largest Winning Trade $172,750.00 $45,575.00 $172,750.00 Largest Losing Trade ($53,975.00) ($22,950.00) ($53,975.00) 
Max. Consecutive Winning Trades 6 3 4 Max. Consecutive Losing Trades 4 3 4 
Return on Initial Capital 404.55% Annual Rate of Return 8.17% Buy and Hold Return 49.36% Return on Account 300.84% Avg. Monthly Return $764.17 
Max. Draw Down (Intraday Peak to Valley) 
Value ($171,225.00) ($58,825.00) ($159,150.00) Date 8/16/2007 16:15 
Max. Draw Down (Trade Close to Trade Close) 
Value ($134,475.00) ($39,075.00) ($119,200.00) Date 12/27/2007 16:15 
Max. Trade Draw Down ($56,900.00) ($40,275.00) ($56,900.00) 
Well, in the case of the S&P 500, it looks like the commercial traders know what they are doing. Is this the case for other markets? We will let you figure that out. One thing you might have noticed is that nowhere in the code do we tell the fundamental data function the type or name of the futures we are testing. We didn’t pass the name of the symbol to the function—we checked there. This function is so smart that it interprets the symbol being plotted and returns the correct COT data for that market. If you are testing pork bellies, then you would want to use the data pertaining to pork bellies, right? If you use this strategy on a market that is not included in the Commitment of Traders report, then the function will let you know by throwing out an error message.
TradeStation as a Research Tool 197 
Day of Week Analysis 
Many studies have been done on buying/selling on different days of the week to enhance profitability. I know of a number of market technicians who are firm believers in a day of the week for taking market action. A series of studies has been done with the objective of determining if buying or selling on different days of the week gives a trading edge. There are a number of different ways to look at this. Some are: 
 Open to close on the same day.  Close to close from one day to the next.  Volatility of markets for different days of the week. 
One could introduce a variable stop for different days of the week depending on the volatility. This is a computer exercise to determine the best set of variables to produce the best possible return on past market action. This is known as curve fitting, or perhaps super curve fitting. One must ask whether this will bear any relationship to future market action. It reminds us of the infomercial on late-night television where computer studies were made on the seasonality of all markets. Such studies would show that one buys, say, the Swiss Franc on one day of the year and sells on another computer-optimized day for accuracies of 80 percent. Anyone who believes ideas such as these simply does not understand the forces of supply and demand. This is a computer-generated study that can produce any desired return one wants on past market data. The proponents of day of week trading say that people are more inclined to buy or sell on one day of the week versus another, or that their particular pattern works better. It has nothing to do with supply and demand characteristics. Is such an approach reliable or pure hogwash? We will let you decide, using the tables in the next section that show the results of our day of week analysis using EasyLanguage code to generate the test results. 
Open-to-Close and Open-to-Open Relationships Our first tests will analyze the open-to-close relationship on the various days of the week. The following code illustrates the code for buying or selling on the open on the different days of the week and liquidat-ing the position on the close. We are using an Input statement so that we can test buys and sells across the different weekdays in one optimization run. This test will show if cer-tain days have a bullish or bearish bias. We will test the Dow Jones, S&P 500, NASDAQ, and U.S. bonds. 
Inputs: buyOrSell(1),whichDay(1); 
{buyOrSell: 1 = buy 2 = sell whichDay: 1 is Monday 2 is Tuesday etc . . .} 
if(DayOfWeek(Date of Tomorrow) = whichDay) then 
begin 
if(buyOrSell = 1) then 
buy("Buy On Open") at next bar at Open; 
if(buyOrSell = 2) then 
sellShort("Sell On Open") at next bar at Open; 
end; 
SetExitOnClose;
T A B 
L E 
8 .3 
D ay 
o f 
W ee 
k A 
n al 
ys is 
1 — 
T ab 
le 1 
B u 
y / S e 
ll o 
n th 
e O 
p e 
n a 
n d 
L iq 
u id 
a te 
o n 
th e 
C lo 
s e 
D a 
y o 
f W 
e e 
k A 
n a 
ly s 
is 1 
2 / 1 
9 9 
1 –1 
2 / 2 
0 1 
1 D 
o w 
Jo n 
e s 
N A 
S D 
A Q 
S & 
P 5 
0 0 
U .S 
.B o 
n d 
s 
D a 
y o 
f W 
e e 
k B 
u y 
S e 
ll B 
u y 
S e 
ll B 
u y 
S e 
ll B 
u y 
S e 
ll 
M o n d ay 
$ 2 
0 ,6 
2 0 
−$ 2 
0 ,6 
2 0 
−$ 1 
0 4 
,9 4 
0 $ 
1 0 
4 ,9 
4 0 
−$ 2 
,7 8 
7 $ 
2 ,7 
8 7 
$ 4 
8 ,9 
6 8 
−$ 4 
8 ,9 
6 8 
T u es 
d ay 
$ 8 
,1 0 
0 −$ 
8 ,1 
0 0 
−$ 1 
7 0 
,8 4 
5 $ 
1 7 
0 ,8 
4 5 
$ 3 
0 ,7 
8 7 
−$ 3 
0 ,7 
8 7 
$ 6 
6 ,6 
5 6 
−$ 6 
6 ,6 
5 6 
W ed 
n es 
d ay 
$ 1 
2 ,1 
7 0 
−$ 1 
2 ,1 
7 0 
−$ 3 
2 ,7 
6 0 
$ 3 
2 ,7 
6 0 
$ 5 
0 ,8 
8 7 
−$ 5 
0 ,8 
8 7 
−$ 1 
6 ,9 
6 8 
$ 1 
6 ,9 
6 8 
T h u rs 
d ay 
−$ 2 
,2 8 
0 $ 
2 ,2 
8 0 
$ 1 
0 2 
,6 7 
5 −$ 
1 0 
2 ,6 
7 5 
$ 3 
4 ,3 
6 2 
−$ 3 
4 ,3 
6 2 
$ 2 
,8 7 
5 −$ 
2 ,8 
7 5 
Fr id 
ay −$ 
3 0 
,5 8 
0 $ 
3 0 
,5 8 
0 −$ 
1 7 
1 ,6 
5 0 
$ 1 
7 1 
,6 5 
0 −$ 
1 0 
0 ,9 
0 0 
$ 1 
0 0 
,9 0 
0 $ 
3 1 
−$ 3 
1 
T o ta 
l $ 
8 ,0 
3 0 
−$ 8 
,0 3 
0 −$ 
3 7 
7 ,5 
2 0 
$ 3 
7 7 
,5 2 
0 $ 
1 2 
,3 4 
9 −$ 
1 2 
,3 4 
9 $ 
1 0 
1 ,5 
6 2 
−$ 1 
0 1 
,5 6 
2 
T A B 
L E 
8 .4 
D ay 
o f 
W ee 
k A 
n al 
ys is 
1 — 
T ab 
le 2 
B u 
y / S e 
ll o 
n th 
e O 
p e 
n a 
n d 
L iq 
u id 
a te 
o n 
th e 
N e 
xt M 
o rn 
in g 
’s O 
p e 
n D 
a y 
o f 
W e 
e k 
A n 
a ly 
s is 
1 2 
/ 1 
9 9 
1 –1 
2 / 2 
0 1 
1 D 
o w 
Jo n 
e s 
N A 
S D 
A Q 
S & 
P 5 
0 0 
U .S 
.B o 
n d 
s 
D a 
y o 
f W 
e e 
k B 
u y 
S e 
ll B 
u y 
S e 
ll B 
u y 
S e 
ll B 
u y 
S e 
ll 
M o n d ay 
$ 2 
8 ,3 
9 0 
−$ 2 
8 ,3 
9 0 
−$ 6 
,0 4 
0 $ 
6 ,0 
4 0 
$ 5 
4 ,7 
7 5 
−$ 5 
4 ,7 
7 5 
$ 5 
1 ,1 
2 5 
−$ 5 
1 ,1 
2 5 
T u es 
d ay 
−$ 6 
,3 8 
0 $ 
6 ,3 
8 0 
−$ 1 
5 5 
,6 8 
5 $ 
1 5 
5 ,6 
8 5 
−$ 1 
2 ,6 
5 0 
$ 1 
2 ,6 
5 0 
$ 7 
3 ,4 
3 7 
−$ 7 
3 ,4 
3 7 
W ed 
n es 
d ay 
$ 1 
5 ,3 
7 0 
−$ 1 
5 ,3 
7 0 
$ 8 
0 ,6 
4 1 
−$ 8 
0 ,6 
4 1 
$ 2 
8 ,3 
7 5 
−$ 2 
8 ,3 
7 5 
−$ 1 
,4 6 
8 $ 
1 ,4 
6 8 
T h u rs 
d ay 
−$ 4 
,4 1 
0 $ 
4 ,4 
1 0 
$ 2 
3 3 
,4 6 
0 −$ 
2 3 
3 ,4 
6 0 
$ 9 
0 ,8 
2 5 
−$ 9 
0 ,8 
2 5 
$ 1 
8 ,0 
9 3 
−$ 1 
8 ,0 
9 3 
Fr id 
ay −$ 
1 0 
,1 6 
0 $ 
1 0 
,1 6 
0 −$ 
8 0 
,8 3 
5 $ 
8 0 
,8 3 
5 −$ 
5 4 
,3 5 
0 $ 
5 4 
,3 5 
0 −$ 
2 1 
,3 4 
3 $ 
2 1 
,3 4 
3 
T o ta 
l $ 
2 2 
,8 1 
0 −$ 
2 2 
,8 1 
0 $ 
7 1 
,5 4 
1 −$ 
7 1 
,5 4 
1 $ 
1 0 
6 ,9 
7 5 
−$ 1 
0 6 
,9 7 
5 $ 
1 1 
9 ,8 
4 4 
−$ 1 
1 9 
,8 4 
4 
198
TradeStation as a Research Tool 199 
You will have to set up an optimization run and vary the buyOrSell input from 1 to 2 and vary the whichDay input from 1 to 5 with increment values of 1. We are using TradeStation’s optimization capabilities in a somewhat different manner than we have discussed thus far in the book. We really aren’t trying to optimize a certain parameter. We simply want TradeStation to batch process the same program over different parameters. In other words, we aren’t optimizing, we are batch processing. If buyOrSell is equal to 1, then the system will only buy. If this input is 2, then the system will only sell. The whichDay input determines which day the trade takes place. If whichDay is 1, then the trade takes place on Monday, and so on. Table 8.3 shows the results of buying and selling on the various days of the week. Tables 8.3 and 8.4 show the results of trading on the different weekdays over a 20-year time period. The only thing different in this test is that the positions were held overnight and liquidated on the next morning’s open. 
Day of Week Volatility Analysis 
Is there a particular day of the week that shows more volatility on a consistent ba-sis? Let’s find out. This test was conducted by first measuring the 30-day volatility up to the week we were analyzing and then comparing the daily volatility against this measurement. We summed up the quotient of the true range of each weekday divided by the average true range of the past 30 days measured at the close of the previous Friday—TrueRange/AvgTrueRange(30)—and then divided by the number of occur-rences of each weekday. Since we aren’t analyzing profits or losses, we will rely on the Print Log to print out our findings. In this test, volatility is defined as the average true range for the past 30 days. 
Vars: volMeasure(1),count(0),dayName("Monday"); 
Arrays: binArray[5](0),dayCntArray[5](0); 
{binArray will keep track of the daily ATR ratios 
binArray[0] = Monday 
binArray[1] = Tuesday 
binArray[2] = Wednesday 
binArray[3] = Thursday 
binArray[4] = Friday → Remember, arrays are zero based in EasyLanguage} 
if(DayOfWeek(Date) = Monday) then volMeasure = AvgTrueRange(30)[1]; 
{The DayOfWeek function returns 1-5 for Monday-Friday. 
We subtract a 1 from whatever the function returns to make the arrays zero 
based. If today is Monday, then DayOfWeek returns a 1. We then subtract 1 
from that and use it as the index into our arrays. Mondays 
will be stored in the zero element.} 
binArray[DayOfWeek(Date)-1] = binArray[DayOfWeek(Date)-1] + 
TrueRange/volMeasure; 
dayCntArray[DayOfWeek(Date)-1] = dayCntArray[DayOfWeek(Date)-1] + 1; 
if(lastBarOnChart) then 
begin 
Print(SymbolName,Date:6:0,"Day of Week Volatility Study"); 
for count = 0 to 4
200 BUILDING WINNING TRADING SYSTEMS WITH TRADESTATION 
begin 
if(count = 0) then dayName = "Monday"; 
if(count = 1) then dayName = "Tuesday"; 
if(count = 2) then dayName = "Wednesday"; 
if(count = 3) then dayName = "Thursday"; 
if(count = 4) then dayName = "Friday"; 
Print(dayName,binArray[count]/dayCntArray[count]); 
end; 
end; 
As you can see from the code, we aren’t utilizing inputs and, therefore, aren’t utilizing optimization. In this test, we don’t need to inform the program on which day to take action or to buy or sell; we are monitoring all days simultaneously regardless of buying or selling. Table 8.5 shows the results from our testing. 
All of these tests are interesting, and the programming behind them may offer some educational benefit, but can we really use the information? If one really believes that this is a valid analysis, then one can curve-fit one’s strategy for different entries and exits on each day of the week depending on historical analysis. Our attitude is that you shouldn’t fool yourself by buying such curve-fitting at face value. What we mean is, don’t get carried away with any historical analysis and/or back-testing. Overall, we personally find it difficult to draw firm conclusions from the tests. We do track systems that use this type of analysis in the Futures Truth magazine. In real-time, walk-forward testing, these systems have not demonstrated any better performance than systems that do not use this form of analysis. Again, here are the numbers. Draw your own conclusions, and we welcome your comments. 
Time of Day Analysis 
Time of day analysis is more utilized by day traders; if you are executing trades only on a monthly basis, then you really don’t care what time of the day you entered the trade. Day traders enter and exit the market on the same day. Many of these traders feel that time plays an important part in the success of a trade. Many people would agree that waiting until after the first 30 minutes of trading on the stock indices will prevent whipsaws. The first 30 minutes of trading is usually heavily laden with news and consists 
TABLE 8.5 Day of Week Volatility Study 
Daily True Ranges as a Percentage of 30-Day Avg. True Range Day of Week Analysis 12/1991–12/2011 U.S. Bonds NASDAQ Dow Jones S&P 
Day of Week Monday 85% 99% 98% 99% Tuesday 98% 104% 117% 104% Wednesday 99% 104% 118% 102% Thursday 105% 108% 128% 105% Friday 116% 100% 142% 103%
TradeStation as a Research Tool 201 
of high volatility and indirection. Other traders believe that the true trend of the day is not established until after lunch. We have heard from many brokers and traders that early trading is for the amateurs and late trading is for the pros. We thought we would put these hypotheses to the test. In this time of day analysis, we tested entering the S&P 500 futures markets at various times. Keep in mind we tested the day session only. The test starts out by buying the open and liquidating on the close. Each subsequent test waits an additional 15 minutes before a trade is entered. We still exit the market on close and do not incorporate any form of protective or profit objective stops. In addition to keeping track of profits or losses, we also keep track of the average excursion for each test. After we completed testing long trades, we then tested the short side of the market. We were able to accomplish this analysis by using TradeStation’s optimization capabilities and the following programming code: 
Inputs: buyOrSell(1),barDelay(0); 
Vars: barCount(0),delayval(0),excursionVal(0),totalExcursionVal(0), 
trdCount(0), posString("Long"); 
{Test using 5-minute bars} 
if(BarNumber > 1 and date <> date[1]) then begin 
if(excursionVal < 0) then totalExcursionVal = totalExcursionVal + 
excursionVal; 
trdCount = trdCount + 1; 
end; 
if(date <> date[1]) then barCount = 0; 
barCount = barCount + 1; 
if(barCount = barDelay or barDelay = 0) then 
begin 
if(MarketPosition <> 1 and buyOrSell = 1) then 
begin 
buy next bar at open; 
excursionVal = 99999999; 
value1 = excursionVal; 
end; 
if(MarketPosition <> -1 and buyOrSell = 2) then 
begin 
SellShort next bar at open; 
excursionVal = 99999999; 
value1 = excursionVal; 
end; 
end; 
if(MarketPosition = 1 and BarsSinceEntry > 0) then 
begin 
if(Low < EntryPrice) then 
begin 
value1 = Low—EntryPrice; excursionVal = MinList(value1,excursionVal); 
end; 
end; 
if(MarketPosition = -1 and BarsSinceEntry > 0) then 
begin 
if(High > EntryPrice) then begin
202 BUILDING WINNING TRADING SYSTEMS WITH TRADESTATION 
value1 = EntryPrice—High; excursionVal = MinList(value1,excursionVal); 
end; 
end; 
SetExitOnClose; 
if(LastBarOnChart) then 
begin 
if(buyOrSell = 1) then posString = "Long"; 
if(buyOrSell = 2) then posString = "Short"; 
print("********************************************"); 
print(Date:6:0,"Testing on entering a ",posString," after 
",barDelay*5," minute delay"); 
if(trdCount = 0) then trdCount = 1; 
print("On average the market goes against your position", 
totalExcursionVal/trdCount*BigPointValue); 
print("********************************************"); 
end; 
As you can see from the code, we relied on the Print Log to output the statistics of our analysis. We set up a batch process by varying the buyOrSell and barDelay input. We initially set the boundaries of the buyOrSell input to 1 and 2 with an increment of 1. The barDelay input boundaries were set to 0 and 24 with an increment of 3. Table 8.6 shows the results of our batch processing. 
When you initially view the Strategy Optimization report, it may be sorted by prof-itability. You can resort by clicking on any of the other column headings. Table 8.7 shows 
TABLE 8.6 Time of Day Batch Process Results 
buyOrSell barDelay Net Profit Gross Profit Gross Loss Total Trades % Profitable 
1 0 18175 4588050 −4569875 5037 52 1 3 12275 4469475 −4457200 5037 53 1 6 57725 4344300 −4286575 5037 53 1 9 143137.5 4228337.5 −4085200 5037 54 1 12 82737.5 4057600 −3974862.5 5037 53 1 15 88362.5 3929762.5 −3841400 5037 53 1 18 67350 3802962.5 −3735612.5 5037 53 1 21 139400 3735312.5 −3595912.5 5037 53 1 24 127312.5 3633737.5 −3506425 5037 53 2 0 −18175 4569875 −4588050 5037 47 2 3 −12275 4457200 −4469475 5037 46 2 6 −57725 4286575 −4344300 5037 46 2 9 −143137.5 4085200 −4228337.5 5037 46 2 12 −82737.5 3974862.5 −4057600 5037 46 2 15 −88362.5 3841400 −3929762.5 5037 46 2 18 −67350 3735612.5 −3802962.5 5037 46 2 21 −139400 3595912.5 −3735312.5 5037 46 2 24 −127312.5 3506425 −3633737.5 5037 46
TradeStation as a Research Tool 203 
TABLE 8.7 Maximum Excursion Printout 
*********************************************************** 1111221 Testing on entering a Long after 0.00 minute delay On average the market goes against your position -1845.55 *********************************************************** *********************************************************** 1111221 Testing on entering a Short after 0.00 minute delay On average the market goes against your position -1665.72 *********************************************************** *********************************************************** 1111221 Testing on entering a Long after 15.00 minute delay On average the market goes against your position -1810.19 *********************************************************** *********************************************************** 1111221 Testing on entering a Short after 15.00 minute delay On average the market goes against your position -1626.05 *********************************************************** *********************************************************** 1111221 Testing on entering a Long after 30.00 minute delay On average the market goes against your position -1739.62 *********************************************************** *********************************************************** 1111221 Testing on entering a Short after 30.00 minute delay On average the market goes against your position -1576.66 *********************************************************** *********************************************************** 1111221 Testing on entering a Long after 45.00 minute delay On average the market goes against your position -1655.10 *********************************************************** *********************************************************** 1111221 Testing on entering a Short after 45.00 minute delay On average the market goes against your position -1531.87 *********************************************************** *********************************************************** 1111221 Testing on entering a Long after 60.00 minute delay On average the market goes against your position -1609.74 *********************************************************** *********************************************************** 1111221 Testing on entering a Short after 60.00 minute delay On average the market goes against your position -1474.88 *********************************************************** *********************************************************** 1111221 Testing on entering a Long after 75.00 minute delay On average the market goes against your position -1560.56 *********************************************************** *********************************************************** 1111221 Testing on entering a Short after 75.00 minute delay On average the market goes against your position -1432.55 *********************************************************** 
(continued )
204 BUILDING WINNING TRADING SYSTEMS WITH TRADESTATION 
TABLE 8.7 (Continued) 
*********************************************************** 1111221 Testing on entering a Long after 90.00 minute delay On average the market goes against your position -1521.61 *********************************************************** *********************************************************** 1111221 Testing on entering a Short after 90.00 minute delay On average the market goes against your position -1388.79 *********************************************************** *********************************************************** 1111221 Testing on entering a Long after 105.00 minute delay On average the market goes against your position -1466.95 *********************************************************** *********************************************************** 1111221 Testing on entering a Short after 105.00 minute delay On average the market goes against your position -1366.35 *********************************************************** *********************************************************** 1111221 Testing on entering a Long after 120.00 minute delay On average the market goes against your position -1431.76 *********************************************************** *********************************************************** 1111221 Testing on entering a Short after 120.00 minute delay On average the market goes against your position -1333.84 *********************************************************** 
the contents of the Print Log. These results may be the first step that leads you down the road of enlightenment. You may be able to use this information as a foundation to build a viable trading strategy. If not, at least you may be able to use the programming in your own research project. 
Pattern Recognition 
Recognizing patterns in bar graphs can be simple with the human eye. The computer, on the other hand, has a much harder time. This is a case where the human mind can apply fuzzy logic and a computer program can’t. Fuzzy logic is logic that allows for imprecise and ambiguous answers to questions, and it is the basis for artificial intelligence. A double bottom pattern is simple to pick out from a chart, but try explaining the formation to someone who has never seen a bar chart without having a bar chart in front of him. You’ll discover that you must be very precise with your explanation because a computer is like a child who must be instructed. We would explain the double bottom pattern in the following manner: The market makes a significant low pivot and then trades above that point. Eventually, the market makes another significant low pivot in the general area of the first low pivot. The market then rebounds and moves up for an extended period of time. See Figures 8.1 and 8.2.
TradeStation as a Research Tool 205 
FIGURE 8.1 A Double Bottom in Microsoft 
Our explanation of a double bottom probably sounds reasonable. A person with some experience with bar charts would probably be able to visualize the pattern in his mind. The problem is, we aren’t describing a double bottom to a somewhat experienced technician. We need to describe it in terms that an inexperienced person or a dumb com-puter would understand. The following is a description a computer might understand: 
The market makes a new 20-day low and then forms a low pivot point. A low pivot point is a bar that has a lower low than the preceding and subsequent bar. The market then moves to a point that exceeds the highest high for the past five days and forms a 
FIGURE 8.2 A Double Bottom in a ShowMe Study
206 BUILDING WINNING TRADING SYSTEMS WITH TRADESTATION 
high pivot point. A high pivot point is a bar that has a higher high than the preceding and subsequent bars. The market then moves back down and forms a low pivot point within one 10-day average true range of the first pivot low. The second pivot low can be above or below the first pivot low. You calculate a 10-day average true range by summing up the past 10 days’ true ranges and dividing by 10. The pattern is complete once the market has moved three 10-day average true ranges above the second pivot low. The pattern search is canceled or reset if it is not completed within 30 trading days or the market makes a new 20-day low without first making an intervening 5-day high. 
See how precise our description has become? Precision is great for programming, but not so great for pattern recognition. We have restricted our instructions in such a manner that there will be many double bottoms that we will miss. Unfortunately, we are stuck between a rock and a hard place. Again, this illustrates how much a computer lacks in intelligence and follows the instructions it is given to a T. The following ShowMe code will pick out the pattern that we described. Hopefully, it will pick out something that looks similar to a double bottom. 
Vars: state(0),tenDayATR(0),barCount(0),firstLowPivot(0); 
Vars: secLowPivot(0),firstLowPivotPos(0),secLowPivotPos(0); 
tenDayATR = AvgTrueRange(10); 
if(state = 0 and Low[1] = Lowest(Low[1],20) and Low > Low[1]) then 
begin {initial state and we found a pivot low that is a 20-day low} 
state = 1; 
barCount = 0; 
firstLowPivot = Low[1]; 
firstLowPivotPos = barNumber; 
end; 
if(state = 1) then 
begin {we are now searching for an intervening 5-day high pivot} 
barCount = barCount + 1; 
if(barCount > 30) then state = 0; {pattern not completed within 30 
bars} 
if(High[1] = Highest(High[1],5) and High < High[1]) then 
begin 
state = 2; 
barCount = barCount—1; {subtract one bar—we will add one in 
state 2} 
end; 
if(Low < firstLowPivot) then state = 0; {start over—lower pivot found} 
end; 
if(state = 2) then 
begin {now searching for the subsequent low pivot point} 
barcount = barCount + 1; 
if(Low < firstLowPivot—tenDayATR) then state = 0; {too far below 
first pivot} 
if(barCount > 30) then state = 0; {pattern not completed within 30 bars} 
if(Low[2] > Low[1] and Low > Low[1] and 
(Low[1] < firstLowPivot + tenDayATR and
TradeStation as a Research Tool 207 
Low[1] > firstLowPivot—tenDayATR)) then 
Begin {2nd low pivot price must be close to 1st low pivot price} 
state = 3; 
secLowPivot = Low[1]; 
secLowPivotPos = barNumber; 
barCount = barCount—1; end; 
end; 
if(state = 3) then 
begin {wait for market to move up and away from 2nd pivot low} 
barCount = barCount + 1; 
if(barCount > 30) then state = 0; 
if(High > secLowPivot + 2*tenDayAtr) then state = 4; 
if(Low < secLowPivot) then state = 0; 
end; 
if(state = 4) then 
begin {final state—if we made it here then we succeeded} 
Plot1[BarNumber—firstLowPivotPos + 1](firstLowPivot,"DoubleBottom"); 
Plot2[BarNumber—secLowPivotPos + 1](secLowPivot,"DoubleBottom"); 
state = 0; {Job is done—start over} 
end; 
This code utilizes an abstract programming construct known as a finite state ma-chine. “What the $#%∧%$# is a finite state machine and what does it have to do with trading systems?” you are probably asking. A finite state machine (or automaton) is an abstract idea that can be used to pick predefined patterns out of a stream of data. These abstract machines sound complicated, but in actuality they are simple and easy to pro-gram; it’s just the name that scares most people. These “machines” consist of a finite number of different states. States are conditions that have been met (you’ll see when we explain the double bottom code). All finite state machines must have an initial and a final state. The initial state for our double bottom pattern is the search for a new 20-day low. The final state occurs when the market moves three 10-day average ranges above the second pivot low. In addition to different states, these machines must also have a process in which one moves from one state to another. 
Initially, we set the state variable to 0 (our initial state). We then start searching for a pivot low that forms a new 20-day low. Once we find this point, we store the price of the pivot low and the bar number (remember, the bar number is the sequential numbering of the bars in a chart). We also start counting the number of bars from this point and set our state variable to 1. We have now moved from state 0 to state 1; the first criterion of the double bottom search has been satisfied. Now we search for a bar that makes a new 5-day high and is a high pivot. If 30 bars elapse before we find a 5-day high pivot or we experience a lower price than the first pivot low, then we start over. This is accomplished by setting the state variable back to 0. If we do indeed find a 5-day high pivot within 30 bars, we then move on to state 2. State 2 is the search for a low pivot point that is close in price to the first pivot low. The two pivot points must be within one 10-day average
208 BUILDING WINNING TRADING SYSTEMS WITH TRADESTATION 
true range of each other. Notice how we control the search criteria by the state variable. Again, if 30 bars pass before we find the subsequent low pivot point, we bail out. Once we find an acceptable low pivot point, we store the pivot price and bar number, and we move on to state 3. In state 3, we look for a retracement from the low pivot point. The market must move 3 average true ranges up from the low pivot point to satisfy our criteria. Again, if all of this is not completed within 30 bars, the whole process starts all over. If we do satisfy this last criterion, we move on to state 4 (our final state). In state 4, we use the Plot statement to draw a dot below the two low pivot points that form the double bottom: 
Plot1[BarNumber—firstLowPivotPos](firstLowPivot,"DoubleBottom"); Plot2[BarNumber—secLowPivotPos](secLowPivot,"DoubleBottom"); 
Since there can be many bars between the pivot points, we keep track of the BarNumber of the pivot points so we can tell TradeStation where to draw the dot. Let’s say the first pivot low occurred on BarNumber 25 and the current BarNumber 
is 62. You can instruct TradeStation to draw on the correct bar by subtracting the Bar-
Number that you would like to “point out” from the current BarNumber. In the case of our example, we would instruct TradeStation to draw 37 bars back: Plot1[BarNumber 
– firstLowPivotPos]. Any complicated pattern can be found through the use of finite state machines. The success of your search is based solely on how precise you program the search criteria. We have seen some pattern recognition search engines with as many as 15 different states. With the example of our double bottom finite state machine, you should now understand how to determine different states or steps and the processes to bail out of a search and move from one state to another. 
Intermarket Analysis 
Have you ever noticed a correlation between two different markets? There have been many books written on this very subject. Our last research topic will discuss how to use EasyLanguage’s multidata capabilities to test an idea based on the relationship between the U.S. Treasury bond futures market and the S&P 500 futures market. These two mar-kets compete against each other for investor dollars. If the stock market is bearish, many times investors will transfer funds from equities into bonds. If the stock market heats up, then the money will flow from bonds into the equities market. The test that we will per-form will simply give you the basic tools to start your own intermarket research. This test will involve buying one S&P 500 futures contract at yesterday’s high when the 8-day [[Moving Average|moving average]] of closing prices in the bond market crosses below the 24-day [[Moving Average|moving average]]. One contract of the S&P 500 will be sold at yesterday’s low when the 8-day [[Moving Average|moving average]] of bond prices crosses above the 24-day [[Moving Average|moving average]]. Long positions are liquidated when the system enters a short position or the market penetrates a 10-day low. Short positions are liquidated when the system enters a long position or the market
TradeStation as a Research Tool 209 
TABLE 8.8 Intermarket Strategy Performance 
All Trades Long Trades Short Trades 
Total Net Profit $85,925.00 $65,587.50 $20,337.50 Gross Profit $393,850.00 $216,225.00 $177,625.00 Gross Loss ($307,925.00) ($150,637.50) ($157,287.50) Profit Factor 1.28 1.44 1.13 
Total Number of Trades 110 59 51 Percent Profitable 37.27% 45.76% 27.45% Winning Trades 41 27 14 Losing Trades 69 32 37 Even Trades 0 0 0 
Avg. Trade Net Profit $781.14 $1,111.65 $398.77 Avg. Winning Trade $9,606.10 $8,008.33 $12,687.50 Avg. Losing Trade ($4,462.68) ($4,707.42) ($4,251.01) Ratio Avg. Win:Avg. Loss 2.15 1.7 2.98 Largest Winning Trade $38,225.00 $36,425.00 $38,225.00 Largest Losing Trade ($20,575.00) ($18,375.00) ($20,575.00) 
Max. Consecutive Winning Trades 7 7 4 Max. Consecutive Losing Trades 8 5 16 
Return on Initial Capital 85.92% Annual Rate of Return 3.13% Buy and Hold Return 54.68% Return on Account 92.10% Avg. Monthly Return $779.27 Std. Deviation of Monthly Return $9,148.65 
Max. Draw Down (Intraday Peak to Valley) Value ($126,425.00) ($71,225.00) ($79,550.00) Date 4/22/2008 16:15 as % of Initial Capital 126.43% 71.23% 79.55% Net Profit as % of Draw Down 67.97% 92.08% 25.57% Select Net Profit as % of Draw Down 98.77% 117.88% 51.43% Adjusted Net Profit as % of Draw Down −10.01% −3.73% −66.62% 
Max. Draw Down (Trade Close to Trade Close) 
Value ($93,300.00) ($55,550.00) ($69,862.50) Date 4/15/2008 16:15 
Max. Trade Draw Down ($21,500.00) ($18,375.00) ($21,500.00) 
penetrates a 10-day high. Table 8.8 shows the performance of our intermarket trading system. 
{System buys the S&P when the eight day [[Moving Average|moving average]] of the U.S. Bonds 
crosses below the 24 day [[Moving Average|moving average]] of the U.S. Bonds. The opposite is 
true for the sell side.}
210 BUILDING WINNING TRADING SYSTEMS WITH TRADESTATION 
if(Average(Close of data2,8) crosses below Average(Close of data2,24)) then 
buy("SPbuyUSdn") next bar at High stop; 
if(Average(Close of data2,8) crosses above Average(Close of data2,24)) then 
sellShort("SPsellUSdn") next bar at Low stop; 
if(MarketPosition = 1) then sell next bar at lowest(low,10) stop; 
if(MarketPosition =-1) then buyToCover next bar at highest(high,10) stop; 
CONCLUSIONS 
The research capabilities of EasyLanguage and TradeStation were discussed as well as the usage of external data, day of week and time of day analysis, pattern recognition, and intermarket analysis. We can use TradeStation’s optimization tool to perform batch processing. With TradeStation and its huge library of data and the concepts that we dis-cussed in this chapter, the ideas that you can research are unlimited. All good trading systems start out as well-researched ideas. 
This ends our instruction on programming EasyLanguage. We hope the ideas and programming techniques that we presented will be of great use to you. You will soon dis-cover that the development and discovery of good, sound market principles will be much more difficult than programming them. The rest of the book is dedicated to the utiliza-tion of percent change charts, a beginner’s guide to options, and interviews with some of today’s leading system traders and vendors. Good luck and good system development!
C H A P T E R  9 
Using TradeStation’s Percent Change Charts to Track 
Relative Performance∗ 
We ran into Jan Arps, and because of his knowledge and experience with TradeSta-tion products, asked if he would like to contribute to our book. He accepted our offer and wrote an interesting chapter on selecting markets through the use of TradeStation’s Percentage Change charts. 
T echnical analysis generally consists of two parts: selection and timing. Selection 
is the process of deciding which stock, mutual fund, option or futures contract, among the thousands available to you, to trade at any particular point in time. 
Timing, on the other hand, is the process of determining when to enter and exit a trade once you have selected a suitable tradeable. 
There are numerous methods, both fundamental and technical, that can help in the selection process. One of the selection questions many traders ask is, “How has this stock performed relative to alternative choices recently, and which is likely to be the strongest in the upcoming time frame?” In order to answer this question, we must be able to provide a level playing field for comparing tradeables whose various prices could range from a dollar to hundreds of dollars. 
For example, let’s say you are comparing a $10 stock with a $100 stock. Since the beginning of the quarter, both of these stocks have gone up exactly $10. If you plot these stocks on the same standard price chart with a linear price scale, the charts of the two stocks will show an identical increase for the quarter. In fact, however, the $10 stock has doubled in price, while the $100 stock has increased by only 10 percent. 
∗Jan Arps, president of Jan Arps’ Traders’ Toolbox, is one of the leading authorities on TradeSta-tion today. He has been trading and developing trading tools since 1952. Jan and his catalog of 400 TradeStation add-ins can be found at www.janarps.com. 
211
212 BUILDING WINNING TRADING SYSTEMS WITH TRADESTATION 
What we really need is a “normalized” way to display the behavior of multiple trade-ables on the same chart so that we can compare their percentage change behavior over a specific time period. TradeStation’s Percent Change chart feature gives you the ability to plot the change in price of any number of tradeables on the same chart, as a percentage of their price beginning at a specified starting date. 
All Percent Change charts require that you specify an anchor bar. This is the bar from which all percent change calculations are made. The anchor bar can be the first bar of the chart, the last bar of the chart, or any bar that you may select between the first and last bars. Once an anchor bar has been selected, a percent change value is calculated by TradeStation for each bar on the chart by subtracting the average price of each bar from the closing price of the anchor bar and dividing this value by the closing price of the anchor bar. 
For example, if the price of a stock at the anchor bar was $100 and the price 10 days ago was $90, then the relative price on the percent change chart for the bar 10 days before the anchor bar will be displayed as −10%. If the price 30 days after the anchor bar is $125, then the percent change chart will display +25% on that bar. 
The procedure for creating a Percent Change chart in TradeStation is: 
1. Right-click anywhere on a price chart, or click on Format in the menu bar. 
2. Click on Percent Change Chart. 
3. Click on Enable. 
4. Select your anchor bar by clicking on either Calculate from first bar, Calculate from 
last bar, or Calculate from this bar. 
5. To select your anchor bar when using Calculate from this bar, place the cursor on the selected anchor bar on your chart, right click, and select Calculate from this 
bar. The chart will then show the price intersecting the zero line at your selected anchor bar. All other prices before and after the anchor bar will be displayed as the percentage change in price relative to the anchor bar. 
6. To display a vertical line showing the location of the anchor bar on your chart, click on Format Window and click on the box labeled, Show Calculation Point Marker. 
When you look at a collection of stocks on a Percent Change chart, it tends to move up and down more or less together, responding to overall market fluctuations. However, stocks with increasing strength will begin pulling out of the pack and you will see these stronger stocks crossing above the less-strong stocks. Conversely, weakening stocks will begin crossing below the lines of stronger stocks. This is one of the main characteristics we look for on a Percent Change chart. As buyers, we are looking for stocks pulling out of the pack. As sellers, we are looking for weakening stocks dropping down through the pack. 
It’s sort of like a horse race, with horses moving up and falling back within the pack as the race progresses. The difference between selecting a winning horse in a horse race and selecting a winning stock, however, is that you can’t change your bet in the middle
Using TradeStation’s Percent Change Charts to Track Relative Performance 213 
of a horse race. In the stock market there is no finish line, and you can switch from a struggling stock to a stronger stock as often as you want, at any time in the “race.” 
WORKING WITH PERCENT CHANGE CHARTS 
So how do we use Percent Change charts to identify fast-moving stocks? As an example, let’s suppose we have chosen four different companies to follow: 
1. Amalgamated Aquanautics Corp. 
2. Better Biscuits, Inc. 
3. Cheerful Car Rental Corp. 
4. Destiny Drugs & Chemicals, Inc. 
Figure 9.1 shows a chart of each of these four companies, plotted in the same window with the same linear price scale. 
Figure 9.2 shows a Percent Change chart of these same four companies from De-cember 2000 to June 2001. This chart has been created using January 1, 2001, as the anchor bar. We see from this chart that by June, stock 1, Amalgamated Aquanautics, was up over 200 percent over the period; stock 2, Better Biscuits, was essentially flat for the year; stock 3, Cheerful Car Rental, was down 36 percent; and stock 4, Destiny Drugs, was down 56 percent. 
We can conclude from examining the chart in Figure 9.2 that we would have achieved the greatest return between January and June 2001 had we bought Amalgamated 
FIGURE 9.1 Four Stocks Plotted on Same Price Scale
214 BUILDING WINNING TRADING SYSTEMS WITH TRADESTATION 
FIGURE 9.2 Four Stocks Plotted on a Percent Change Chart 
Aquanautics on January 1. But the question we really want an answer to is, “How would we have known to choose Amalgamated back in January?” 
A momentum trader will say, “Choose the strongest stock and go with it until it is surpassed by one of the others. The power of the Percent Change chart is its ability to display the relative change in prices of a number of stocks through a given time period. During the time shown in the chart in Figure 9.2, the stocks changed places a number of times in their relative rate of change. Although Amalgamated Aquanautics ended up having the greatest percentage increase in value since January, it had its biggest upward move between March and May. Examining the chart more closely, we see that Cheerful Car Rental initially was quite strong as well, but by mid-February it was dropping down through the pack. 
Figure 9.3 is the same chart as Figure 9.2, but with the anchor bar set at the end of the chart, on June 2001. Notice how different the two charts look. You see that the strongest stock, Amalgamated Aquanautics, rose from below zero to the zero line in Figure 9.3, while the weakest stock, Destiny Drugs, dropped down from above the zero line. This is an important fact about Percent Change charts. The strongest stocks prior to the anchor bar will appear to be rising from the bottom, while the weakest stocks will appear to be falling from the top. You need to recognize this characteristic when using Percent Change charts using past history to identify a strongly advancing or declining stock. 
Let’s follow the progress of our four stocks month by month during the six-month sample period, moving our anchor bar forward one month at a time so that we can see what the chart looks like to an observer at the end of each month. The anchor bar is at February 1 in Figure 9.4. We see that between January 1 and February 1, Amalgamated
Using TradeStation’s Percent Change Charts to Track Relative Performance 215 
FIGURE 9.3 Chart of Four Companies with an Anchor Bar 
Aquanautics has begun to move up sharply, Cheerful Car Rental has also moved up, while Better Biscuits has remained relatively steady, and Destiny Drugs is weakening. Amalga-mated Aquanautics is clearly the strongest stock at this point, and should be our prime buying candidate. 
In Figure 9.5, the anchor bar has been moved to March 1. During the month of Febru-ary, Cheerful Car Rental has continued its downward trend, along with Better Biscuits. 
FIGURE 9.4 Anchor Bar Moved to February 1
216 BUILDING WINNING TRADING SYSTEMS WITH TRADESTATION 
FIGURE 9.5 Anchor Bar Moved to March 1 
Destiny Drugs rose marginally and Amalgamated Aquanautics experienced a [[Pullback|pullback]] from its strong showing in January. At this point no new leader has emerged from the pack that would encourage us to change our pick from Amalgamated. 
In Figure 9.6, the anchor bar has moved to April 1. During the month of March, Amal-gamated is once more moving up from below, Destiny and Cheerful continue to weaken, and Better Biscuits is holding its own. Conclusion: Stick with Amalgamated. 
FIGURE 9.6 Anchor Bar Moved to April 1
Using TradeStation’s Percent Change Charts to Track Relative Performance 217 
FIGURE 9.7 Anchor Bar Moved to May 1 
In Figure 9.7, the anchor bar has moved to May 1. During the month of April, all four of our stocks rose. Amalgamated continued to be the strongest. Cheerful made a dramatic reversal, more than Amalgamated. Better Biscuits improved significantly, and Destiny moved up marginally. At this point, we are beginning to see a change in leader-ship. With Cheerful coming up through the pack past Amalgamated, we should consider adding Cheerful to our portfolio. 
Looking back at June 1 in Figure 9.2, Amalgamated Aquanautics turned out to have been an excellent pick in February, having grown by almost 200 percent between Febru-ary and June. 
CONCLUSIONS 
Percent Change charts are a useful tool in providing a level playing field for comparing the performance of a group of stocks or commodities in order to select the most likely prospect for future growth.
C H A P T E R 1 0 
Options: Introduction and Strategies 
W e wanted to include a chapter on options because they are yet another weapon 
that can be included in one’s trading arsenal. Options are confusing to most 
traders and, therefore, are overlooked. In Part A of this chapter, professional 
programmer Len Yates clears up the confusion and introduces several options strate-
gies. Coauthor John Hill follows up in Part B and reveals some of his real-life options 
strategies and trades. The ideas that are presented here can be used with most options 
analysis software. 
PART A: GETTING STARTED WITH OPTIONS TRADING 
By Len Yates 
Being from the Chicago area, host to some of the world’s largest options exchanges, I know or encounter many people whose work is related to options trading. So I have the advantage of being surrounded by plenty of locals who are familiar with options and how they work. Still, there are likely even more people unfamiliar with options. 
During the course of many social engagements, I invariably end up leading a discus-sion on options and what options are. Without even finishing my standard overview, I am invariably met with a response such as, “Well, that sounds too complicated for me,” from a befuddled listener. This usually leads me to the snack table because I don’t want to make any party listen to what might be to them an arcane subject. 
But what I want to say, and sometimes do, is that options are not really that com-plicated if you’re committed to learning the terminology and the basic principles of the 
219
220 BUILDING WINNING TRADING SYSTEMS WITH TRADESTATION 
game. I like comparing options to chess: If you spend an hour learning the rules, you may find you like the game and can win at it, too. 
Of course, practice is key to becoming successful. Options have a number of strate-gies with which you need to be familiar but hardly as many as in chess! However, anyone with average intelligence can learn all about options in a relatively short span of time. 
As most brokerage firms allow you to trade stocks, they also allow you to trade stock or index options, and it’s pretty easy to set up an account and start trading. Also, almost every brokerage firm that allows you to trade futures also allows you to trade futures-based options. Establishing an options trading account requires a little extra paperwork, including a statement that you have read and you understand the options prospectus and are prepared to assume the risks involved. 
As you progress in your education, you’ll start to understand that the unique qualities of options make them fascinating to trade. They can be used in a number of strategies, in-cluding using two, three, or more options in combination, and using one or more options in conjunction with a position in the underlying to deliver risk/reward characteristics that cannot be matched by simply buying or selling the underlying. 
Options trading, though, is not for everyone. There are some conservative options trading strategies, and there are some risky strategies as well, where your capital can be lost very quickly. It is up to you, after learning as much as you can before making a single options trade, to decide if you have the right temperament for it. 
Options Basics 
Basic options principles start with understanding the agreement between the buyer and seller. Let’s suppose you agree to sell your car to another party. As part of your agree-ment, you and the other party have agreed on a sale price of the car and a time for it to be delivered to the buyer. This type of agreement is called a forward contract. Now, if you only agree to let someone retain the right to buy the car from you for a stated price and only for a limited time, you have sold an option. Therefore, the holder of the option possesses the right, but not an obligation, to buy something at a stated price for a limited time. So the party who sold the option is obligated to deliver the car if the option holder decides to exercise his right, or his option, to purchase the automobile. 
Any asset designated to be delivered in such an agreement (the car in this example) is called the underlying asset, or the underlying for short. The price both parties agreed to for buying and selling the car is called the strike price of the option. 
Let’s say my car, an antique collectible, is worth $100,000. I could agree to let some-one have an option to buy the auto from me for, say, exactly $100,000 anytime during the next two years. The option’s strike price is therefore $100,000, and the underlying is the car itself. Now, why would I enter into such an agreement? After all, if the car appreci-ates over the next two years, that appreciation would be lost to me because I have agreed to sell the car for $100,000. Furthermore, I am locked into owning the car, and may not sell it to anyone else for the next two years—because if the option holder decides to
Options: Introduction and Strategies 221 
exercise his right, I am obligated to deliver the car. So, why should I put myself in such a constrained position? 
First, for the money I receive. An option has value and won’t be granted without some form of payment. For this particular option, I may require $15,000. The $15,000 (should the buyer agree to purchase the option at this price) would be mine to keep regardless of whether the option holder later decides to exercise his right to purchase the car. 
Second, I may be unwilling or unable to sell the car at this time. I might be happy to receive the $15,000, especially if I believe that the car will not appreciate $15,000 over the next two years. If the car appreciates less than $15,000, I’m better off for having sold the option. If the car appreciates exactly $15,000 during the next two years, there’s no net gain as I end up with the same amount as if I had not sold the option. And if the car appreciates more than $15,000, then I may regret having sold the option. 
Why might someone want to buy an option in the first place? For starters, lever-age. For only $15,000, the option buyer can have control over a $100,000 asset. Without incurring the hassle of ownership, he has the right to own the car anytime simply by sub-mitting an exercise notice and paying the agreed $100,000. Suppose, during the next two years, he changes hobbies, and no longer collects cars, but beer cans instead. He now has greater flexibility of getting out of the deal because, in fact, he never got in; he never bought the car. 
He simply lets his option expire. Also, he may believe that the car will appreciate more than $15,000 during the next couple of years, presenting the possibility of simply exercising his option and then selling the car for more than $115,000. 
Another reason to buy an option, rather than the asset itself, is the limited risk. Col-lectibles don’t often drop in price, and if the value of his car, for whatever reason, were to fall below $100,000, the option holder is not likely to exercise. (Why should he pay $100,000 for something that could be bought, on the open market, for less than $100,000?) And if the value of the car were to fall to less than $85,000, the option buyer would be happy that his loss is limited to the $15,000 he paid for the option, rather than having bought the car and now seeing a loss of more than $15,000. 
Does an option have to have a strike price precisely equal to the car’s current fair value? Of course not. I might rather have written (sold) my option at a strike price of, say, $110,000—$10,000 above the current fair value. Such an option wouldn’t be worth as much, however, and I probably would not be able to get $15,000 for it. When an option’s strike price is above the underlying asset’s current market value, the option is said to be out of the money (discussed later). I might prefer selling an out-of-the-money option because it gives my asset room to appreciate. 
Does this option have to end either by exercising it or by letting it expire? No, there is a third possible outcome. If the two parties are willing, and can agree on a price, the option seller may buy back his option, effectively canceling it out. Tables 10.1 and 10.2 summarize the transaction and terms involved. 
When an option is transacted, the buyer (holder) pays the seller (writer) the agreed amount (premium) for the option. This premium is the writer’s to keep, no matter what.
222 BUILDING WINNING TRADING SYSTEMS WITH TRADESTATION 
TABLE 10.1 An Option Is Exercised 
If the option holder exercises, he/she: If the option writer is assigned, he/she: 
Pays for the asset. Receives payment for the asset. Receives the asset. Must deliver the asset. 
Listed Options 
In our example, an option was transacted between two individuals. Its strike price (price of the asset), premium (cost of the option), and duration (expiration date) were created by agreement and negotiated by the two parties to meet both of their needs. In contrast, there are the listed options traded on the public exchanges on many stocks, indexes, bond futures, commodity futures, and currency futures. There are even listed options on interest rates, inflation rates, and the weather. 
These listed options have standardized features that appeal to a large group of traders and help to build a liquid market. For starters, several strike prices are usually available at regular price intervals. And several different durations (expiration dates), following a set pattern, are usually available. In stocks, for example, one set of options expires in 30 days or less, another set expires in approximately 31 to 60 days, another set in approximately 3 to 6 months, and so on, going out as far as 2 years or more. 
Each listed option is also for the same quantity of the underlying asset. In stocks, one option is based on 100 shares of the underlying stock. In futures, one option is based on one futures contract. 
As the markets are constantly moving, options prices are continuously quoted and changing. This is possible because market makers at the options exchanges are always publicly posting prices at which they are willing to buy and sell (bid and asked prices). They stand ready to take the other side of your trade, and thus make a market in the options they are responsible for. So an option holder may sell his option(s) at any time, and an option writer may buy (to close his option position) at any time. 
If an option holder exercises his option, the Options Clearing Corporation assigns 
any party holding a short position on a random, arbitrary basis. So an option buyer never finds out, nor should he care, who sold the option to him. And the option seller never finds out, nor does he care, who bought the option from him. 
In our car example, it is possible, even likely, that the option holder will exercise his option prior to expiration. It’s more of a direct personal agreement. In contrast, the vast 
TABLE 10.2 An Option Expires 
If the option holder lets the option expire, the option holder: The option writer gets to: 
Does nothing. Keep his asset. Loses premium paid. Keeps premium paid.
Options: Introduction and Strategies 223 
majority of listed option buyers never exercise; they simply sell their options on the open market. Many of these people are speculators who expect to hold their option for only a short time. Once the underlying makes a move in the expected direction (or perhaps a move in the wrong direction), they sell. In a sense, up to expiration day, options are like hot potatoes being tossed around among the market of speculators. Such activity accounts for quite a bit of the options trading volume but not all of it. Another major source of trading volume is institutional investors. They may use options to hedge large positions, or simply trade large positions for speculation. 
Until now we have talked only about options to buy. Options to buy something at a stated price for a limited time are call options. But there is another type of option—an option to sell something. While these options can be a bit more difficult to conceptualize, options to sell something at a stated price for a limited time are known as put options. 
Nomenclature and Terminology An option is specified by stating its underlying asset, the expiration month, the strike price, and the type (call or put), usually in that order. For example: 
IBM July 120 calls 
This would usually refer to options expiring in July of the present year. If the options expire more than a year out from the present day, one might need to include a year indication of some kind, for example (with “03” meaning the year 2003): 
IBM July03 20 calls 
Also important is the manner in which options prices are converted into dollar amounts. Most stock and index options have a multiplier of 100, meaning that one op-tion is for 100 shares of stock. So, if you were to buy one option at a price of 1.10, for example, you would pay $110. Multipliers for futures-based options vary from 50 to 500. 
Long and Short Most investors understand the concept of being long, whether they realize it or not. When you own something you are said to have a long position in it. As such, when you are long the market, you are taking a position to profit in a rising market. 
Going short means to sell something, without first owning it, to profit from a falling market. How can you sell something you don’t own? In securities trading, going short involves borrowing the securities (usually from your broker) to sell. When you move to close the position at a later date, you buy back the securities, giving the shares back to your broker. With futures and options, it’s even easier. You’re entering into an agreement that comes complete with standard contractual rights and obligations. The only differ-ence is that futures and options afford you the opportunity to get out of the contract at any time by placing a buy or sell order that cancels your position before the obligations come due.
224 BUILDING WINNING TRADING SYSTEMS WITH TRADESTATION 
TABLE 10.3 The Four Possible Scenarios of Buying/Writing Calls/Puts 
Position Exposure 
Long calls Long the underlying Short calls Short the underlying Long puts Short the underlying Short puts Long the underlying 
Being long or short an option does become more complex because of the two types of options: calls and puts. When you buy an option, regardless of whether it’s a call or put, you are long the option. When you buy a call option, because you stand to benefit from the underlying going up, your position can be considered to be, in a general sense, long the underlying as well. However, when you buy a put option, because you stand to benefit from the underlying going down, you can be considered to be, in a general sense, short the underlying. Table 10.3 summarizes the four possible scenarios. 
It is important that the options trader be familiar with the following terms and con-cepts. Note that our examples refer to stock options. However, the same terms and con-cepts apply to all asset types. 
The value of an option is comprised of two components—intrinsic value and time 
value. As these two components are never quoted separately, all you see is the total price of the option. Nevertheless, understanding these two values and how they impact an option’s total value is important. 
To draw an analogy, the value of a company can be said to consist of (1) book value, plus (2) all the rest. Book value, meaning the company’s value if one were to break it up and sell all of its assets, is similar to an option’s intrinsic value. All the rest, including intangible assets and earnings potential, is like an option’s time value. 
Intrinsic value is what you could gain by exercising the option and immediately clos-ing your new position in the underlying. For example, say the price of AOL is 30 and you hold a 25 call. You know that if you were to exercise your option, you’d pay 25 a share for the stock. After selling it on the market for 30, you’d realize a profit of 5 per share on the stock itself. Thus, the intrinsic value of the option is 5. Intrinsic value can also be considered the money component of the option’s value. For instance, an option is said to be in the money when it possesses some intrinsic value. Call options are in the money when their strike price is below the current price of the underlying (as in the example above). It’s the reverse for put options, which are in the money when their strike price is above the current price of the underlying. 
When an option’s strike price is equal to (in practice, very close to, as the market is constantly changing) the price of the underlying, it is said to be at the money. 
Call options are said to be out of the money when their strike price is above the current price of the underlying. Put options are out of the money when their strike is below the current price of the underlying.
Options: Introduction and Strategies 225 
Time value, the other component that comprises an option’s value, accounts for the potential of the underlying to move in the option’s favor (up for calls; down for puts) during the remaining life of the option. Of course, it’s just as possible for the stock to move against the option. However, if the stock moves the wrong way, an option’s value can drop, at most, to zero. On the other hand, if the stock moves in the direction of your position, the option’s value can theoretically go up without limit. And that’s why options almost always retain some time value up to expiration. 
Time value is the summary of all the possible intrinsic values the option might have at all of the possible underlying prices, on or before expiration, taking into consideration the probabilities of the stock reaching each of those prices. As you may imagine, time value can be a challenge to estimate in your head or on paper. For that reason, options traders refer to mathematical models, implemented in computer programs, to compute the fair value of an option. 
In the previous AOL example, we showed how an in-the-money option could be ex-ercised to get into a stock position at below-market price. Now, when would it make sense to exercise an out-of-the-money option? Never. To exercise an out-of-the-money call would be to pay more than the current market price for a stock. To exercise an out-of-the-money put would be to sell a stock for less than the current market price of the stock. Unless you like throwing money away, it never makes sense to exercise an out-of-the-money option. 
In fact, it rarely makes sense to exercise an in-the-money option either. Why? Be-cause you’d be throwing away its time value. Let’s go back to the AOL example. You have a 25 call and the stock is currently at 30. Your call, if it has more than a few days of life left, is probably worth something more than 5, say 6.5 (this would be an intrinsic value of 5 plus a time value of 1.5). If you exercise the option and then sell the stock, as before, you gain $500 on the stock transaction. However, your option was worth $650. So, you just lost $150—the option’s time value. It would be better to sell your option on one of the options exchanges. You would receive the full value of your option of $650, and you would need to perform (and pay for) only one option transaction versus two transactions the other way. 
Here’s a little pop quiz to see if you have grasped the concepts we have been discussing. 
 A stock is at 65. A 70 call on this stock has a price of 1.85. Is this option in the money, at the money, or out of the money? What is this option’s intrinsic value? What is this option’s time value? 
 Answer: The option is out of the money, has an intrinsic value of zero, and a time value of 1.85. 
 A stock is at 80. A 70 call on this stock has a price of 11.60. Is this option in the money, at the money, or out of the money? What is this option’s intrinsic value? What is this option’s time value?
226 BUILDING WINNING TRADING SYSTEMS WITH TRADESTATION 
 Answer: The option is in-the-money, has an intrinsic value of 10, and a time value of 1.60. 
 A stock is at 40. A 45 put on this stock has a price of 6.30. Is this option in the money, at the money, or out of the money? What is this option’s intrinsic value? What is this option’s time value? 
 Answer: The option is in the money, has an intrinsic value of 5, and a time value of 1.30. 
 A stock is at 55. A 55 call on this stock has a price of 3.40. Is this option in the money, at the money, or out of the money? What is this option’s intrinsic value? What is this option’s time value? 
 Answer: The option is at the money, has an intrinsic value of zero, and a time value of 3.40. 
 One further question: In the second question, do you think this option could trade below 10 (its intrinsic value)? 
 Answer: Absolutely. In an open market, anything could happen. However, from a practical point of view, it would not trade for much less than 10. Traders are con-stantly prowling the options markets for bargains. When they see an undervalued option, they buy it in an instant. So, if you were to offer this option for sale at 9.8, someone would quickly buy it because he knows he can immediately exercise it and sell the stock, realizing a 0.2 profit. 
Remember, even if an option’s time value has dropped to zero, it still retains its intrinsic value. You should be able to sell it for that, or perhaps just a bit less. This is said to be trading at parity. 
Previously, I pointed out that many options are never exercised. It does not make sense to exercise an option that has any appreciable time value; you would be throwing away money. However, when an option’s time value is zero or nearly zero, option holders are likely to exercise. Conversely, if you sell (short) an option with zero or nearly zero time value, you are apt to be assigned—and it can happen that very day. Early assignment may or may not be a significant danger to you. It depends on the nature of the position you would be left holding. 
Closing Options Trades The best way to close an option position prior to expiration is to execute an opposing transaction in the market. This is true whether you are holding puts and calls, and whether you are long or short. If you previously bought a call, the only way to close your position is to sell the same call. Some may think buying a put will do, but it will not. Also, selling another call on the same underlying does not do it. In fact, such trades might reduce your risk, but they would only build (and complicate) your original position. 
The two alternatives to closing a position with an opposing transaction is to let the option expire or to exercise it. If your option remains out of the money at expiration, it has no value and should be allowed to expire. However, if the option is in-the-money at expiration, it has value and should be exercised.
Options: Introduction and Strategies 227 
When you exercise a stock option, you pay for and receive shares of stock. When you exercise a futures option, you are immediately in a futures position and no cash changes hands. When you exercise an index option, you simply receive the intrinsic value as a cash settlement. There is no delivery besides cash, as exercising index options does not create a new position in another security. If you have an index option that is 3.00 in the money at expiration, $300 is credited to your account. 
The option holder isn’t always required to submit an exercise notice. For example, exercise is automatic for some instruments when the option is a certain amount in the money. It is important to understand what will happen if you do nothing with an in-the-money option at expiration. Confer with your broker if you are unsure. It doesn’t hurt to submit an exercise notice, as you never want to let a valuable option disappear! 
American versus European Options Options can also be classified in terms of style, which relates to the two ways in which they can be exercised. If an option can be exercised any time up until expiration, it is said to be American style. If an option can be exercised only on expiration day, it is said to be European style. 
These references are not concerned with the continent on which the options trade. American- and European-style options trade in America, Europe, and elsewhere around the globe. For instance, in the United States all stock options and over half of the in-dex options are American style (the remaining are European style). Some futures-based options are American style and others are European style. 
An option buyer intending to exercise must understand which style he is purchas-ing. An option seller might prefer European style options, because he might not want to be concerned about assignment before expiration. For the options buyer who has no intention of exercising, the only difference is that American-style options are a bit more valuable—and a quality options pricing model will bear this out. 
The Special Properties of Options Options possess unique properties that make them special trading vehicles. For starters, unlike stocks and futures, their performance is nonlinear. Every point a stock or a futures contract moves results in the same amount gained or lost. Their performance graph is a straight line. Figure 10.1 illustrates this point. 
In contrast, an option’s performance graph curves upward. This nonlinear shape means that as the underlying moves in favor of the option, the option makes money faster. If the underlying moves against the option, the option loses money slower. (In Fig-ure 10.2, focus on the dotted line, which represents today’s performance of the option.) 
The real-world implication of this upward performance line curve is that an option’s value can go up without limit but can drop only to zero. It is this unlimited profit/limited risk profile that makes options an attractive trading instrument for buyers. 
The only major detractor is a little element called “time decay.” As time passes, all other parameters being equal (i.e., the underlying price has not changed), an option’s value falls. In our diagram, the dashed line represents the theoretical value of this call option 64 days from now (halfway to expiration), while the solid line represents the theoretical value of the option at expiration. The diagram clearly shows that if the stock
228 BUILDING WINNING TRADING SYSTEMS WITH TRADESTATION 
FIGURE 10.1 The Linear Performance of a Stock or Future 
fails to move above 30 (the strike price of this option), the value of this option will fall gradually and inevitably to zero. 
Many options traders put this time decay property in their favor by selling op-tions (rather than buying). Having time working in your favor can be beneficial, but it can convey a false sense of security; time is what gives the underlying a chance to move—potentially against the option seller’s position. 
FIGURE 10.2 The Nonlinear Performance of an Option
Options: Introduction and Strategies 229 
Consequently, there is a trade-off (or risk) for both sides. The option buyer has the nonlinear performance line of an option in his favor, but time works against him. The option seller has time on his side, but the option’s nonlinear performance line works against him. To limit damage due to time decay, the option buyer may choose to hold his position for only a short time. Likewise, the option seller, to limit the damage from an adverse price movement, may decide to use a stop. 
Volatility Trading The other unique property options possess is sensitivity to volatil-ity. Options on more volatile assets (those that experience greater fluctuation in price and trading volume), all else being equal, are more expensive. Options on less volatile assets are cheaper. And the difference between the two can be significant. Even options on the same underlying asset, during a period when the asset’s price is perceived by the market to be volatile, can trade at twice the price they do during quieter periods. 
Volatility, then, gives options an extra dimension on which they can be traded. Not only can they be traded based on expected price moves in the underlying (called di-
rectional trading), but they may also be traded based on expected swings in volatility levels—buying options when volatility is low and the options are cheap, selling options when volatility is high and the options are expensive. Such trading is called volatility-
based trading. 
Options and Changing Conditions It is essential to know how options respond to changing conditions. As we’ve learned, options can move in three dimensions: (1) price, as options respond to changes in the price of their underlying; (2) volatility, as options respond to changes in the perceived volatility of their underlying; and (3) time, as an option’s value decays over time, all else being constant. 
The initial two dimensions are tradable. Price and volatility fluctuate, giving traders the opportunity to bet on their future direction. But time is different; it marches in only one direction: forward. So, while a trader may put time on his side by selling options, time’s basic value cannot be treated the same as the dimensions of price and volatility. 
With changes in the underlying price or interest rates, the values of calls and puts move in opposite directions. For instance, when the underlying price rises, calls go up and puts go down. Volatility and time cause calls and puts to rise and fall in tandem. When the underlying becomes more volatile, both the calls and the puts go up in value. With the passing of time, both calls and puts decline in value. Table 10.4 summarizes how conditions affect option value. 
The overall effect of interest rate changes on an option is very small. The effect of time decay is gradual, with some acceleration as expiration approaches. 
The Greeks Options traders use several parameters, named the “greeks” after Greek letters, to determine how sensitive an option is to changing conditions. 
The first, delta, measures how much an option’s price moves in response to a one-point increase in the price of the underlying. For example, if an option moves up 0.5
230 BUILDING WINNING TRADING SYSTEMS WITH TRADESTATION 
TABLE 10.4 How Different Conditions Affect the Value of an Option 
Call Options Put Options 
Underlying price goes up Go up Go down Underlying price goes down Go down Go up Volatility goes up Go up Go up Volatility goes down Go down Go down Time passes Go down Go down Interest rates increase Go up Go down Interest rates decrease Go down Go up 
when its underlying moves up 1.0, the option’s delta is said to be 50. This means you would theoretically gain $50 per option contract. 
Since calls and puts move in opposing directions when the underlying price changes, calls always have positive deltas, and puts always have negative deltas. Call options have deltas that range from 0 to 100. Put options have deltas ranging from 0 to –100. At-the-money calls typically have a delta close to 50, while at-the-money puts typically have a delta close to –50. 
Another greek, vega, measures how much the price of an option changes in response to a one-point increase in volatility. For example, if an option has a vega of 29, and volatil-ity increases from 22 percent to 23 percent, the option’s price will increase by 0.29, and its value by $29. As volatility can never be less than zero, all options have positive vega. 
Theta measures how much the price of an option should drop today just due to the passage of time. For example, if an option has a theta of –4, its price should fall 0.04, and its value by $4, by the end of the day. As theta deals exclusively with negative movement, all options have negative theta. 
Rho measures how much the price of an option should change (+ for calls and – for puts) in response to a one-point increase in interest rates. For example, if a call option should increase 0.02 when interest rates go up one point, the option’s rho is said to be 2. 
The greeks are theoretical because they measure how an option should respond to changing conditions. The mathematical models used to calculate options’ fair values also produce the greeks as by-products. That’s important because as an option’s fair value constantly changes in response to changing inputs, the greeks also change in a corre-sponding manner. In fact, there is another greek, gamma, that’s just for measuring how fast delta changes! 
Sophisticated options traders use the greeks to determine their risk, as the greeks reveal the exposure of their current position. Greeks become even more valuable the more complicated the position gets. Market makers, for instance, often hold positions (long and short) in many different options on a particular asset. By knowing the net greeks of their combined position (computed by totaling the greeks of each option po-sition they hold, multiplied by the number of contracts they have in each option), they can determine their net risk, and make adjustments if necessary. For example, if they see that their net delta is a negative 514, they may buy 500 shares of stock to change
Options: Introduction and Strategies 231 
their net delta to a negative 14—reasonably close to zero, or delta-neutral. A delta of zero means their total position value will remain unchanged even when the price of the underlying changes. 
Who Are Market Makers? Individual investors seldom trade with one another. More often, though never knowing it, they trade with market makers. Market makers are bound by agreement with the exchanges to post bid and asked prices, and to trade with inter-ested buyers and sellers at the posted prices. By doing so, they are making a market. 
An individual market maker is usually assigned to one or more underlying issues, and each underlying issue has one or more (typically more) market makers assigned to it. When multiple market makers are assigned to an underlying, they are in competition with one another. This competition can be cutthroat or friendly, like a cartel. 
Market makers must trade with parties interested in buying and selling at the stated bid and asked prices, but they are not required to trade an unlimited number of contracts. The exchanges require them to trade only up to 10 contracts at a time. If an investor wants to trade more than 10, he may get the stated price for the initial contracts but may have to pay a bit more (if buying) or receive a bit less (if selling) for further contracts. 
While ten is the minimum requirement, the most heavily traded options markets have hundreds, even thousands, of contracts available at the posted bid and asked prices. Many quote services show the number of contracts available at the bid and the asked prices. For example, you may see a bid of 2.30, an asked of 2.50, and a number like 300 × 500. This indicates 300 contracts are available at the bid and 500 contracts are available at the asked. 
To use a rough analogy, market makers act like bookies, taking a small piece of the action from all participants. Using a computer model to determine each option’s fair value, they typically post a bid price just below fair value and an asked price just above fair value. If a seller enters the market offering options at a fair price, the market maker buys from him. If a buyer enters, the market maker sells to him. Since the market maker’s selling price is higher than his buying price, he invariably earns a profit. The market, though, seldom offers the perfect convenience of a seller entering immediately after a buyer, and vice versa. Often, orders flow all in the same direction. This requires that the market maker work to hedge his position. After taking on a new long position in a call option, the market maker will immediately look for any other call options on the same underlying he can sell at reasonable prices. He may quickly sell an appropriate quantity of these to bring his delta back to near zero, or he may look for puts on the same underlying he can buy. If he is unable to find such opportunities, he likely will sell (or short) the appropriate quantity of the underlying itself. 
As you can see, the market maker is always working to manage his risk. The new long call position placed the market maker in a net long (positive delta) position that exposed him to losses if the stock were to drop. Not being interested in betting on the stock’s direction, he looks for a way to neutralize, or hedge, his position. Any of the earlier trades mentioned will accomplish that. Using the computer model, the market maker can accurately determine what the appropriate quantity would be.
232 BUILDING WINNING TRADING SYSTEMS WITH TRADESTATION 
Options Strategies 
Equipped with the knowledge of basic options terminology and some of the mechanics, the next step is to discuss options strategies. “Strategy” might sound like an overall ap-proach to trading the market, but in options trading parlance, “strategy” simply means a kind of position (e.g., short calls or long puts). Options trading strategies can be sepa-rated into two broad genres: single-option and multiple-option. 
Single-Option Strategies You may recall, there are four basic single-option strate-gies: 
1. Long call 
2. Short call 
3. Long put 
4. Short put 
When you consider that each of these strategies could be used to complement a position in the underlying, you now have eight single-option strategies. But, before listing all eight, there are two more terms you need to know: covered and naked. 
If an investor is short a call option and already owns the underlying that would need to be delivered in the event of assignment, his short call option position is covered. If he does not own the underlying, then his short call option position is naked. Likewise, if an investor is short a put option and is short in the underlying, his short put option position is covered. Otherwise, his short put option position is naked. 
Thus the eight single-option strategies are: 
1. Long call 
2. Short covered call 
3. Short naked call 
4. Long call with short stock 
5. Long put 
6. Short covered put 
7. Short naked put 
8. Long put with long stock 
We’ll discuss each strategy, including how each performs and when you would want to use it. Along the way we’ll introduce the concept of margin requirements. 
While our examples use stock options, these concepts are universal and apply to options on every kind of underlying asset.
Options: Introduction and Strategies 233 
Long Call A long call is considered a leveraged position in comparison with owning the stock itself. The call option holder controls the stock without actually possessing it. And as the option purchase is much cheaper than buying the stock, the option holder can control the stock for a fraction of the cost. If the stock’s price goes up even just a few percentage points, it’s likely that all its call options will increase by a greater percentage; some may even double in value. 
Other important characteristics of the long call are limited risk and unlimited poten-tial. An option buyer can lose only the amount paid for the option, nothing more. At the same time, upside potential is theoretically unlimited. A call option’s value will continue to increase as the price of the underlying continues to go up. 
Leverage, limited risk, and unlimited potential make call option buying attractive to speculators looking for quick upside advances. I say “quick” because, remember, the option buyer’s enemy is time decay. For each day the call option position is held, it loses some of its value. That’s why long calls are best for speculators expecting an upside move within a few days at the most. 
The profit diagram for the long call (Figure 10.3) illustrates the strategy’s limited risk/unlimited potential profile. The three lines illustrate how time decay affects the po-sition. The dotted line represents the long call’s theoretical performance as of today, while the solid line represents the performance at expiration (the final day of trading), and the dashed line represents the performance at the midway point between today and expiration. 
Short Covered Call We discussed this strategy, also known as a covered write, or buy 
write, earlier with the car example. It requires the covered call writer to give up control 
FIGURE 10.3 Profit Diagram of a Long Call
234 BUILDING WINNING TRADING SYSTEMS WITH TRADESTATION 
over his stock for a limited time in return for income from the sale of the option. This income is his to keep regardless of what happens. 
While the speculative call buyer will hold his position for only a short period of time, the covered call writer often expects to hold his position to expiration. If the option is out-of-the-money at that time, it expires worthless. If the option is in-the-money at expira-tion, the investor can do two things: He can buy the option back to close the position and keep his stock; or, he can do nothing and see his asset called away (loses his stock). Some investors keep their stock and repeatedly sell covered calls after each expiration, thus continually adding to their income. The advantage is that covered writers make money during periods when their stock holdings are going nowhere. The income that can be generated can be impressive—upward of 40 percent annual returns is typical. Remem-ber, though, such returns are possible only if the stock goes up or remains where it is. 
Covered writing is a conservative strategy. The sale of call options against stock holdings reduces the overall variance of returns, thus reducing risk in the traditional sense. This is why options were created in the first place (not for speculation). Still, spec-ulators are an important part of the market. They assume risk that portfolio managers would like to offload. Thus, options are an essential mechanism for risk transfer—from those who don’t want it (hedgers) to those who do (speculators). 
While covered writing is attractive because of the immediate income it generates, it does have its shortcomings. The covered writer has the same downside risk, as with just owning the stock, and his upside potential is limited. The short covered call profit diagram (Figure 10.4) illustrates the downside risk and limited potential. 
Short Naked Call The naked call seller has the same interest as the covered call seller—income. The difference is that the naked option seller does not have a position in 
FIGURE 10.4 Profit Diagram of a Short Covered Call
Options: Introduction and Strategies 235 
the underlying. If assigned, he must buy shares on the open market to deliver them. The risk, of course, is that he’ll have to pay the market’s then-current price. 
Performance is the primary difference between being short a naked option and being short a covered option. Without stock to complement a naked short call position, there is nothing to offset the position’s risk if the stock goes up. 
By selling a naked call, you get precisely the opposite performance characteristics from buying a call: unlimited risk and limited potential. An option seller can receive the amount he was initially paid for the option, but no more. At the same time, he has the-oretically unlimited risk. As the price of the underlying climbs (with no limit), the call option’s value climbs. At some point, you need to buy that option to close the position (or have to acquire stock to deliver when assigned, resulting in almost an identical mon-etary result). 
Still, investors like the prospects of earning time decay dollars (in a bearish to neutral position) when the position costs less to put on than a covered write. In fact, after get-ting the credit following the initial sale of the option(s), why wouldn’t a trader continue putting on large positions—as large as they want? Well, they can’t, because brokerages require investors to keep money in their account to cover potential losses. This cover-age is called the margin requirement. (Margin requirement is actually old terminology. The new term, performance requirement, is closer to the mark, but the old term still lives on.) 
There is a standard formula for computing the requirement for a naked short option position. Without going into details, the amount required is roughly 5 to 20 times the credit received from the sale of the option(s). So, if you sell an option and receive a $1,000 credit, you will be required to put up anywhere from $5,000 to $20,000 in collateral to [[Support|support]] the position. 
Naked option writers rely on stops to help control the theoretically unlimited risk. That works well, provided the underlying trades continuously (i.e., its price doesn’t jump dramatically). As many investors have seen, however, a stock can sometimes close at one price and open the following day at a radically different price. Stops are useless against this type of risk. To limit this exposure, some traders stick to writing index options, since index options don’t possess nearly this level of risk. The profit diagram for the short naked call (Figure 10.5) illustrates this strategy’s unlimited risk and lim-ited potential. As you can see, it makes money if the underlying price stays the same or goes down. 
Long Call with Short Stock This is a rare strategy that is seldom used or even dis-cussed. To protect a short position in a stock from an adverse move (to the upside), the trader buys calls. This permits participation in the expected downward move, and allevi-ates concerns about the stock jumping northward. However, it costs money to buy those calls, and that subtracts from the position’s overall profit. And after the calls eventually expire, if the investor wants continued protection, he’ll need to buy more. The profit dia-gram for the long call with short stock (Figure 10.6) illustrates this strategy’s limited risk and unlimited potential.
236 BUILDING WINNING TRADING SYSTEMS WITH TRADESTATION 
FIGURE 10.5 Profit Diagram of a Short Naked Call 
Long Put The put option holder maintains the right to sell stock without actually pos-sessing it, and does so at a fraction of the cost of shorting the underlying itself. Buying a put is a highly leveraged bearish position. When the stock price drops even by a few percentage points, its put options will likely increase by a greater percentage; some may even double in value. 
The long put has the same characteristics as the long call: limited risk and unlimited potential. An option buyer’s risk is limited to the amount paid for the option, and no more. On the plus side, the profit potential is theoretically unlimited. A put option’s value rises 
FIGURE 10.6 Profit Diagram of a Long Call Short Stock
Options: Introduction and Strategies 237 
FIGURE 10.7 Profit Diagram of a Long Put 
without limit as the price of the underlying goes down. Well, it’s not absolutely unlimited potential, as the farthest the pot could increase in value is if the stock goes to zero. 
As with buying calls, the qualities of leverage, limited risk, and unlimited potential make put option buying attractive for speculators betting on a quick downward move in the underlying. Again, the buyer’s enemy remains time decay, so put buying is best suited when the speculator believes a downward move will occur fairly quickly. The profit diagram for the long put (Figure 10.7) illustrates this strategy’s limited risk and unlimited potential. 
Short Covered Put This strategy is so seldom used or discussed that the term covered 
write is universally understood to mean buying stock and selling calls. But from a techni-cal perspective, shorting stock and selling put(s) is also considered a covered write. The short stock covered writer releases control over his short stock position for a limited time in return for income resulting from the option sale. 
The characteristics of this strategy are an identical mirror image (in terms of stock price direction) of the traditional covered write (Figure 10.8). 
Short Naked Put The naked put option seller has one interest: income. With this strat-egy, the investor expects the underlying stock to remain neutral or go up, thus allowing his short option to expire worthless. If the stock drops, he’s likely to be assigned. If as-signed, he’ll instantly be long the underlying stock. The price he’ll pay for the assigned shares, of course, is the strike price of the puts. So, this investor often shorts out-of-the-money puts at a strike price where he would consider the stock purchase a bargain. 
Selling a naked put offers precisely the opposite performance characteristics as buy-ing a put: unlimited risk and limited potential. It’s not absolutely unlimited risk, as the farthest your short put can be driven into the money is if the stock goes to zero.
238 BUILDING WINNING TRADING SYSTEMS WITH TRADESTATION 
FIGURE 10.8 Profit Diagram of a Short Covered Put 
Even with the risk, investors are attracted to the prospects of earning time-decay dollars in a bullish to neutral position. As with selling naked calls, your account is cred-ited for the initial sale of the option(s) and your brokerage requires collateral to cover the position. 
If the brokerage is not interested in owning shares of the underlying, naked put writ-ers employ stops to help control the risk from a downward move in the stock. That works as long as the underlying trades continuously. But again, a stock can sometimes close at one price and open the next at a very different price, and this kind of risk cannot be controlled using stops. The short naked put profit diagram (Figure 10.9) illustrates this 
FIGURE 10.9 Profit Diagram of a Short Naked Put
Options: Introduction and Strategies 239 
FIGURE 10.10 Profit Diagram of a Long Put Long Stock 
strategy’s unlimited risk and limited potential, and reveals that it makes money if the underlying price remains the same or goes up. 
Long Put with Long Stock This strategy, sometimes called a married put or a pro-
tective put, is considered the most effective way of hedging long stock positions, as it absolutely limits downside risk. Fund managers, unwilling to sell their stock (often for tax reasons), will buy puts to see their underlying positions through what they believe will be rough periods. It costs money to buy those puts, and that protection subtracts from the fund’s overall returns. And after the puts eventually expire, if the fund manager wants continued protection, he’ll need to invest in more puts. The profit diagram for long put with long stock (Figure 10.10) illustrates this strategy’s limited risk and unlimited potential. 
Equivalent Strategies If you think you’ve been seeing some of the same profit dia-grams repeatedly, in fact, you have. The performance curve of an option is one basic shape—flat to the out-of-the-money side sloping 45 degrees to the in-the-money-side. 
The performance curve of a long put is the same as that of a long call, only mirror-imaged left to right. The performance curve of a short option position is the same as that of a long option position, only mirror-imaged top to bottom. 
The performance curve of a single position in the underlying is a straight line at 45 degrees. When a complementary stock position is added to an option position, the stock’s 45-degree line combines with the option’s line to “rock” the line so the flat line portion becomes a 45-degree portion and the 45-degree portion becomes a flat line. Consequently, there is one basic shape, and only four ways of showing it—flipped top to bottom and/or flipped left to right.
240 BUILDING WINNING TRADING SYSTEMS WITH TRADESTATION 
TABLE 10.5 Equivalent Strategies 
Long Call Is Equivalent to Long Put Long Stock Short Covered Call Is Equivalent to Short Naked Put Short Naked Call Is Equivalent to Short Covered Put Long Call Short Stock Is Equivalent to Long Put 
Therefore, each of the eight single-option strategies has a counterpart with an iden-tical performance curve. For example, long call and long put long stock have identical curves. Table 10.5 summarizes the equivalent strategies. 
How does one decide whether to use a single-option strategy or its counterpart in-volving the stock? If one currently holds a stock position he wants to keep, the best approach would be to add the appropriate option to the position. But what should be done if the investor is constructing a new position from scratch? 
A position involving the stock will likely require more capital, and involves more transactions—two to get in and two to get out. Also, shorting stock has its limitations. Therefore, the single-option strategy is often preferable because it usually accomplishes the same objective with fewer resources. 
Combinational Strategies The previous single-option strategies section was cov-ered in a formal manner for the purpose of planting the shape of each single-option per-formance curve firmly in your mind. While the more complex option strategies properly belong to a more advanced options book, I would be remiss if I didn’t provide a glimpse of the possibilities offered by combinational option strategies. When we put two or more options together, their combined performance curves form new and interesting shapes. Common strategies involving two options, with names like vertical debit spreads, strad-
dles, strangles, and so on, also allow the options trader tremendous flexibility in meeting her investment objectives under various market conditions. 
Contrary to what you may hear or read from time to time, there is no single strategy that automatically makes money. New options traders often enter the market with the belief that there exists one magical combination that produces positive returns over the long term. What they fail to understand is that since each (fairly valued) option is a net zero expected return item, no matter how many of them you put together, you still have a net zero expected return (in the absence of a directional or volatility change exception). 
Since no particular strategy is suitable for every opportunity, the trader needs to be able to apply the most appropriate strategy in the given situation. This requires fa-miliarity with the various strategies and their performance characteristics. Tables and diagrams can be constructed to show which option strategies are bullish, bearish, ag-gressive, moderate, or neutral. Such tables and diagrams are useful but sometimes fail to account for three primary considerations: price direction, time frame, and volatility. Another difficulty is that many strategies overlap others in how and when they should be applied.
Options: Introduction and Strategies 241 
FIGURE 10.11 Profit Diagram of Put Credit Spread 
So understanding how the various strategies perform is best gained through expe-rience, and may be accelerated by the use of models and software that can simulate the performance of any strategy in the three dimensions (price direction, time frame, and volatility). 
Combinational strategies involve taking positions in two or more different options, and possibly another in the underlying. Like combining hydrogen and oxygen to form a unique substance (water), putting options together in various combinations results in some amazingly unique risk/reward profiles. 
For example, selling a naked at-the-money option is a very risky strategy. And pur-chasing an out-of-the-money option is costly and has a poor probability of success. However, combine these trades (using two options of the same type and in the same expiration month), and you form a credit spread—one of the safest and most successful option strategies around. (See Figure 10.11 for an example of a put credit spread’s profit/ loss profile.) 
Likewise, when you buy an at-the-money call or put, chances are you will lose all your money (stops notwithstanding). However, buy a straddle (both a call and a put at the same strike price and expiration month) and the possibility of losing all your money is practically nil (the underlying would have to finish precisely on the strike price). (See Figure 10.12.) 
Many people who know about, but are not truly familiar with, options believe they are inherently risky. While options allow you, and even tempt you, to take speculative chances, it is not true that they are inherently risky. Options are enormously flexible. Yes, they allow you to speculate, but they also allow you to hedge or even simulate a portfolio. Through combinational strategies, a position can be constructed that closely fits your goals, price predictions, projected holding period for the trade, and the current volatility environment.
242 BUILDING WINNING TRADING SYSTEMS WITH TRADESTATION 
FIGURE 10.12 Profit Diagram of a Long Straddle 
PART B: REAL-LIFE OPTIONS STRATEGIES AND TRADES 
By John Hill 
This treatise is based on the premise that it is generally best to collect premiums in the options market by being net sellers of options. It is akin to walking into a Las Vegas casino and they hand you $20,000 to play their games. However, there is a time constraint involved, and you may have to play for, say, 30 days. If you have anything left after the time period expires, you can take it home. Of course, if you lose more than the $20,000 that they give you, then you have to pony up. It’s also like running an insurance company. If you insure 1,000 houses and only 1 burns down, then you keep the premiums from the other 999. You assume the risk for the options buyers who dream of making the big hit with a small amount of money. 
There are many good books that explain the many techniques for options trading. They explain how the greeks work and the techniques for trading options. It has been my experience in talking with people that all of this theory leads to mass confusion. We will describe a few simple techniques that may just be suitable for your comfort level. We will not attempt to go into all the reasoning behind the argument on whether it is best to buy options or sell options. 
Risk is unlimited if you sell naked options. That is why brokers generally do not recommend them. However, markets tend to be in congestion most of the time, and we did a limited study once, which showed this could be as high as 85 per-cent of the time. If true, a lot of time decay is available for options sellers.
Options: Introduction and Strategies 243 
Time is always on your side when selling options. You are collecting time decay each day that the market does not have significant movement if you are an options seller. 
Stops and limit orders: One factor in successful options selling is to always know what your defensive actions are at the time you place the trade. Options soft-ware will identify where these danger areas are if the price of the underlying reaches a certain level within a certain period. You cannot go to sleep on them. Manage your positions. Slippage can be big if you use stops or market orders. However, it is best to always have stops in the market. But try to take defensive actions prior to these points being hit. In other words, always protect your stop. The same works for entering markets. The bid/ask spread can be wide, and this almost always indicates the potential for slippage. Use limit orders to enter or exit a trade. The general rule is to place your order halfway between the bid/ask spread. 
Taking profits is very important, too. Study your charts and look for buying and selling climaxes, springs, and up-thrusts as market turning points or profit-taking points. Also, be aware of major [[Support|support]] and [[Resistance|resistance]] levels. Do not necessarily wait for option expiration to collect your profits. 
Advantages of trading options: 
 Your perceived notion on the direction of the market may be completely wrong and you may still make money. 
 Larger stops on a stock/futures position may be used via covered calls/puts.  Selling calls/puts may result in profit: 
 If the market does not move significantly against your position.  If the market stays flat. Time decay takes place each day. 
 Loss occurs if the market makes a big move against your positions. Thus, two out of three outcomes are profitable. If long/short futures, you make money only if the market moves in your direction. 
 Risks of a huge move against your position can be reduced via option selling against your position. For instance, if long/short stocks/futures, the loss is total. Loss is lessened if covered calls/puts are used in conjunction to your stock/futures position. 
Dangers of selling options: 
 Unlimited risk.  Margin. The low margin requirements make it possible to sell large amounts of 
calls/puts with limited capital. Do not do this. Always look at your risk first in the 
event of a huge adverse move against your position. We will generally trade only two to three options in a single market on small-size accounts.
244 BUILDING WINNING TRADING SYSTEMS WITH TRADESTATION 
You can spread your risks by: 
 Selling calls if you are short puts or long futures/stocks, and vice versa.  Diversification—trading multiple uncorrelated markets. 
The greeks can be confusing. The ones most important to me are delta and theta. I like to know my delta position when I look at a price bar chart of a particular market. I know instantly if I am making or losing money. I also like to know my profit potential and how much time decay (theta) takes place each day. I know that if the market is making large moves up and down (volatility), I will collect more money when I sell an option. 
Putting Theory to the Test 
In writing this chapter, we decided it would be great to show how theory works in the real world of trading. Perhaps this will be an aid in showing the upside and downside of options trading. 
We posted 11 trades on our Website in December 2011 at the time the trade was en-tered (see Table 10.6). Thus, it is not hindsight trading. Four were profitable and seven were losing at the end of December. The biggest losing position was $1,569 and the biggest winning position was $8,832. The table shows the account number for the trade, date of entry, price, and profit/loss for the month. You will notice that some positions have been closed and others are still open. Defensive action was required, including tak-ing profits. Results show a profit of $4,990 on a margin requirement of $66,928. First, let me emphasize this is one month of using basic option patterns as shown below. Re-sults were profitable with a one-month return of 7.46%. (Options charts are courtesy of OptionVue Systems.) 
Basic Options Strategies  Selling puts and calls.  Selling naked calls or puts. (See Figure 10.13.)  Spread trading. Selling both puts and calls out of the money. (See Figure 10.14.)  Ratio spreads. Buying at the money calls/puts and selling multiple contracts of out-
of-the-money puts/calls to more than cover the cost of buying the put or call. (See Figure 10.15.) 
 Covered calls/puts. Buying futures and selling an equal number of calls/puts against your futures position. 
 Camel ratio spreads. This is a ratio spread on both sides of the market—both puts and calls. If long the futures, sell calls. Buy at-the-money puts and sell out-of-the-money puts. (See Figure 10.16.) 
Selling Naked Puts and Calls In the example in Figure 10.13, the trade was placed on 12/30/2011. We sold 1 February Aussie Dollar 85.5 Put for 0.01. The break-even points on the futures are: 0.9982 in 12 days, 0.9850 in 24 days, and 0.9757 at expiration. The
Options: Introduction and Strategies 245 
TABLE 10.6 Summary of Options Trades 
All trades were initiated in December 2011 
Strike Date/Price P/L Status Margin Required 
Aussie $ Naked Put January Option 30-Dec Acct # XXX85 
Sold 1 Put 85.5 Put 1.00 $ 146 Open $2,856 
Aussie $ Put Spread 7-Dec Acct # XXX85 January Option $7,852 
Bought 1 Put 103 Put 2.52 $ (77) Expired Sold 2 Puts 100 Put 1.18 $(1,403) Closed Sold 1 Puts 98 Put 0.7 $ 426 Expired 
Net $(1,054) 
Aussie $ Spread 23-Dec $2,300 Acct # XXX05 March Option 
Sold 1 Call 107 Call 60 $ (132) Open Sold 1 Put 94 Put 100 $ 206 Open 
Net $ 74 
U.S. Bond Spread 4-Dec Acct # XXX85 January Option $4,898 
S2 C 144 Call 0.67 $(1,330) Closed S1 P 138 Put 0.67 $ 637 Closed S1P 138 Put 0.67 $ (687) Closed S1P 138 Put 0.67 $ 654 Closed 
Net $ (726) 
Crude Camel Spread Trade Acct # XXX85 January Option 4-Dec $4,600 
Bought 1 Call 96 Call 4.13 $ (496) Closed Sold 4 Calls 102 Call 2.055 $ 1,921 Expired Bought 1 Put 99 Put 3.792 $ 300 Expired Sold 2 Puts 94 Put 1.94 $ 305 Closed 
Net $ 2,030 
Crude Camel Spread Trade Acct # XXX85 February Option 8-Dec $4,300 
Sold 2 Call / 2 Call 102 Call Avg. Price of 2.7 
$ 845 Closed 
Bought 1 Call 98 Call 4.94 $(2,094) Closed Bought 1 Put 99 Put 4.76 $(2,098) Sold 2 Puts 93.5 Put 2.65 $ 2,185 
Net $(1,162) 
(continued )
246 BUILDING WINNING TRADING SYSTEMS WITH TRADESTATION 
TABLE 10.6 (Continued) 
All trades were initiated in December 2011 
Strike Date/Price P/L Status Margin Required 
Crude Spread Acct # XXX05 February Option 8-Dec $4,600 
Sold 1 Call 105 Call 1.98 $ (465) Closed Sold 1 Put 91.5 Put 2.17 $(1,104) Closed 
Net $(1,569) 
Crude Camel Spread Trade ACCT#XX05 February Option 16-Dec $4,376 
Bought 1 Call 92 Call 4.74 $ 3,000 Sold 1 Call 97 Call 2.34 $(2,530) Closed Sold 1 Call 97 Call 2.34 $(1,694) Bought 1 Put 93 Put 3.92 $(2,870) Closed Sold 2 Puts 88 Put 2.14 $ 3,321 Closed 
$ (773) 
Euro Call Spread Acct # XXX85 January Option 6-Dec $4,170 
Bought 1 Call 131 Call 41 $(2,741) Closed Sold 2 Calls 134 Call 22 $ 2,659 Closed 
Net $ (82) 
Gold Spread $11,526 Acct # XXX05 February Option 12-Dec 
Sold 2 Calls 1800 Call 11.9 $ 2,170 Closed Sold 2 Puts 1530 Put 11.18 $(2,309) Closed 
Net $ (139) 
Gold Spread Acct # XXX05 February Option 16-Dec $15,450 
Bought 1 Futures 1601.9 $ 2,947 Closed Sold 2 Call 1650 Call 24 $ 3,870 Closed Bouth 1 Put 1600 Put 50 $ 2,115 Closed Sold 2 Puts 1530 Put 23.5 $ (723) Closed 
$ 8,209 
Summary of Open/Closed $4,954 Initial Margin Required $66,928 % Return 7.40% 
Past Performance Is Not Indicative of Future Results. For Educational Purposes Only. Trading Options Involves High Risks.
Options: Introduction and Strategies 247 
FIGURE 10.13 Selling Naked Calls/Puts 
Potential Profit: $1.008. The Potential Loss: Unlimited on Downside. Margin: $2,876. Prob-ability of Profit: 76%. On 12/30 Open Trade Equity was $146. 
 Time. Sell options with 10–60 days until expiration. Time decay accelerates in the last 30 days of option life. It is also appropriate to sell longer-term options. It has the advantage of collecting more premiums and does not require close monitoring if you sell far-out-of-the-money options. 
 Options. The strike prices on the options should be outside the strike prices of major [[Support|support]] and [[Resistance|resistance]] zones. You might also consider selling options just above or below a major trend reversal signal on your bar chart. 
 Stops. A stop should always be in place. Option positions require adjustments over time. The suggested approach is to monitor the option value every few days. If it has gone down in value, lower your stop to twice the current value. If it is above the cost, do not move your stop. 
Selling Both Puts and Calls In the example in Figure 10.14, the trade was placed on 12/12/2011. We sold 2 February Gold 1800 Calls for 11.90 and sold 2 February Gold 1530 Puts for 11.20. The break-even points on the futures are: 1572 or 1720 in next 15 days, 1537 or 1770 in next 30 days, and 1510 or 1815 at expiration. The Potential Profit: $4,600. The Potential Loss: Unlimited. Margin: $11,528. Probability of Profit: U91% 46 Days to Expiration. On 12/30 Open/Closed Trade Equity was $4,135.
248 BUILDING WINNING TRADING SYSTEMS WITH TRADESTATION 
FIGURE 10.14 Spread Trading 
This strategy is preferred when you do not have strong conviction of market direc-tion. Our suggestion is that the initial stop should be twice the cost of the option. The best strategy is to be delta-neutral on puts and calls. For instance, if you sell a call for .95, sell a put for .95. You can also sell multiple units of either puts or calls so that you collect an equal amount for both puts and calls. If you sell both puts and calls for the same values and one side gets hit, odds favor the other side will not be hit and you break even. If both sides are hit, you lose money. 
Ratio Credit Spread In the example in Figure 10.15, the trade was placed on 12/06/2011. We bought 1 January EuroCurrency 131 Call for 4.10 and sold 2 January Eu-roCurrency 134 Calls for 2.20. The break-even points on the futures are: 1.3480 in next 11 days, 1.3600 in next 21 days, and 1.3720 at expiration. The Potential Profit: $242–$3,900 in 32 days. The Potential Loss: Unlimited on Upside. Margin: $4,170. Probability of Profit: 70%. On 12/30 Open /Closed Trade Equity was $2,937. 
The ratio credit spread has a wide zone of profit as long as the market remains within this zone. You are collecting time decay each day. It has significant profit potential. A strategy for trading an option spread: Buy one call slightly in the money, sell two calls out of the money to more than cover the cost of buying the option. Buy one put slightly in the money, sell two puts out of the money. Options software such as TradeStation’s
Options: Introduction and Strategies 249 
FIGURE 10.15 Ratio Spread Trading 
Option Station will tell you where appropriate defensive action is required. For instance, the charts will show you how your account stands at different time versus price levels for, say, an option with 40 days to expiration. The software will show you your danger points for 10, 20, 30 days and at expiration. There are a number of alternatives at these danger or action levels. One suggested course of action at these danger points is as follows: If the market is going up and reaches a danger point, cover one of the short calls and liquidate the long position. 
The Camel Ratio Spread In the example in Figure 10.16, the trade was placed on 12/16/2011. We bought 1 February Crude 92 Call for 4.74 and sold 2 February Crude 97 Calls for 2.34 and bought 1 February 93 Put at 3.92 and sold 2 February 88 Puts at 2.14. The adjustment points on the futures are: 84–87 for the puts and 91–101 for the calls. The Potential Profit: $2,000–$4,000. The Potential Loss: Unlimited if not adjusted. Margin: $4,376. Probability of Profit: 61%. On 12/30 Open/Closed Trade Equity was $290. 
This strategy involves ratio spreads for both puts and calls. It generally creates two peaks for profit. It works best in neutral markets. 
Weekend Time Decay The weekend time decay is twice as much as a one-day time decay. This is significant if the market expires in 10 to 15 days. I like to hold positions
250 BUILDING WINNING TRADING SYSTEMS WITH TRADESTATION 
FIGURE 10.16 Camel Ratio Spread 
over a weekend. Of course, the opposite can be true. If the world falls apart on Saturday, you have to live through another day to know what your losses or profits are. 
CONCLUSIONS 
Options trading offers the investor opportunities not available when simply buying or selling futures or stocks. It enables you to dampen the volatility that often occurs when just buying or selling futures or stocks. Our suggestion to anyone is to study the mechan-ics of options trading and don’t get too hung up over the greeks. Just be fully aware of basic technical analysis and the fact that markets are in a trading range most of the time. Also, always be aware of where you stand—you must manage your trades.
C H A P T E R 1 1 
Interviews with Developers 
O ver the years, Futures Truth Company has interviewed some of the best minds 
in the system developing and trading industry. We thought it would be appropri-ate to conclude with their interviews. We believe you will find wisdom and some 
good ideas to incorporate into your own trading ideas and systems. Note that these inter-views are from 2003, so while the events the interviewers describe are no longer current, the background and information about developing systems and the trading industry in general is still very much relevant today. 
Welles Wilder 
Education: B.S., Mechanical Engineering Position(s) Held: Director of the Delta Society Favorite Book: The Bible 
For the first interview, we thought it appropriate to choose someone whose ideas orig-inated before computers were widely used by individual traders but who had a lasting effect on both technical analysis and, later, computerized trading. 
His tools were easily used in paper spreadsheets and modern computerized trading programs during the past two decades since something called the programmable cal-culator gained acceptance. Much of this person’s studies culminated in the writing of his technical analysis book, New Concepts in Technical Trading Systems, published in 1978, in which he described a tool he created called the Relative Strength Index. 
The Relative Strength Index ([[RSI]]) became one of the most widely used trading tools. The renowned technician we are describing, Welles Wilder, spoke to Steve Toney re-cently from his home in New Zealand. 
   
251
252 BUILDING WINNING TRADING SYSTEMS WITH TRADESTATION 
How did you get into the futures business? 
After a 10-year career in mechanical engineering, real estate, and land development, I sold my interest in over a thousand apartments and various other real estate projects and began to pursue other areas of interest. 
I read a book titled Silver Profits in the Seventies, by Jerome Smith. Since real estate is a highly leveraged situation, I looked for a way to buy silver in a highly leveraged situation; this led me to the commodity futures markets. 
I made a lot of money in silver but lost most of it in learning to trade other commodi-ties. This led to about five years of reading, and researching everything I could get my hands on relating to futures trading using mathematical models. In 1978, I published the results of these studies in New Concepts in Technical Trading Systems. My life has not been the same since. (Note: Welles wasn’t too far off from his prediction. He may have 
missed Y2K, but he was right on the money with the markets after 1999.) 
What do you think about Y2K and the chances of disaster? 
At first I thought it was just a bump in the road causing a lot of hype. However, because it presented such enormous possibilities, I began to study it in depth. (Some of my friends call me “Bulldog” because when I latch onto a concept, I don’t let it go until I have ex-hausted virtually all the potential it contains.) 
In mid-1996, not much had been published on the subject (of Y2K), so the main area for research was the Internet, which came along just in time. I always enjoy research, be-cause it involves sifting through opinions and latching onto the parts that can be proved or, in many cases, the items that cannot be disproved. The more I studied, the more non-disprovable information I gathered, and the more concerned I became. 
I believe most of your readers are most interested in the financial repercussions of Y2K, so I will concentrate on that arena. 
The greatest financial party of the century is almost over. Banks and investors have become drunk with their huge profits and have devised more ingenious ways to moneta-rize debt and then leverage it by means of derivatives. 
The fractional reserve banking system now has, on average, $1.32 to dispense to depositors for each $100 in deposits. The stock market is now more “out of value” than it was in 1929. Bankers see no place for gold in the monetary system; no one remembers or even considers deflation. 
Y2K will be the catalyst that brings this house of cards crashing down. It will happen this year in 1999. It started in Asia, and the dominoes are falling. Russia has defaulted. South America, Japan, Mexico, China are all having big problems. Savvy investors are using this last market up-move to get out. 
I believe that by mid-to-late summer the perception of the implications of Y2K will start bank runs throughout the world and in the United States. If the U.S. stock market has not already started to plummet, this will bring it about. I believe it will make 1929 look like a walk in the park. I believe 1999 will be the beginning of sorrows.
Interviews with Developers 253 
Where are the best financial opportunities now? 
In light of the above, there are basically two avenues. One is to buy put options on the stock market indexes. The other is to buy gold and silver call options. I prefer the latter because they are cheaper, and I believe they will provide more return on investment. Also, when the bank runs start and the government imposes restrictions on withdrawals, what will the average guy write a check (on) in order to (acquire goods)—it will be on the only things that have always had intrinsic value, gold and silver. 
It would only take a small fraction of these “average guys” to run the price of gold and silver to unheard of levels. Are the bankers still going to think of gold and silver as a barbaric relic and continue to sell their gold? No. They will suddenly re-alize they have pushed the envelope too far and that the confidence in the reserve system has finally been broken. It will be a new ball game with new rules: “He who has the gold makes the rules.” The bankers will be first in line at the gold window to try to protect their own wealth. I believe this will happen in the late summer or fall of 1999. 
I recommend buying the December 1999 390 gold call options; currently they are under $200 apiece. If gold goes as high as it has been in the past, each call option will be worth $40,000. Regarding silver, I recommend buying the December 1999 silver call options at a strike price of $8. These are currently available for around $400 each (call prices as of late January). 
Are you still actively trading? 
Yes, but from a hands-off vantage point. I have a person in my office who is instructed to trade my account in strict accordance with the Delta Members System. Neither he nor I are permitted to deviate from the system. This is the best system that I know. 
Who do you think has good ideas now, specifically regarding technical analy-
sis? 
I must admit that in recent years I have not kept up with all the new stuff that has come down the pike. I think Tom DeMark leads the pack in coming up with original ideas. If you will allow me to include myself in this category, I have spent the last two years in researching a way to automatically denote a trend change. 
Explain what the Delta Society does? 
In 1983, I founded the Delta Society International as a vehicle to distribute information on futures market turning points to its members. A man named Jim Sloman made an amazing discovery. He showed me that there is a perfect order in all freely traded mar-kets. Even though the order is perfect, the accuracy of the projected turning points is not perfect—if it were, I would be wealthier than Bill Gates, and no one would have ever heard of the Delta Society—however, I have researched the historical occurrence of each Delta Turning Point, and have defined the standard deviation and the 100 percent range for each point.
254 BUILDING WINNING TRADING SYSTEMS WITH TRADESTATION 
I have now been able to provide Delta Members with a mechanical way of utilizing this information. I consider that to be my best work and final achievement in the arena of technical analysis. 
Are you ever surprised at the following your ideas have created? 
Frankly, I haven’t thought a lot about it, but the answer would be “Yes.” However, when I look back over the last 25 years, I must admit that I could never have chosen any career that has been as challenging and interesting, as rewarding, and half as much fun as my third and last (this) career. I feel very fortunate indeed. 
Dr. John Clayburg 
Education: Ph.D., Veterinary Medicine, Iowa State University, 1971 Position(s) Held: Independent System Developer, Custom 
TradeStation Programmer Favorite Books: Anything by Tom Clancy 
Two systems developed by the same person have popped up on the top 10 systems list regularly in recent issues of Futures Truth: Feeder Trader and Cyclone, which is an S&P [[Day Trading|day trading]] system. 
While S&P futures traders are obvious target customers for a systems developer, Feeder Cattle is a thinly traded market that does not attract a lot of interest in the trading world; Feeder Trader’s strong hypothetical performance might change that, though. 
For John Clayburg, because he is a veterinarian and a trader, foreseeing patterns in both the feeder trader market and the S&P came naturally. Clayburg created Cyclone and Feeder Trader. 
Futures Truth spoke to Clayburg recently, as part of a continuing series of interviews with those who have greatly impacted futures systems trading. 
   
What do you think are the hot markets this year? 
I seem to concentrate on only two to three markets now and really don’t have a valid opinion here. 
What inspired you to create the Feeder Trader and Belly Trader systems? 
I routinely scan all markets for the best responses to certain repetitive patterns. The feeder cattle market comes up regularly in these scans, since it seems to be more cyclical than some others. Also, since we raise feeder calves on our family farm, the feeder cattle market was a natural for us. 
As for Cyclone, stock index futures seem to create the most interest. It is probably the most challenging market to handle—and I rarely turn down a challenge.
Interviews with Developers 255 
Do you plan any revisions to your systems anytime soon? 
I have made only one change to Cyclone since its release, in response to the increase in volatility in the S&P index in 1997. I have made no changes to the Feeder Trader Program. I plan no changes in either program. 
You must be a very busy guy. Does futures trading and programming ever 
interfere with your life? 
Only if I let it, which is easy to do. There’s always one more project—one more good idea. . . . 
Are you worried about the generally poor performance of S&P daytrade sys-
tems during the first quarter of this year? 
Unhappy, yes. Worried, no. Cyclone was developed, as were probably most other sys-tems, by the careful observation of repetitive patterns in the S&P market. The most rewarding repetitive pattern in this market is the big trading day in which the trend devel-ops early and persists for most, if not all, of the day. During the time to which you refer, the market was markedly devoid of the usual presence of these typical days. This resulted in frequent stop-outs as the system tried, but failed, to catch these big trending days. 
Obviously, a system designed around a particular pattern will not work well when this pattern fails to repeat itself as in the past. Why this change in market personality oc-curred is the big question. It’s possible the Dow’s flirtation with the 10,000 psychological level was to blame. You can look back over the historical price patterns of this market and note several periods when the big day vanished. The period we have just experi-enced has been about the length of those noted on past charts. The market seems to be returning to normal as we do this interview. 
If history repeats itself, these systems will return to their past performance as the market regains its normal personality one again. 
What advice do you have for those who trade your system or any other system? 
You hit my favorite subject here. Anyone who is contemplating trading a mechanical system owes it to himself and the developer to become intimately familiar with the system before trading it. It is easy to look at a draw down figure and say, “That’s no problem”—but when the draw downs hit, and they will, it’s quite another thing to be able to deal with the losses. It’s human nature to dwell on the profit possibilities of a system and downplay the potential for loss. 
Also, those who are unsuccessful with a system are usually those who think they can beat the system by altering its rules or parameters or selectively deciding which trades to take and which not to take when they are generated by the system: If you are into system development, by all means concentrate your efforts toward building your own successful trading strategy. On the other hand, if you want to trade a particular system, trade the system exactly as it was meant to be traded by the developer. Rarely, if ever, do the two combine successfully.
256 BUILDING WINNING TRADING SYSTEMS WITH TRADESTATION 
What else do you do for fun, besides programming? 
As our five kids begin to scatter about at the universities and eventually into their careers, we find ourselves traveling to visit the gang and getting to see more of the country in the process. Also, we enjoy raising cattle here at our home and observing the multitude of wildlife so abundant in our area. 
Keith Fitschen 
Education: M.S., Electrical Engineering (Stochastic Estimation) Position(s) Held: System Developer for TradeSystem, Inc. Favorite Book on Trading: Cybernetic Trading Strategies, by Murray Ruggiero 
For this issue’s interview, we talked to a systems creator who has throughout his life seen opportunity where most others have chosen to see only danger. Aggressively pursuing opportunities, but with a cool head, Keith Fitschen developed and now trades Aberration, a computerized futures trading system that has had an excellent performance record since its release date. Keith talks about his experiences trading Aberration and his bold embracing of foreign futures markets. 
   
What do you think the hot markets are this year? 
I’m a trend follower, not a predictor. So far, we’ve had good trades in the currencies (deutsche mark, Swiss franc, French franc, and Dollar Index), all the energy products, and some good short trades in the agriculturals (wheat, beans, bean oil). Though cocoa isn’t a good market for trend-following, Aberration is ahead over $8,000 in the current short trade. The industrial metals also had a good upside run (London copper, aluminum, aluminum alloy, and nickel). The agriculturals are set up for a huge move to the upside should weather problems develop. 
How did you get into systems development? 
I was in the Air Force splitting assignments between engineering and flying when I real-ized I needed to look to the time when I’d retire and do something else. I knew that the markets, both stock and commodity, were noisy time-series data and I knew from my engineering background how to characterize and analyze that type of data. I started with commodities because they were more highly leverageable and because everyone seemed to be afraid of them—opportunity. I bought some commodity data and started to work. It wasn’t nearly as simple as I thought it would be. And I’m still learning all the time. But for those with the passion, it’s very rewarding. 
What inspired you to create Aberration? 
I started with complex analysis techniques, figuring if it was easy, everyone would have found something. I quickly learned that complex wasn’t better. When I went back to
Interviews with Developers 257 
the simple things analysts use to look at data, I “found” Aberration. That was in 1986. Since then I’ve developed four other really good trend-following methodologies. All are relatively simple. 
What do you say to those who say Aberration has had—though strong 
performance—a high draw down? 
I hear that all the time, and it is based on the Futures Truth numbers for the seven com-modities you report on. First, your rating metric (return on three times margin) is risk adverse. It is purely a profit metric. So the commodities I chose in 1993 were chosen to maximize your metric, not draw down. By comparison, our portfolios are diversified and designed for a good return and low draw down. People who see and trade our portfolios are very happy with the draw down characteristics. Second, trend-following systems give back open equity profit at the end of a trade, most systems as much as 50 percent. This open equity giveback is draw down when computed from an equity curve. 
The example I always use is 1994 coffee. We entered that trade at about 88 and it went as high as about 260. Aberration got out at about 200. The 260 to 200 is a 60-point draw down, or about $23,000. But a trader wouldn’t have experienced that draw down unless he was in the trade. And if in the trade, he would have made about 112 points of profit, or about $40,000. True, he would have seen the draw down, but it isn’t as though he experienced it when he first started trading the system. That’s the problem. 
People look at draw down as the amount, plus margin, that they need to trade a sys-tem. And for trend-following systems, it isn’t anywhere near that amount. That’s why our software reports “start-trade” draw down. That’s the maximum amount a trader would go below starting equity in the history of that commodity. For small traders, that’s the metric they really need to see to determine the risk with various account sizes. 
Have you been trading this year? 
Yes, I couldn’t in good conscience sell a system unless I traded it. Last year was a good one for our portfolios, especially the smaller ones that most buyers trade. And this year is well ahead of pace for most of the portfolios. But every year will see equity rallies and draw downs with Aberration, or any other system. The key to trading is to build a plan around the performance of your system and recognize when performance, both good and bad, is within the bounds of historical. When it dramatically steps outside those bounds, the cause needs to be determined and steps taken. 
What is unique, if anything, about any foreign markets you trade? 
I’m a big believer in diversification, so I’ll trade any market that is unique (lowly corre-lated with other markets). I trade things most people have never heard of: dried cocoons, the Baltic Freight Index, palm oil, azuki beans, and raw silk. Though we have great mar-kets in the United States, there are great markets in other countries as well. I trade a lot of world bonds (Canadian, French, Italian, Swiss, Belgian, Spanish, German, Japanese, Australian, New Zealand) and I’m always looking for overseas markets that trade better
258 BUILDING WINNING TRADING SYSTEMS WITH TRADESTATION 
than ours. For example, London and Paris sugar trade better than our world sugar, for most trend-following methodologies. And one of our weakest trading groups for trend-following is the metals. It turns out that the London Metals Exchange trades a number of metals that trade very well with trend-following systems. 
Are you currently working on any programming projects? 
Yes, we will be releasing an S&P system called ASCEND-X in the next month. The system is really two systems for the price of one: a daily-bar system with trades that average about six days, and an hourly-bar system with trades averaging three days. One system is countertrend and the other trend-following, so their equity curves are lowly correlated. The unique thing about them is that they make enough profit-per-trade to trade an E-Mini S&P with. 
Randy Stuckey 
Education: B.S., Quantitative Business Analysis Position(s) Held: System Researcher/Developer Favorite Book on Trading: New Concepts in Technical Trading Systems, by 
Welles Wilder 
Understanding how markets work and why individual market players make certain deci-sions is a tall order. One could argue that an education in process modeling and statis-tics, along with some appreciation of the complexity of human nature, would be a darn good start. 
Quality engineers research and test models that try to account for how complex human endeavors—like manufacturing automobiles, for instance—work and what vari-ables affect the desired outcome of the process. 
Most developers have come from myriad other occupations. Probably no trading sys-tems developer has a more appropriate career background than Randy Stuckey, a man-ufacturing quality engineer. Making manufacturing models helped Stuckey understand how the complex human endeavor of trading futures works. 
We spoke to him recently about his systems, and probed his brain for pearls of wis-dom, as part of our continuing series of interviews with important systems developers. 
   
What do you think the hot markets are this year? Do you have any inflation, 
or economic disaster forecasts? 
To my knowledge, no one can predict the future. As in the past, the markets that end up trending will be the big winners for the year. So far this year, all of our systems have done well for most of the currencies. Catscan continues to do pretty well with the T Bonds. Golden SX took some nice crude oil profits and Millennium 2000 currently has over $89,000 in its open positions, so this looks like another good year.
Interviews with Developers 259 
While we can’t predict the future, there are several markets poised for some explo-sive moves. The stock market reminds me of the famous Holland tulip fiasco. Eventually valuations are going to have to get back in line with earnings reality. Either earnings are going to have to double or stock prices are going to have to drop. Our proprietary S&P system (not for sale at this time) seems to be preparing for a long-term short position. Inflation will probably increase late this year, which should finally allow our Millennium 2000 system to take profits on its short gold position. 
How did you get into systems development? 
I got involved for similar reasons to those that caused the formation of Futures Truth. 
A friend had purchased ten trading systems. None of them worked. He knew I had a background in statistics and asked if I could determine why they were not profitable. Of course at the time I didn’t have a clue, but the idea of mechanical trading systems was so intriguing that I continued to learn, eventually becoming a full-time systems researcher/developer. 
By the way, now that I know why those 10 systems didn’t work, it’s enlightening to look at a breakdown. Four of them didn’t work because the system vendor literally fal-sified the system’s performance statistics. That’s felony fraud, but nevertheless that was the reality. Interestingly, Futures Truth was tracking two of the falsified systems at the time. While the vendor’s falsified statistics that said the systems were making 125 per-cent per year, Futures Truth was showing them losing 30 percent to 40 percent per year. If my friend had been aware of Futures Truth, he would have saved a lot of money. The remaining six systems didn’t work for two reasons. Two of them failed because they were just plain lousy systems. The remaining four didn’t work because they were grossly overoptimized. 
What inspired you to create Millennium 2000, your latest system? 
Some Catscan and Golden SX owners had increased their accounts quite a bit, which would justify trading more commodities. At the same time, I was looking at the ef-fect of not just trading a diversified basket of commodities but also trading more than one system (assuming the system did not use the same trading principle). The ef-fect of multiple system/multiple commodity portfolios was very exciting. The effect on draw down, profits, and Sharpe ratio was excellent. With these thoughts in mind, I decided to develop another system to provide more diversification. The result was Millennium 2000, my first pure reversal system. It uses exceptionally simple rules, which I like. 
Do you encounter many people trading, say Catscan, who are tempted to take 
profits early or decline trades that the system signals? 
It happens all the time. Someone said fear and greed drive the commodities markets. I think this is partially true. I suspect fear is the stronger of the two. It sure seems that way as I’ve observed people consistently taking early profits. We’ve seen people take
260 BUILDING WINNING TRADING SYSTEMS WITH TRADESTATION 
$5,000 early profits on Catscan trades that eventually were closed out with over $20,000 in profits. 
What advice do you have for them? 
I remind them that they are not trading the system if they take early profits or decline certain trades. Even more important they are, at that point, trading a completely untested system with hazy, unwritten rules. I further suggest that they may be better off having a broker trade the system for them. 
Is fundamental analysis ever fruitful? 
I suppose it has its place, though I’ve never met anyone who was successfully trad-ing strictly from fundamentals. I used to create models of manufacturing processes. We then used those models to improve and control those processes. No one can per-fectly model any process. There are always unidentifiable variables that affect the pro-cess. With manufacturing process models, though, we usually identified enough of these variables to be successful. Since I’ve never met a successful fundamental trader, my conclusions are: 1. Successful fundamental traders must be very rare, and 2. The pro-cess that drives fundamental commodity prices must be quite complex, and it must have lots of unidentifiable variables or more people would be successfully trading fundamental models. 
Have you been trading this year? Why or why not? 
I’m strictly a systems researcher—and don’t trade at all—it’s what I enjoy doing. But it’s a two-edged sword. As some bard said, “To trade, or not to trade, your own system: That is the question.” In one corner are those who say, “You don’t even have enough faith in your system to trade it yourself.” I respect that opinion. In our case it’s an academic exercise, as we just bought our dream home, which ate 100 percent of our risk capital. 
However, there is another corner in the trade/don’t-trade-your-own-system room. I’ve observed that a vast majority of system vendors who trade their own system have overoptimized systems. I’ve wondered why that so often is the case. It may relate back to the fear/greed problem. I suspect that after three or four losing trades in a row—a perfectly normal event that even the best systems experience—fear sets in. They start thinking, “My system quit. I better start tweaking it a bit.” Then they take a perfectly good system, pucker up their lips, and give it the overoptimization kiss of death. I don’t have those pressures on me. It may explain why I almost never change my system rules. 
Are you currently working on any programming projects? 
Yes, I’m working on three major projects. The one that is closest to fruition is a new system that will be called “Little Big Horn.” It uses a different principle than our other three systems. We use a six-step process to develop a system. The last step after finalizing the system is to paper trade it for six months realtime to see if it continues to behave as
Interviews with Developers 261 
designed. It successfully completed its test in June, so it probably will be released for sale in a month or so. 
Dave Fox 
Education: B.A., Business Administration, University of Maine (Orono) 
Position(s) Held: Commodity Trading Advisor, Registered 1984 Favorite Book on Trading: New Commodity Trading Systems and Methods, by 
Perry Kaufman 
Nothing perhaps breeds a more clever futures trader than time and money—lots of time and money—and when Dave Fox sold his interest in a family-owned trucking company in 1980, he suddenly had both. Fox is the developer of the successful Dollar Trader pro-gram, designed to trade currency futures. 
In 1980, retired and only 50, Fox began spending time in the office of a good friend who was both a stock broker and a futures broker. Fox researched and traded a lot on his own also. By 1984, he had realized that in order to trade successfully, one needed a systematic approach. That same year Fox became a Commodity Trading Advisor. 
Probably no system is requested more for reports: The system has withstood the test of time; it trades in popular markets; and currencies are trending markets—good for system trading. Its programmer is known for his honesty and openness. 
   
Dollar Trader is again in the top 10 list. To what, in general, do you attribute 
its strong performance? 
After one designs a trading system, you need a favorable market to generate substantial profits. The first half of this year the European currencies, led by the new euro, were in a steady decline against the U.S. dollar, while the yen was going sideways. This situation has reversed, and the yen’s rise against the dollar has produced a large gain. 
What led you to trading systems development? Or, what inspired you to create 
Dollar Trader? 
During the year 1990, the indicators that I was using to trade the USDX and currencies were producing gains commensurate with those of programs that were rated by Futures Truth, so I decided to incorporate those indicators into a software package that could also be rated by your organization. 
At that time, testing showed that the USDX was the most reliable instrument, so I requested that my system be rated on it alone. 
What do you say to those who say Dollar Trader is difficult to trade? 
From my communication with users, the most difficult part is absorbing the draw downs, but if you are going to capture the big winners, you have to expose yourself to losses.
262 BUILDING WINNING TRADING SYSTEMS WITH TRADESTATION 
Do you plan any revisions to your systems anytime soon? 
In 1996, we expanded the program to be rated on the deutsche mark and the yen, filtered by the USDX. In 1999, trading in the deutsche mark has almost vanished, and the USDX has been reconfigured to be 57 percent euro; therefore, we requested that the program be rated on the EuroFX, traded on the CME, and the yen. One can also trade the Swiss franc, but I would recommend using the euro as a filter. Since that is a subjective judgment, it cannot be rated as such. If the euro continues to be successful, then we should not have to make any more revisions. 
Have you been trading for yourself this year? If you have, how has that gone? 
There are a number of brokers who trade the program for clients, and my account is traded according to the program by one of them. If I knew of a better way, I would tell my users! 
What advice do you have for those who trade your systems or any other 
system? 
The record is of course important, but I think you have to understand and have confi-dence in the logic to trade a system. I could never trade cycles, because I don’t have the confidence that the next cycle is going to match the last one. 
Are you currently working on any programming projects? 
From time to time our users make suggestions, and I will test any idea to see if it will enhance our results. 
What is a common failing of those who are trying to evolve a trading system? 
Using so-called continuous contracts will inevitably lead to unreliable results. Any tech-nique that uses a [[Moving Average|moving average]] will be corrupted when contracts are “hatched” to-gether. I don’t know of any continuous contracts that don’t change the closes. 
Wayne Griffith 
Education: Mathematics, Physics, and Psychology Position(s) Held: System Development/System Assist Broker Favorite Books on Trading: West of Wall Street, Market Wizards, 
Technical Analysis by Jack Schwager, Technical Analysis by John Hill, Sr. 
   
Anticipation is again in the top 10 list. To what, in general, do you attribute 
its strong performance? 
By “again” I know you are speaking about the “top 10 for the last 12 months” list, be-cause Anticipation has been on the “top 10 since release” list continuously since having
Interviews with Developers 263 
been tracked the requisite 18 months. It will come and go from the “last 12 months” list according to how good or poor the coffee market is, since that is the market you report. I hope I do not sound egotistical when I attribute the strong performance to the trading methodology, and not to the coffee market. Coffee has for the last couple of years shown some life only long enough to get us excited to trade and then dwindles away month after month to a boring nothing. 
What led you to trading systems development and what inspired you to create 
Anticipation? 
Poor seat-of-the-pants trading led me to trading systems development. A brief recap: Catching the crash of ’87 with OEX put options after only six months of full-time trading for a living led me to think windfall profits were easy. The net percentage gain from the options was windfall even after being cheated out of about two-thirds of the profit via a very, very delayed fill on Tuesday following crash Monday. I immediately switched to futures trading because I never again wanted to experience such a delayed fill or to be told the fill was delayed while in reality someone else pocketed my money. 
The first few months of trading stock index futures in the wild, choppy, gappy mar-ket that followed the crash was a disaster. I should not have traded in that environment, being a novice, should not have traded three contracts at the time, should not have kept them overnight and incurred five-digit stop-out losses on [[Gap|gap]] openings the next day, and should not have lost all the money I made on the crash plus some more. How could I do this? How could anyone do this? I did it because I believed regular big profits were imme-diately ahead. (I traded small and waited for good opportunities with small risk during my first six months of full-time trading in which I traded the OEX options successfully, but after the crash windfall I immediately developed a mentality of quick big profits.) I did it because I didn’t realistically consider the possibility of loss. I did it because I over-traded, risking too much on single trades. I did it because I never stopped to think about money management. At first I thought I did it because of inadequate trading methodol-ogy, but later as I moved forward from the novice state I realized I did it because of the absence of money management. 
Not yet fully cognizant that my largest problem was money management, I deter-mined to improve my trading methodology. Having spent my lifetime in large-scale com-puterized modeling and simulation, I decided to develop a computerized model that would allow me to see how well a trading procedure had worked in the past before risking money on it in the future. The IBM and compatible personal computers failed to be adequate. I heard about Futures Truth and went to North Carolina to see them. They were nearing completion of a program that would facilitate testing trading procedures, and it was to run on an Apple Macintosh, which was far superior in capability to the IBM/compatibles. I asked Mr. Hill if he would sell me a copy of the program. He said he had not had thoughts along that line. Nevertheless, he was kind to me and I took home a program for $2,000 that would have taken me probably the better part of a year to develop on my own. I ordered a $13,000 Macintosh system to run it on—Macintosh was more expensive than IBM back then. Inspired by the capable tools I now had, I then spent
264 BUILDING WINNING TRADING SYSTEMS WITH TRADESTATION 
numerous years, day and night and weekends, too, using the Excalibur testing system to investigate the commodities markets. I didn’t do anything else for years. I hold the world record for Excalibur testing hours, far surpassing even Futures Truth because they had other activities taking their time, plus they went home nights and weekends. 
What inspired me to create Anticipation specifically? This has a two-part answer. First, the technical inspiration. I wanted a system that made a multitude of trades so that it would have a huge historical trade history to provide confidence that the procedure would hold up in the future. I wanted a procedure that overall got more out of various-length trends than a typical trend-following procedure—it thus had to trade both the trend and the retracements. I wanted it to trade retracements for the additional purpose of being positioned the correct direction quickly in case what looked initially like a re-tracement was in fact the end of the trend. It had to be quick enough to change from trend to retracement and back that it would function well when the market turned choppy in-stead of trending. It had to be based on bar chart patterns only (no lagging indicators allowed) to be fast enough to change directions in an anticipatory manner. I should have made provision for a sideways listless market but did not. To match my personality, it could initiate a long position only when prices were rising and could initiate a short po-sition only when prices were declining. Also, it could not remain long when prices were declining, and it could not remain short when prices were rising—even if it meant that sometimes it would get chopped around switching back and forth with the market direc-tion. This requirement was because I was always fearful that a small move in the wrong direction would turn into a large move. Odd as it may sound, I developed Anticipation emphasizing psychological comfort to trade rather than emphasizing profitability. Last, but very instrumental, I attended a Futures Truth seminar toward the end of the ’80’s in which John Hill said that simple bar charts tell you everything you need to know about a market. He also said you must anticipate the markets. When John Hill speaks, I lis-ten, and those two comments plus Excalibur testing system provided me the basis and tools to develop Anticipation. I named the trading system Anticipation in appreciation of this. Mr. Hill also stated that money management was the largest part of any trading decision—too bad I didn’t hear that comment before I squandered my crash money! 
The coffee market has a reputation for slippage. How has your experience been 
with fills and [[Liquidity|liquidity]]? 
Once I traded five months without any unpleasant slippage. Once, for an entire month, I was robbed on almost every trade, including a limit order executed past the limit, and the damage was so bad I shut down trading. Now, if I encounter unacceptable slippage, I find a different floor broker, or enter trades via limit orders and also attempt to exit via limit orders, or bypass trades set up for potentially large slippage. 
Does your system require intraday monitoring? 
Yes, it requires constant attention. It doesn’t make time-management sense to trade it yourself unless you are a full-time trader.
Interviews with Developers 265 
You must be very busy. Does futures trading and programming ever interfere 
with your personal life? 
Personal life? What is a personal life? I have a vague memory that it is a nice thing. I would like to experience it again. Soon. To that end, I am in the process of making changes to the way I approach the futures and systems business. What I have been trying to do is too much for one person, but I’ve always worked alone to preserve the secrecy of my research results. My personal focus now is trading for a living. For additional income, I registered with the CFTC and NFA as a broker so that I can provide limited system assist [[Support|support]]. By limited I mean I will trade for a limited number of clients any or all of the systems I’m trading for myself, upon proof of subscription and suitability to trade. I don’t want to use my time tracking systems I’m not trading for myself. 
Do you have any other commentary that you would like to share with the 
Futures Truth readers? 
I’ve put aside my pride and responded to these interview questions fully, discussing not only my strengths and achievements, but also my weaknesses and mistakes. I believe this will help someone—it would have helped me had I read a similar discussion long ago. We small-scale futures traders are in the most difficult arena I’ve ever experienced, and I wish you all well. 
Mike Barna 
Education: B.S., Mathematics, Arizona State University; M.S., Astronautical and Aeronautical Engineering, Stanford University 
Position(s) Held: President, Trading Systems Design and Analysis Favorite Book on Trading: A Non-Random Walk Down Wall Street, by 
Andrew W. Lo and Craig MacKinlay 
   
R-Mesa consistently ranks near the top of our list; to what do you attribute its 
strong performance? 
R-Mesa was developed over S&P intraday data dating back to 1982. In addition, it tests well on international markets like the FTSE and FIB. Further, the technology combines elements of MESA and R-Breaker, both well known and mature. The bottom line with this effort is that it produced what I believe is a robust trading system with known draw down characteristics that should continue to exhibit superior performance in the fu-ture. Of course there is no guarantee that this or any other system will be profitable in the future. 
What advice do you have for those who trade yours or any other system? 
There are several key issues you need to know when system trading. First, know your system. Know its weak points and strengths. Learn its negative risk characteristics and
266 BUILDING WINNING TRADING SYSTEMS WITH TRADESTATION 
positive reward characteristics. Understand that the draw down and maximum consec-utive losing trades numbers are your numbers. You either designed, bought, or leased these numbers. Understand that these are your numbers and they may sooner or later be reflected in your account. If your account is undercapitalized, relative to these num-bers, and you stop trading at the bottom of a draw down, then you are selling, if you will, at the exact low of the market move. Likewise, if you start trading at the top of an equity swing high, just prior to a draw down, you may be buying the top of the market, just prior to a swing down in equity. Unfortunately, watching from the side-lines how much money a system made recently entices you to jump in, possibly at the exact intermediate-term top in the equity curve. Similarly, learning that your fa-vorite system you follow is in the midst of a large draw down is not very appealing to jump in. 
By trading a system you are in effect going long the system with a buy-and-hold mentality. Most system traders I have spoken to know that jumping in and out of the system is counterproductive, yet many still try to second-guess the system with the re-sult of overtrading the system equity curve. If you believe your system is really robust and has a good chance of being successful in the future, plan on adequate capital to trade the system and plan for the inevitable draw down that will surely come. Know your numbers. 
Additionally, your trading infrastructure must be perfect. When the system equity curve was created, it was done so without missing a trade, going on vacation, getting sick, having data feed problems, having computer problems, getting missed or bad fills, and so on. The equity curve was created with perfect execution. Likewise your execu-tion needs to be perfect. You can’t second-guess the system. You can’t throw emotional overtones into the execution of the signals. System trading was not meant to be emo-tionally pleasing. If anything, it turns out to be emotionally difficult, but this difficulty can be ameliorated with adequate capital, knowing that the potential draw down is well planned for and that human intervention will be needed only if a predetermined level of draw down (risk) is exceeded. If you have a second thought, read filter, for your system, then test that filter and see if it holds up in testing. Your filter may just turn out to be a one-time wonder. If you are second-guessing the system, you are not system trading but attempting to extract information from the system using it as an adjunct for your discre-tionary trading, using it as an indicator in effect. This hybrid type of trading is in effect using a buy or sell rule that may be only 35 percent accurate. Clearly, using a system as a forecaster or leading indicator is inefficient since the system is meant to be traded as a system and not meshed in with other discretionary tactics. 
What do you think the hot markets are this year? 
The grains are showing up on many traders’ radar screens as potential intermediate-term movers. I also like the stock index futures and the bonds. System traders are particularly fond of markets that are exhibiting a higher degree of volatility since [[Breakout|breakout]] systems like volatility, whereas horizontal markets chop them up.
Interviews with Developers 267 
Are you working on any new projects that you can tell us about? 
The research is ongoing, continuously creating hundreds of new systems and ana-lytical approaches. Of particular interest now are approaches capturing inefficiencies in the market elements generally overlooked prior to the introduction of newer data mining engines, genetics, neural networks, and other nonlinear algorithms. Further, an advance in the integration of the Maximum Entropy Spectrum Analysis into cur-rent research has showed promise. John Ehlers and myself have been deeply involved in research into various modeling algorithms incorporated into trading systems. This research includes intermediate-term stock systems as well as short- and long-term commodity systems. 
What do you think about stock trading systems? 
The development of stock trading systems is far more difficult than developing a com-modity system since in the commodity world you need to be concerned with just one time series per system. In the stock world, your system needs to work on hundreds of individual time series, each one exhibiting unique characteristics. Our work in this area started by evaluating generic trend-following systems that have historically been shown to work quite well over large sets of markets like channel [[Breakout|breakout]] systems. Baselining stock portfolio systems against buy-and-hold approaches gave us performance targets with which to compare the performance of these systems. In the near future, we will see many more stock systems made available to those who wish to trade systems on baskets of stocks. The stock system trading industry pertaining to the individual trader is just now in its infancy. 
As a professional TradeStation PowerEditor programmer, what do you think 
of the security issues with black-box systems that are built into TradeStation 
2000i? 
The bottom line here is that if you have a system that you believe is superior and you are unwilling to subject it to potential security compromise, then never give it to any-one, never share the technique with anyone, and never sell it. History has shown that just about anything can be cracked, so you should never rely on any security layer as impervious. To further protect your technique a DLL programmed for TS 2000i is an option. If you wish to share or sell your system, then considering a DLL-coded system is critical. 
Do you have any other commentary that you would like to share with the 
Futures Truth readers? 
By keeping track of our sample or walk-forward testing such as presented here in Futures Truth, you have taken the first step toward proper investigation of trading systems you are planning to trade and understanding the system-specific draw down characteristics.
268 BUILDING WINNING TRADING SYSTEMS WITH TRADESTATION 
Ziad Chahal 
Education: Political Science, American University of Beirut Position(s) Held: Full-time trading-system developer and vendor 
(Alfaranda, CTA) Favorite Book on Trading: The Futures Game: Who Wins? Who Loses? Why?, 
by R. Teweles and F. J. Jones 
   
What do you think the hot markets are this year? 
I don’t allow myself the luxury of giving similar predictions since similar attempts are invariably wrong. Traders’ lives would have been much easier if any of us knew what would be the next trending market. Simply said, nobody does. And that’s exactly why even the money management gurus can never emphasize enough the need to diversify through markets, system matrices, and money management techniques. 
What do you think about stock trading systems? 
I still have to see one that actually beats the simple buy-and-hold policy in a nonopti-mized long-term test! Trading results are directly related with the involved risks. Since the buy-and-hold system is the one that carries the larger possible risks on a stock-by-stock basis it is an unbeatable system. We can easily come up with trading methodolo-gies that outperform it on a very large number of stocks but not the whole stock universe while that universe knows only one trading direction, up and then up again. It may be a different story in an extended bear market. But since that has not been the case for the past 20 years or so, and since there is no valid indication that this market characteristic is changing its face anytime soon, the best would be to exercise the least in trading-entry/exit judgments! 
Here is the best illustration: 90 percent of the billion-dollar stock fund managers constantly fail to beat the S&P500 Index, although they also simply buy and hold stocks. Obviously, their assumption that they can outsmart the market by “picking” the best stocks for their portfolio holdings is not helping them, either. And that applies whether they use technical or fundamental analysis techniques in their stock-picking decisions. 
Your BASIS and ARCS systems consistently rank near the top of our list. To 
what do you attribute the strong performance? 
I have a rather shocking answer. I am convinced that a deep valley actually exists between simple technical analysis studies and the methodologies used in successful sys-tems. Technical functions and indicators are mere tools that never are more than 50 per-cent right. Yet each of these tools has a characterizing personality that can be used by the professional developer to produce a more-or-less robust and solid system. Three years ago, I thought it would be impossible to have long-term successful systems if the method-ology is not optimized for each market environment. I owe to the “unknown soldier” his
Interviews with Developers 269 
consistent encouragement and the fact that he persuaded me to follow on the track of releasing systems that have a minimum number of parameters and some simple trading rules that can and should be applied on absolutely all markets. I like to think that this is the main factor behind the relative success of my systems, although this nonoptimiza-tion process does not offer in itself any guarantee of future trading results, especially on a short-term basis. 
What advice do you have for those who trade yours or any other system? 
We first have to admit that systematic trading is a very hard proposition since it means committing one’s money to ideas that have been studied or developed by the final user, a factor that is bound to hang huge doubts in the trader’s mind. 
Furthermore, systematic trading also is a relatively dull experience that does not answer to the natural need for that fulfilling adrenaline charge we all look for. In fact, the vast majority of those who use systems have started trading their own discretionary ideas. They experience the losses and the nerve-breaking emotions and finally take the decision to trade systematically. Yet, they always seem to be unable or unwilling to let the system work its way without interfering in its signals. 
I can bet that a good number of the systems tracked by your magazine are solid and robust enough to be the rival-envy of many professional future fund managers. Neverthe-less, these managers constantly make money when our usual clientele loses it. And there can be only one reason: They wisely manage their funds when our “systematic” traders are still attempting to manage their emotions. 
In short, the decision to trade systematically is an excellent step in the right direc-tion, but the job cannot be completed if you are still looking for ways to beat the markets at the rhythm of 200 percent a year. Try adequate capitalization and unwavering disci-pline. They work wonders even with defective trading systems. 
Are you working on any new projects you can tell us about? 
I released in March a new system called ONIX that is a frequent position trader for stock-index futures. My newest (July) release, though, is WEAVER: a happy discovery of an astoundingly robust methodology that works with one parameter that is vastly applicable for longer-term trading of all commodity markets while equally offering the possibility of short-term trading the stock-index futures. I hope my work is improving with time. You and my customers will be the judge. 
You must be very busy. Does futures trading and programming ever interfere 
with your personal life? 
Well, it always does. Right? The truth is it used to interfere more a few years ago when I used to spend 16-hour days in front of my computer testing various trading ideas. I remember times when the absorption was so great I never stepped outside my home-office for a two-month period. Thanks to my loving wife and forgiving kids. Their [[Support|support]] was crucial.
270 BUILDING WINNING TRADING SYSTEMS WITH TRADESTATION 
Whom do you admire in the industry? Why? 
I am a fan of John W. Henry, who happens to have the largest CTA firm and an envi-ably consistent track record. I have been blessed over the past few years with many friends who have offered me a great deal of much-needed encouragement and [[Support|support]]. Of them, I am particularly impressed with a reader of this magazine (whom I won’t name) who, besides his unconditional true friendship, has proven to me over the past three years that he has a very lucid mind and practically has system-development running in his veins. 
Do you have any advice for those who are new to trading? 
Systematic trading is a mid-phase between the common discretionary trading and the allocation of your money to a professional fund manager. I dare assure that less than 1 percent of new traders who decide to trade their own ideas will ever make money. If you do not think you have the material to be in that 1 percent group, then look for a trading system that fits your personal preferences and risk tolerance levels. This is a nonforgiving, very tough business. Be prepared for the worst irrespective of any rose-garden scenario a system developer or a broker or a friend has ever painted for you. 
Do you have any other commentary you would like to share with Futures Truth 
readers? 
We all may have various points of disagreement and/or private opinions about FT [Futures Truth] tracking, system ranking, and general modus operandi. Yet, we all have to agree that this is an invaluable institution without which we all would have been much worse off, be it as future professionals or new or seasoned traders. 
FT deserves our [[Support|support]], and I hope we can all turn in to make of it a real forum that discusses in-depth all systematic trading problems and features. 
John Tolan 
Education: B.S., Economics, University of Illinois Position(s) Held: Chicago Board of Trade, Merrill Lynch, CQG, Managing 
Partner of Trendchannel Favorite Book on Trading: Technical Analysis of Stock Trends, by Edwards and 
Magee 
Steve Marshall 
Education: M.B.A., University of Denver Position(s) Held: Renizon Corporation, CQG, Managing Partner of 
Trendchannel Favorite Book on Trading: Reminiscences of a Stock Operator, by Edward LeFevre 
  
Interviews with Developers 271 
The Trendchannel system has been ranked in our top 10 systems since release 
date for several months now. To what do you attribute its consistent perfor-
mance? 
[Steve Marshall] The Trendchannel is a robust system. Our original concept for what became the Trendchannel, wasn’t a true “system” at all. We wanted to create a simple trend indicator, a tool that would work in any market to tell when the market was trend-ing, the direction of the trend, and consistent [[Support|support]] and [[Resistance|resistance]] levels. Somewhere along the development process we discovered its potential as a complete system. The best times to make money are, of course, in trending markets, and we had developed a very stable indicator that tells you when a market is entering a trending phase, and more importantly, when it’s sideways and not trending—so you can stay out. Once we had our formula, we tested entering a position when our indicator signaled a new trend and get-ting out when it signaled a sideways trend. At that point it didn’t matter how we varied the parameters, it still made money. Changing parameters affected the number of trades, the length of a trade, and the win/loss ratio, but every combination was potentially prof-itable. So, because the system is so robust, it has worked as well in real-time as it did in historical testing. 
[John Tolan] The Trendchannel formula is different from all the other technical stud-ies out there. We developed our system by correcting what we found to be flaws or draw-backs with the other previously available indicators. Our historical testing helped us to further improve our formula design. It is, however, not “optimized.” We use the same formula for all markets and it works well regardless of parameter settings. Our goal was to create an automatic trend indicator that is easy to use—green light, red light—even though the formula behind the bottom-line signals is more complex. The Trendchannel formula combines adaptive measurement of volatility, momentum, and both long- and short-term trend direction. The system defines trends in a way that is consistent with classical trend analysis, but does a better job of keeping you out of sideways (trendless) markets and keeping you in major trends. 
Do you have any advice to those who trade your system or any other system? 
[Steve Marshall] Once you have researched and chosen a system to follow, trade that system’s rules precisely, and give it time to work. Know the system and believe in it. Make sure that you understand how the developer intended the system to be traded and try to do exactly that. If you can’t execute trades the way the system requires, don’t expect to duplicate the system’s performance. If you are unable to follow a system exactly, many brokerage firms have a system-assist division that will trade your account based on the rules of the system. Once you’re following a system, give the trades some time to work. A system with a long-term track record with good results may still have periods of months with no profits. You have to be ready to accept that and stick with the system long enough to see it work. 
[John Tolan] On our Website we offer a free trading guide called “The Simple Rules for Successful Trading.” The information in the guide is good advice for any trader. If you
272 BUILDING WINNING TRADING SYSTEMS WITH TRADESTATION 
can’t apply these rules to our system or any other system, then you will not be successful at trading. 
Is there anything that you would tell those new to trading commodities or 
stocks that you wish someone had told you when you were getting started? 
[Steve Marshall] Have a plan before you start trading. Plan out everything you can. Know when and why you will buy and sell. Know which markets you will trade. When you’re starting, it may be enough to trade in just a handful of markets. Know how much you are willing to risk—in each trade and in your account overall. The more rules you have, the easier it will be to make trading decisions. Also, realize that you shouldn’t trade just to be in the market. Nobody has a system that makes money under any market condition. There are times you should be out of the market, waiting for a signal. Have patience. 
[John Tolan] Oh yeah. . . . That was my initial motivation to write the Trendchannel trading guide—to share this advice. The vast majority of those who begin to trade lose money. That does not happen by chance. It’s predictable because they make and repeat the same basic mistakes over and over again. If you can use a trading system with rules that enable you to avoid making these mistakes, you will be successful. 
What do you think the hot markets are this year? 
[Steve Marshall] Crude oil, natural gas, and the euro currency have been hot markets for us this year. But our approach is trend following. We don’t try to predict anything. We do what the market tells us to do. We go with all trend signals and see what happens. I have no idea of expectation of where the market is going to go; but no matter what it does, I know what I will do, how I will trade it. That’s the security you get trading a purely mechanical system that you have confidence in. 
[John Tolan] The high-volume markets will most likely be the “hot markets.” In other words, where there is volume there will be trends. In addition to price, we track the trends in volume. That’s one of the methods we use to select markets to include in our stock and futures portfolios. 
How do you prepare for your trading day? 
[Steve Marshall] Well, for our futures account, we have a system-assist broker trading the Trendchannel system for us. They execute trades perfectly, plus it is creating an actual trading track record, and frees us from watching the markets. We do our own stock trading based on the end-of-day signals from our Trendchannel Stock Report. I spend less than 30 minutes a day on trading. Once our reports have been generated, I place the trades for the next day’s open. I might check the market once during the day, but generally, I just wait for our report to come out each afternoon. 
Do you think there is a future in technical stock trading systems? 
[John Tolan] Yes, for all of the same reasons we believe there is a future in trading sys-tems for futures. Most beginning traders, including stock traders, try to figure out which
Interviews with Developers 273 
way the markets are headed by looking at charts, analyzing technical indicators, or by reading news and fundamental information. When these approaches fail, they seek other methods or advice. One solution they will find is to trade an automatic system with a proven track record. And, of course, once they figure that out, and find a system, they will also seek help in tracking and entering the trades for the system. That’s why we also believe there is a big future in system-assist services for stocks as well as futures. 
[Steve Marshall] Absolutely. We have many subscribers, including brokers, who use the Trendchannel trading system for stocks. The Trendchannel works just as well with stocks as it does with futures. 
Do you consider stock systems a viable way to trade stocks successfully? 
[Steve Marshall] Yes, no question about it. The volume in stocks can create very strong long-term trends. A purely technical trader can do very well in the stock market. 
[John Tolan] I believe it’s the best way. On our Trendchannel Stock Report, we screen out the 50 most actively traded stocks, the Trendchannel 50. These high-volume stocks have produced some spectacular trends since we started tracking these two years ago. And of course the Trendchannel Trading System does well when markets have big trends. 
Are you guys working on any new projects you can tell us about? 
[John Tolan] We just released the Trendchannel Software for TradeStation. I’ve always thought it would be great to have a trading system that works just like a traffic sig-nal, with automatic “green light, red light” indicators that instantly flash on the charts when to buy and when to sell. That’s exactly what the Trendchannel software does. We are making it available so that anyone can trade the Trendchannel system in any market, in real time, and in any time frame they choose. You can totally automate your trading. 
John Ehlers 
Education: B.S.E.E., and M.S.E.E., University of Missouri; Doctoral work at George Washington University 
Position(s) Held: Electrical Engineer, specializing in Information Theory; President, MESA Software 
Favorite Book on Trading: Trading Systems and Methods (3rd ed.), by Perry Kaufman 
   
R-MESA consistently comes up as one of the top S&P and daytrade systems. 
To what to do you attribute its consistent performance? 
In a word, robustness. R-MESA uses R-Breaker by Rick Saidenberg, one of the Futures 
Truth top 10 systems of all time, as its origin. Mike Barna and I combined R-Breaker
274 BUILDING WINNING TRADING SYSTEMS WITH TRADESTATION 
with the Mesa cycles-measuring algorithm to make the trading signals adaptive to current market conditions. MESA makes it easier to buy at the bottom of the cycle and easier to sell at the top of the cycle. Combining a proven trading system with theoretical considerations was just the beginning. The robustness arises from the extensive out-of-sample testing we have performed on data going back to the beginning of the S&P contract. We know the system will perform well in the future because it has been tested against all kinds of market conditions in the past. 
Do you have any advice to those who trade your system or any other system? 
The biggest error I see traders make is the inability to stick with a trading system through the draw downs. This can be due to a variety of considerations, ranging from undercapitalization to just plain fear. I find this strange, because the major reason for trading systematically is to have the confidence that the system will perform in the future much like it has traded in the past. It is not difficult to scan past performance for the maximum draw down, so the required capitalization can be estimated. It is a virtual guarantee that this maximum draw down will be experienced again, particularly in nonrange-bounded markets like the S&P, and a trader should be prepared to withstand it. I can understand the fear factor where traders are using a black-box system developed by a vendor. It is important that the vendor show both the long-term and short-term historical performance to demonstrate system robustness and that the system has not failed in recent market activity. This whole issue of trust is where Futures Truth comes in. By acting as an independent third party, the trader can have confidence that the system has been exercised by knowledgeable traders and that your unbiased evaluation will establish performance credibility. 
Is there anything that you would tell those new to trading commodities or 
stocks that you wish someone had told you when you were getting started? 
My biggest failure as a trader is being married to a trade. Once I have made a decision to enter a position, I absolutely know I have made the correct decision. When the trade goes against me a lot, then I shift my thinking by saying to myself that I cannot afford to get out now and I will stick it out until the next cycle comes along. This simply means that I lack the discipline to be a discretionary trader. I wish the pitfalls of discretionary trading had been pointed out to me earlier so I could have bypassed the educational expense. I learned a lot, but am now focused on systematic trading. 
What do you think the hot markets are this year? 
I judge performance parametrically. For example, I look at the profit per trade and the MAR Index (net profit divided by draw down). As a small trader, I also look at the return on margin. Having said that, I conclude the oldies are the goodies. As you have pointed out, R-MESA continues to perform well in the uncertain S&P markets this year. I see
Interviews with Developers 275 
some movement to the E-Mini because the slippage can be minimized. I also trade the Treasury bonds. 
How do you prepare for your trading day? 
Believe it or not—nothing. My work has already been done in developing the systems. The entry points are in place and the stops are established. There is nothing left for me to do. I have supreme confidence the systems will perform. I just keep score at the end of the day. 
Do you think there is a future in technical stock trading systems? 
Absolutely! However, trading stocks is vastly different from trading futures. I see stock trading as a two-step process. First of all, with stocks you have to know what to trade. You have already made that decision with futures. Only after you have lined up some likely candidates can you implement a trading system. In this sense, the stock trading system is a market timer. Since most stock traders trade the long side only, the most successful systems will be something primarily designed to tell them when to exit the trade. A parabolic could work well in this scenario. Also, channel [[Breakout|breakout]] systems tend to be relatively robust for stocks. 
Do you consider stock systems a viable way to trade stocks successfully? 
Given that people have now found that stocks can and do decline in price, I think it is the only way the small investor can successfully trade stocks. For example, a system will enforce the discipline to get out of a stock position when the price declines. As I said, that is my own trading weakness, and I suspect it is a weakness in many traders. All the other benefits of systematic trading also apply. For example, it might cost $8 commission to buy 100 shares and another $8 to sell. That means, with slippage, that the cost per round turn will be about $0.30 per share. When we test our system, we know we must make at least $0.30-per-share profit, on the average, just to break even. That is more difficult than it sounds. There is no margin leverage with stocks. This means making break-even is more difficult, even with a successful trading strategy, and the profit return on account equity will be smaller than with futures. On the other hand, not being margined means that trading with a system can produce lower draw downs. 
Are you working on any new projects that you can tell us about? 
I have written a new book, Rocket Science for Traders, to be published by John Wiley & Sons. The theme of the book is introducing modern digital signal processing tech-niques to technical analysis. As a result, several novel and unique indicators have been invented—some that could not be programmed without the new processing techniques. I am forever in a research mode. In the course of writing the book, I have started to inves-tigate applying nonlinear filters to match the waveshapes that result from the probability
276 BUILDING WINNING TRADING SYSTEMS WITH TRADESTATION 
density function of nonstationary market prices. This is fascinating stuff, with some pre-liminary successes in creating indicators. My general approach is to develop concepts on theoretical waveforms and then transition to real-world market data. The ultimate proof of performance will be the development of profitable automatic trading systems based on these nonlinear filters. 
Whom do you admire in the industry? Why? 
There are a lot of really great people involved with trading. I admire them in a variety of categories: as businessmen, as traders, and as technicians. When we narrow the industry down to system developers, I have great respect for Bill Brower and Nelson Freeburg for their thoughtful application of first principles. I admire Mike Barna for his vast knowl-edge of what works and what doesn’t work as well as a work ethic that is second to none. Mike and I have collaborated on a number of projects. We work well together because we are kind of a combination of Steinmetz and Edison in our approaches. I like to think about the theoretical aspects, and Mike will try a jillion things until something works. That’s a pretty powerful combination. 
What led you to trading system development? 
Necessity. I have traded my own accounts discretionarily and have been successful. On the other hand, I have had some relatively large declines in equity. I realized that I never knew when my hand went cold, even though I was trading the same way as when I was successful. When I started system development based on my own discretionary rules I found that, indeed, I was getting wild swings in my equity in my hypotheticals. I also found that I was using some rules that were not objective and could not be programmed into a system. By carefully crafting the systems and watching key parameters such as profit per trade, the MAR index, and the profit factor, I found that I could bound the excessive swings. I now could reasonably estimate what I could expect in the way of profit and draw down. 
You must be very busy. Does futures trading and programming ever interfere 
with your personal life? 
Of the 16 waking hours per day we all have, the majority of that time is spent at work. Because of that and because I feel a person is defined by his contribution to society, my priorities are heavily weighted toward work. Besides that, this is fun! How many different ways can one be creative and see the success of that work pay off directly in dollars as well as acknowledgment by one’s peers? 
Do you have any other commentary you would like to share with our readers? 
I would like to thank Futures Truth for providing the service of independent and objec-tive evaluations of commercially provided trading systems. Because they are exercised
Interviews with Developers 277 
by knowledgeable traders like yourselves, your readers can have confidence in their se-lection when it comes time to purchase a system. 
Charles “Chuck” LeBeau 
Education: Degree in Finance from California State University, Long Beach 
Position(s) Held: 1967–1988 Vice President, Regional Futures Director, E. F. Hutton; President—Island View Financial Groups; President—StreakingStocks.com; Founder of System Traders Club; Coauthor of Computer Analysis of the 
Futures Market (with David Lucas) Favorite Books on Trading: Computer Analysis of the Futures Market, by Chuck Le 
Beau and David Lucas; The Ultimate Trading Guide, by John Hill, George Pruitt, and Lundy Hill; Trade Your Way 
to Financial Freedom, by Van K. Tharpe 
   
Sidewinder consistently comes up as one of the top bond systems and as one of 
the top 10 systems since release date. To what to do you attribute its consistent 
performance? 
This is a good example of having a variety of systems each of which is designed to trade a particular phase of a market. The Sidewinder system was designed to be active and to trade countertrend when the bond market is in a broad trading range. It just so happens that the current bond market fits the characteristics the system was designed to exploit. When the bond market stops trading sideways, the Sidewinder system should shut itself down and one of our trend-following systems should start trading actively and perhaps do equally as well. As much as I like Sidewinder, I wouldn’t want it to be my only system for trading bonds. 
Do you have any advice for those who trade any of your systems? 
Watch out for the S&P market these days. I think there is more volatility in that market than we had expected when we originally designed the S&P systems. The high volatility could be a problem. 
Is there anything that you would tell those new to trading commodities or 
stocks that you wish someone had told you when you were getting started? 
Remember that we can always control our losses very precisely but it is hard to control profits. Draw downs and losing periods are usually caused by a reduction in the size of the profitable trades rather than a big string of sequential losers. Be sure to make every effort to maximize the size of your profitable trades by concentrating on timely exits.
278 BUILDING WINNING TRADING SYSTEMS WITH TRADESTATION 
What do you think the hot markets and stocks are this year? 
The stock market will probably continue to be the hot market for the foreseeable fu-ture. I like any stock that has high [[Liquidity|liquidity]], high volatility, and that displays a rapidly rising ADX after coming out of a basing pattern. We list those stocks every day on our StreakingStocks Website. 
How do you prepare for your trading day? 
Whether I am trading stocks or futures, I prepare the night before after the markets are closed. I rarely make any intraday trading decisions. I try to know exactly what I am going to do and I enter all my orders the night before. Then I can sleep late and go out and play golf or work on writing a book or article without worrying about the markets. 
Are you working on any new projects you can tell us about? 
Well, I have gotten very involved in doing research on stock trading in recent years. Some of the strategies I designed for futures trading seem to work even better in stocks. I have the new www.StreakingStocks.com Website up and running and I’m going to start a stock hedge fund later this year. I’m also working on a new book about ex-its and trying to do a revised edition of the Computer Analysis book. I’m also doing some teaching in my workshops as well as private consulting. All of it is keeping me very busy. 
Whom do you admire in the industry? Why? 
I admire Bill Eckhardt, who helped train the “turtles” for Richard Dennis and who is a very successful CTA on his own. I think he really understands trading and how to combine good strategies with sound money management. I wish he would write more articles or a book. 
What led you to trading systems development? 
I was a good discretionary trader who got lazy. It’s a lot easier just to program your knowledge into the computer and let the computer do the analysis and all the hard work. When I was much younger I used to get a big thrill out of trading and making all those critical trading decisions on a minute-by-minute basis. Now I no longer get a rush when I’m trading. I would rather be out playing golf. 
Between the Systems Trader’s Club, StreakingStocks.com, and your commod-
ity systems, you must stay very busy. Does futures trading and programming 
ever interfere with your personal life? 
No, it doesn’t interfere at all. On the contrary, I feel that since I became a systematic trader I actually have a life. I now have time to enjoy my grandkids and work on my golf game instead of watching a computer screen all day.
Interviews with Developers 279 
Do you have any other comments you would like to share with our readers? 
Yes; don’t be afraid to take losses. I think a good attitude about losses is what makes a successful trader. Losses are simply an unavoidable cost of doing business. Also, be sure to monitor your systems on a regular basis and look for weak spots. Too many traders think they only have a problem once their equity is down 50 percent or more so they don’t monitor their systems until the losses get their attention. By then it is probably too late to do anything constructive other than to stop trading before you lose it all. Monitor your systems even when they are winning. There is always room for improvement. 
What do you think is the future in technical stock trading systems? 
I am amazed at what I see going on in the stock market. I regularly see stocks moving 15 percent to 50 percent or more in a day. It will take a very good technician to profit from those short-term moves and the buy-and-hold folks are going to be in for a terribly rough ride. I think that technical analysis is going to become more important and more popular than ever. 
Do you consider stock systems a viable way to trade stocks successfully? 
Yes, no doubt about it. What I like about stock trading is that there are so many stocks we can watch. I can set up some very stringent criteria and if I look at 9,000 stocks I can always find something that is doing exactly what I want. The big problem I have is the close correlation of all the stocks with the general market. If my timing is good on an individual stock but I mis-time the direction of the market, I am going to lose money 9 times out of 10. Timing the general direction of the market over the short run is very difficult but I think it can be done. I’m working on it. 
If you have a preference, would you prefer to trade commodities or stocks on a 
mechanical trading system? Why? 
I have no real preference and I’m willing to go where the opportunities are. I think it is a mistake to approach decisions with an either/or attitude. Most often, “all of the above” is the best answer. Right now, I like the opportunities in the stock market but I would still be watching for opportunities in futures. 
Lundy Hill 
Education: B.S., Electrical and Computer Engineering, Clemson University 
Position(s) Held: Ex-NASA “Rocket Scientist” Engineer; three years in the Pits of the Chicago Exchanges; current full-time trader, CTA, Trading Systems Developer 
Favorite Books on Trading: Market Wizard I and II, John Hill’s early (and late) stuff, The Disciplined Trader, Darvis’s books 
  
280 BUILDING WINNING TRADING SYSTEMS WITH TRADESTATION 
We consider the Stafford S&P Daytrade one of the most consistent systems 
out there today, and it has tested extremely well on NASDAQ. To what do you 
attribute its consistent performance? 
Our Volatility Based Daytrade system is just what its name says. It uses the actual volatil-ity of the S&P 500 market to dictate buys, sells, and exits. So it changes. I think stock index volatility is here to stay. Traders must use that in their plan of attack. 
Do you have any advice for those who trade any of your systems? 
Not only my systems, but any systems. Do your statistical studies. Look at the past performance. Calculate things like the average monthly profit, average daily profit, average profit and loss, and worst-case expected draw down (a rule of thumb says this is the yearly standard deviation). Then you know what to realistically expect when trading. 
Is there anything that you would tell those new to trading commodities or 
stocks that you wish someone had told you when you were getting started? 
Yes. Any trade can have only four possible outcomes. A large profit, small profit, small loss, and a large loss. Three of those are acceptable. 
What do you think the hot markets and stocks are this year? 
Stock indexes. Stock indexes. And stock indexes. 
How do you prepare for your trading day? 
First I analyze my trades for today. Where I was right. Where I can improve. Then I look at the market from a top-down approach. What do I expect long term, short term, and tomorrow. I try to have some idea of what may happen today. Key levels. But, I don’t blindly stick to this perception. If the market proves me wrong, I will try to adapt. 
Are you working on any new projects that you can tell us about? 
We have new NASDAQ systems coming online. But, my immediate goal is the success-ful application and blending of all of our approaches. I think we have the technology right now! But, it is another matter to successfully apply it. I want an overall portfolio approach of systems trading on stocks, futures, and indexes. Long-, intermediate-, and short-term time frames. 
Whom do you admire in the industry? Why? 
I think that should be obvious. Don’t you? 
What led you to trading systems development? 
It seemed the next logical step given my background and my family’s background.
Interviews with Developers 281 
Does futures trading and programming ever interfere with your personal life? 
Sure. You should see Thanksgiving dinner at the Hill house. Five traders around the table. Sure, we are going to talk trading, but, I have other passions in life I pursue with equal vigor. I think that is important to stay fresh in your trading. 
Do you have any other comments you would like to share with our readers? 
Most of the clichés you hear about trading are true. For instance, “limit your losses.” If your average loss is $500, try using a $350 to $400 [[Stop Loss|stop loss]] instead. If your average profit is $500, work on improving your trade entry and profit objective calculations and try to get your average profit to say $600 to $700. Do those two (simple?) things, and I think you will be amazed at the results. 
What do you think the future looks like for technical stock trading systems? 
Great. I think the increase in volatility of individual stocks will lend itself to a system-atized approach to trading stocks. 
If you have a preference, would you prefer to trade commodities or stocks on a 
mechanical trading system? Why? 
I think diversification is one of the tenets of successful trading. Therefore, as I said be-fore, trade and invest in both, and across multiple time frames. 
Peter Aan 
Education: B.M., M.M., University of North Texas Position(s) Held: Professional musician since the age of 15 and has 
performed with symphonies, operas, rodeos, and Elvis; CTA, PWA Futures; Broker, Dillion Gage, Inc. 
Favorite Book on Trading: New Concepts in Technical Trading Systems, by Welles Wilder 
   
All of your systems have shown consistency. However, the last few years have 
been tough for trend followers. To what do you attribute consistent perfor-
mance and why have trend followers suffered through the last two or three 
years? 
It has indeed been a rough road for trend followers in recent years, myself included. Even the legendary Richard Dennis called it quits (again), and the Wall Street Journal 
ran a story on the toll that the markets were taking on prominent CTAs. When you ana-lyze it, we’ve seen the markets do this many times before. What was different this time was the persistent nature of the choppiness. When my programs started into a draw down, I was salivating just a few months later, thinking that the markets were due to go
282 BUILDING WINNING TRADING SYSTEMS WITH TRADESTATION 
into another trending phase soon. Little did I know that we had many more months of rough water. We have had spurts of trending here and there, and my systems have caught whatever trends were there, but it’s been a while since we’ve had what one could call a “normal” year. 
Do you have any advice for those who trade your systems or any other sys-
tems? 
There are three keys to success for any trader, regardless of methodology. 
1. Have a trading plan. 
2. Have the discipline to follow that plan. 
3. Use good money management to help survive the inevitable losing periods. 
That’s it. Of the 95 percent or so of people who lose money, I suspect that virtually every one of them violated one or more of these tenets. Following these three rules won’t guarantee you a spot in the winner’s circle, but your chance is pretty close to zero if you violate them. 
On a more specific basis, before you begin to trade a system, you should examine where it currently is in its equity curve, on both a portfolio basis, and an individual market basis. I feel better starting to trade a system after it’s been doing poorly. 
Is there anything that you would tell those new to trading that you wish some-
one had told you when you were getting started? 
The above three rules are good advice for anyone who hasn’t yet learned them, novice or not. One of the first systems I learned and admired in the early ’70s was Donchian’s Weekly Rule. Sometimes I wish someone had forced me to trade that system and no others! And think of all the money I would have saved on computers and software! Also, a subscription to Futures Truth magazine is a must for any trader who has purchased trading systems. I wish FT had been around during my early years. 
What do you think the hot markets and stocks are this year? 
Coffee, yen, franc, and euro currency. I’m guessing, of course, and I name these only because the currencies and coffee have been the trending champs over the decades. 
How do you prepare for your trading day? 
I download data every evening and run my systems on TradeStation. My orders are typi-cally entered before the opening, and then I am mostly through for the day. 
Do you think there is a future in technical stock trading systems? 
This is not an area in which I have done much work. I suspect that it would be difficult to devise mechanical systems that can match in real time the long-term return of about 11 to 12 percent that stocks have returned over many decades. Many mutual fund managers
Interviews with Developers 283 
have underperformed the market, so one must assume that beating the market is not an easy task. 
Do you consider stock systems a viable way to trade stocks successfully? 
I don’t care much for trading stocks, except perhaps for entertainment, but I do fa-vor holding equities for the long term. Unlike most futures markets, stocks have an organic upward bias to them. Long-term investments in equities take advantage of that bias. 
Coming from a system developer, this may seem like heresy, but here is my long-term “system” for making money in equities. 
a. Make monthly purchases of mutual funds or exchange-traded index funds, preferably in a tax-advantaged vehicle, such as a 401(k). Dollar cost averaging is the eighth wonder of the world. 
b. Diversify among different market segments (large cap, small cap, growth, value, foreign). 
c. Rebalance the portfolio as needed. d. Avoid bonds and individual stocks. e. Don’t even think about timing the market. The market won’t do anything over the 
next 30 days that will make much difference 20 years from now. f. Pray for frequent bear markets. (If you’re still buying equities, why would you want 
them to go up?) 
Are you working on any new projects that you can tell us about? 
I don’t do nearly as much research as I did in previous years. Perhaps it would be a good exercise to “wipe the slate clean” and research some area of technical analysis that is dramatically different from what I have done previously. 
Whom do you admire in the industry? Why? 
I’ve always admired Larry Williams for his creativity, both in system design and system promotion. Larry never bores me. 
What led you to trading systems development? 
I believe that my personality led me naturally to system trading. From the beginning, I have always favored approaches that are mechanical. To come into the office every morning and make trading decisions on every market would be torture for me. For oth-ers, trading a system verbatim would be torture. 
You must be very busy. Does futures trading and programming ever interfere 
with your personal life? 
What personal life? Seriously, since I don’t do a lot of research anymore, I put in a normal 60 hours a week, just like every other American. For entertainment, my favorite pastime is going to the movies.
284 BUILDING WINNING TRADING SYSTEMS WITH TRADESTATION 
Do you have any other commentary you would like to share with Futures Truth 
readers? 
Don’t buy a trading system from the vendor who promises the most. 
Michael Chisholm 
Education: B.S., cum laude, Psychology, University of Maryland Position(s) Held: Technical Engineering Writer on Polaris Submarine 
Missile Program; Trader since 1959; Publish advisory since 1976; President, Taurus Corporation 
Favorite Book on Trading: Trading for a Living, by Dr. Alexander Elder 
   
The last few years have been tough for trend followers. To what do you at-
tribute your Grand Cayman System’s consistent performance and why have 
trend followers suffered through the last two or three years? 
Most market analysts see the past several years of market behavior as extraordinary, and in some aspects they are. I have seen many similar periods of choppiness at different times over the last three decades, but recent years have been different in that the relative lack of trendiness has lasted longer than in the past, and in many cases the markets have at the same time been more volatile than usual. I believe this is a result of the topping out of the economy, changes in the worldwide economic situation, and ever-increasing investor uncertainty. 
The Grand Cayman System has weathered this period well, and I believe that is due to its long-term approach of being able to catch what trends there are and ride them successfully. Also, the fact that the system is not overoptimized has helped it while other, heavily optimized systems, have failed due to the schizoid markets. 
Do you have any advice for those who trade your systems or any other system? 
The primary elements in being successful at system trading are the system itself, money management, diversification, and psychology. 
First, and foremost, you need a system that has proven itself over a sufficient period of time, at least 5 to 10 years, and is not overoptimized. Subscribing to Futures Truth is a good way to select such a system. 
Next, you need to make certain you are well-enough capitalized to trade whichever portfolio of commodities you choose, betting that whatever the maximum draw down has been in the past, it will be exceeded at some time in the future. 
To me, diversification between commodity complexes is important, so that if one group of commodities goes “awry,” the odds are the other companies will make up for it. 
Perhaps, most important is psychology, which entails having the discipline to follow through on all the system’s recommendations precisely as given and the patience to wait for new signals and stay in trades until the system itself calls for an exit.
Interviews with Developers 285 
Is there anything that you would tell those new to trading that you wish some-
one had told you when you were getting started? 
That trading futures can be easy and profitable, but only if one follows the general guides I just gave. If one is into developing his or her own systems, then it is hard, time-consuming work—unless you love research like I do, then it becomes fun. 
I think the psychology of trading may be the most important element, since trading exposes one to all the emotions, from joy to fear, from exhilaration to grief, and the trader must be prepared for all this and be able to deal with it appropriately. 
What do you think the hot markets and stocks are this year? 
I’m anticipating some major bull markets in the grains and precious metals this year, and the currencies cyclically are due for significant upmoves. Given the deflationary environ-ment coupled with building inflationary pressures, predicting price movements for the coming months is more difficult than usual. 
How do you prepare for your trading day? 
We get our download just after dinner, and my partner (wife) and I do the analysis on TradeStation then and place our orders in the morning. Most of the rest of our time is spent doing research, keeping four computers running tests on TradeStation almost 24/7 looking for improvements in technique. 
What is your preference for style of trading? Do you prefer day, short-term, 
intermediate-term, or long-term trading the best? 
For me, it’s a question of profitability and personality. I don’t enjoy [[Day Trading|day trading]], so I don’t do much of it, profitable though it can be. My own preferences are either very short-term trading or very long-term. I believe they can be the most profitable, and they fit my style and personality best. 
You mentioned very short-term and long-term trading as your favorites. Quite 
a disparity here, isn’t there? 
Well, yes and no. Maybe I’m manic-depressive [smile], but I go through periods when I want the excitement of very short-term trading, and then other periods, especially around vacation times, when long-term trading fits my lifestyle and personality best. 
Your Grand Cayman System falls under that long-term category. Overall, do 
you feel that kind of approach is superior to other types of trading, like day 
trading and short-term trading? 
Yes, looking at making money in the futures market more as an investor than as a trader, long-term, and even very-long-term trading is probably the best investment in the world today, assuming of course, you have a valid long-term trading system.
286 BUILDING WINNING TRADING SYSTEMS WITH TRADESTATION 
Are you working on any new projects that you can tell us about? 
Yes, an exciting new long-term system we’re almost finished developing called Horizon, which Rachel is programming as a stand-alone windows CD-ROM. I’m working on new versions of my original book, The Taurus Method, as well as my book on the psychology of trading, Games Investors Play. And, just in case that isn’t enough, I’m also outlining a book on long-term trading while both of us continue running research. 
Whom do you admire in the industry? Why? 
This, I know, is nepotism, but it’s my partner and wife Rachel, who in five years as an AP and computer programmer (and web master) is a work of art! 
What led you to trading systems development? 
This could be an entire book, but for brevity it was helping my father develop systems to bet on horses, which was the foundation of my development of system analysis. Inciden-tally, he did pretty good at the track with his system! 
You must be very busy. Does futures trading and programming ever interfere 
with your personal life? 
Trading commodities is our life, corny as that may sound. We do things recreationally of course, but we find our business work not work at all, but play. 
Do you have any other commentary you would like to share with Futures Truth 
readers? 
Yes. Know yourself. Without the right psychological perspective, no matter how sound your system, you cannot succeed for long. 
Michael A. Mermer 
Education: B.A., J.D., Hofstra University Position(s) Held: 1990 to date, President, TradersSoftware.com CTA Favorite Book on Trading: Technical Traders Guide to Computer Analysis of the 
Futures Market, by Lebeau and Luca 
   
To what do you attribute your ETS Daytrade System’s consistent performance 
and why have trend followers suffered through the last two or three years? 
We do not totally agree with the statement “tough” for trend followers. We have found the contrary and ETS has had some of its best years ever the last few years. Many newer systems were designed and optimized for bull markets only. The systems fell apart once the market started to decline. This last year, we have been in a bear market on most major indexes so the system’s design had to take into account what would happen in bear markets. Since ETS was originally designed in 1990, during volatile up and down markets, it has held up very well over time, especially the last few years.
Interviews with Developers 287 
Do you have any advice for those who trade your systems or any other system? 
Trends are defined by the time frame you look at. On a one-minute chart or tick chart, there are dozens of trends per day to trade. As you go up in time frame, the number of trends decreases. You need to find a comfortable time frame to trade that meets with your personality. What works for one trader may not suit another and the number of trades you wish to make per day should determine the time frame you look at. As a general rule, the longer the time frame, the more relevant the data is and more reliable the signals—this goes for most any trading system. 
Is there anything that you would tell those new to trading that you wish some-
one had told you when you were getting started? 
Yes. Expect both wins and losses. If you are looking for a system that has no loser, forget trading and go into another hobby. Systems are best judged by the risk/reward ratio, not the number of wins to losses. You can make a ton of money on a system that is right only 40 percent of the time so long as you have big wins and small losses. The gross number of wins is meaningless without looking at an entire system. And, trading is not for everyone. Don’t be afraid to quit if you don’t like it. If after six months you find you cannot make money consistently, don’t even consider making it into a business. 
What do you think the hot markets and stocks are this year? 
S&P, NASDAQ, and all the major market indexes. I think we have a very volatile big year ahead. 
How do you prepare for your trading day? 
No special warm-up, but start the day knowing you are going to follow your trading system rules. Rule #1—Do the right thing during the day so you don’t have to stay up all night worrying about the mistakes you made during the day. 
Do you think there is a future in technical stock trading systems? 
The markets are traded technically so there is no difference in a stock system versus a futures system. As far as development is concerned, I think, most every algorithm has been tried and developed but there is a possibility someone could come up with a new one. As far as popularity is concerned, the markets are traded technically and trading systems will always be around. Practically no one can beat the odds of a mechanical trading system—even a mediocre one. 
Do you consider stock systems a viable way to trade stocks successfully? 
Yes, a system that works on futures should work on stocks because a chart is a chart is a chart! The system does not care what it is being applied to.
288 BUILDING WINNING TRADING SYSTEMS WITH TRADESTATION 
Are you working on any new projects that you can tell us about? 
Yes, we just released our Java Signals, which are our ETS Signals on very fast tick charts. It would be impossible for us to send out fast [[Day Trading|day trading]] signals manually so we have automated ETS into a Java version and made it available to all those on the Web. There is a free trial at www.traderssoftware.com. Also using the latest technology, we have developed a Live Squawk Box for the S&P Futures at Realtimefutures.com. The squawk box is totally live and an invaluable trading tool. 
Whom do you admire in the industry? Why? 
This is a hard question. No one in particular except other advisors like myself who have the guts to pull the trigger on signals that are traded by hundreds of traders. We know that you can’t judge a system by its performance on any one day, but we know that if traded consistently over time, our systems outperform and make money. 
What led you to trading systems development? 
My basic interest in the markets, my technical computer skills, and in 1990 when TradeStation became available—because it allowed someone like myself who was not a programmer by trade to automate my trading research and discoveries. 
You must be very busy. Does futures trading and programming ever interfere 
with your personal life? 
I try not to let this happen. Too much of anything is not good and this is true of trading as well. Leave yourself time for leisure. 
Do you have any other commentary you would like to share with Futures Truth 
readers? 
Yes, Futures Truth results are great for traders to look at. But, make sure you also like the strategies used in the systems you choose to trade. Just because a system tests well and is ranked #1 doesn’t mean you will like it. Always find out what type of methodology is used in the system and make sure it is consistent with your personality and overall risk tolerance. 
A T A L K W I T H L A R R Y W I L L I A M S 
by Rob Keener 
Larry Williams is a seasoned trader with over 32 years of experience. He has authored several best-selling trading books. Mr. Williams also won the Robbins World Cup Trading Championship by actually trading $10,000 to $1,100,000 in one year. He is a frequent speaker at seminars where he places real-time trades in front of the audience and gives away the profits!
Interviews with Developers 289 
How do you prepare for your trading day? Understanding that trading is a 
strenuous day-to-day business, is there any ritual? 
I don’t think it’s all that stressful as long as I know where my stops and my entries are. I know the worst thing that can happen and I’ve already accepted that can take place and probably will. So where’s the stress? I think it’s something we induce in ourselves by worrying about every tick and price. I figure I’m not going to worry; it’s just going to happen. 
So, you don’t do yoga? 
No, I come to the markets with a pretty basic approach. A lot of commodity traders get beat up on occasion, not rare occasions, but frequently. So, I just have accepted that; I think it’s the acceptance of it that gets rid of the stress. 
Do most people create failure in their trading strategies? Is it that they don’t 
just go ahead and accept the risk and understand that there is stress involved? 
Yes! They don’t place stops. So of course they’re stressed because they don’t know what’s going to happen to them. 
So they are taking the first profit and letting the losers run? 
Yes; or they don’t even have a target or a stop. They don’t know what to do. They don’t have any rules. Any situation, whether it’s life or it’s the markets, if you don’t have any rules, you’re going to create insanity real quick. 
Do you think it’s possible to use a purely systematic approach without any 
discretion at all? 
Sure, it’s possible, and I’ve gone through that where I’ve traded purely systematically. I think that on occasion you can make a judgment call because the future is never like the past and all of our systems are based on the past and things do change. There is a point where you can use some discretion in the market, not a lot. If you need to make a judgment call, then that’s okay; just don’t do it every day because then you don’t have a system. 
Are you constantly developing systems or do you have four or five concepts 
that you follow? 
I’ve got about four concepts. I just keep going down those same tunnels looking for some cheese. My mind is in one mode. I keep mining the same approaches. 
Do you think there is an advantage in diversification? (You can diversify over 
time, markets, and strategies.) 
I don’t like to diversify. If you have a trend-following system that catches trends, you probably need some diversification. I just trade S&Ps and bonds. That’s it, nothing else.
290 BUILDING WINNING TRADING SYSTEMS WITH TRADESTATION 
I have some stuff that’s held up pretty well after a long time period, so I’m just going to trade that. My only diversification would be various entry techniques. 
Where do you think it’s all going? I talked to a floor trader who trades in the 
S&P pit for a bank, and he was concerned that a lot of guys in Chicago are 
worried that the pits are not going to be around forever. 
When you look across the world you see the Sydney Futures Exchange has gone elec-tronic, it’s happened in Europe; my prediction is that the Chicago Board of Trade is going to become a very nice shopping center. There will be some warehouse full of computers and that will be the future of the commodity exchange. 
So you have four or five different basic systems? 
I use approaches. I use volatility [[Breakout|breakout]]. I use pattern recognition. I use a little momen-tum and I rely a lot on the fundamental setups of the market. 
Do you have a mechanism that you screen for potential setups and then you 
go in with discretion? 
Not much discretion—it’s pretty clear-cut. Like today, I had a specific buy at yesterday’s high and when the price went to that point the signal said to go long, so I went long. 
What kind of stop do you put on that? 
Stops are interesting. What I’ve found to be the best type of stop, it’s not some magical price point. I don’t believe in that. That’s a bunch of bunk. I think the purpose of the stop is to protect your equity. My stops are based on dollar amounts. I know that I cannot lose more than x number of dollars, I don’t care if there’s a chart point real close or if that supposedly valid chart point is a mile away. It’s not about my money; my money can only be protected absolutely, and it’s much more than a dollar stop or some mystical number. If I say I can only risk x number of dollars, it’s the fact that I can only lose x number of dollars. 
Would you ever use something like the range of the market? 
I would default to either the range or a volatility type of stop or x dollars. I can’t go beyond x dollars. With a volatility stop you might have a stop that’s so gargantuan that you get a huge loss, so you will default to x dollars. 
What data format are you using with that? 
I’m lying to my data so it looks like it’s 28 years ago. At some point I’ll get either TradeStation or I’ll hear that there is some other software coming out. I’ll have to ad-just. There’s a lot to system writer; it does so many wonderful things that other software doesn’t do.
Interviews with Developers 291 
Have you ever had any situations where you felt like being able to move the 
market was an advantage? 
No. In the old days when I started trading stocks, the really, really old days in the early 60s, if I would put a recommendation on the hotline, it could move the market, but there’s no advantage to it because it becomes a blip in price. 
You have to [[Support|support]] it? 
Right; it’s an aberration and somebody’s going to come in on the other side and say “I’m selling.” No advantage in that! 
Imagine someone came up to you and said, “I want to become a money man-
ager.” What kind of advice would you give this person? 
I’d tell him to think long and hard about it because you have to have so many regula-tions. You have to have the personality for it. I don’t have a personality that justifies existence with the United States government and regulatory bodies, accountants, and lawyers. That’s just not me. I’m not interested in that, but for somebody who is and has that business background, which I don’t have, it may be a good business. But you better have a system—you better have a good modality to trade from. The first thing is, do you have the wherewithal to deal with bureaucrats? 
So, the people who want to know about their money are a factor, too? 
Well, and you have to be a salesman; you have to be able to go out there and shuck and jive people and you have to keep their money and you have to work with brokerage firms. To me it’s simpler and cleaner just to trade. I’ll never make as much money as John Henry or Paul Tudor Jones. These guys have amassed major fortunes that will last for generations. They have those skills. I don’t have those skills. I barely have enough skills to trade, let alone run a major business. 
So, you basically stick to bonds and S&P’s, you’re not thinking of switching to 
10-year? 
Doubt it, that’s just for my own trading; remember, when I do seminars or hotlines I’ll talk about other markets and a longer-term approach than my own trading. The 10-year looks like it’s starting to pick up some volume. So you’re going to have to take a look at it and see what’s going on. 
Do you think the arbitrage is bringing prices to where they are in check? 
I just think my big deal is that you have to be where all of the speculative wave is. In the mid-80s that wave left T-bills and went to Treasury bonds. T-bills are what we traded back then. You have to watch the volume and see where everybody is. Where the party is, that’s where I’m going.
292 BUILDING WINNING TRADING SYSTEMS WITH TRADESTATION 
What about the gold rush of the NASDAQ and everybody jumping on the band-
wagon trading stocks? In your opinion is it easier to trade the S&Ps? 
The NASDAQ has been so wild! I would prefer to trade the S&P. It’s probably a little tamer, but it’s still wild. It’s not a tame market by any stretch of the imagination but it’s not as wild as the NASDAQ. 
Are you developing any stock trading systems? 
We have stock trading research. The latest thing I’ve been working on is a sentiment index for all stocks that have options on them. It’s really cool. We’ve gone into Web pages and polled advisors to see what the consensus is. It’s like market mayhem for commodities. We have that for stocks. 
Are you going to do that on your ctiming.com site? 
I don’t know what’s going to happen with it. I think Genesis Data will probably distribute it or Bloomberg. 
Is that similar to a strategy using options where you want to own a stock at a 
certain price? 
No, it’s just an indicator. If a vast majority of advisors are either bullish or bearish, we take the other side. These guys have a great record of being wrong. 
So that’s really your selection process? 
Yes, and it’s a great one. 
Once you establish the selection process, then you go in with a momentum 
indicator or something similar? 
Exactly! 
Do you use the same money management techniques for a stock system as you 
do for futures? 
You have to look at your equity and what your potential risk is and how much damage can be done. You know if you’re going to get into a fight, you better see how much the guy can hurt you. 
What do you tell a guy who comes up to you at the seminar and says, “How do 
I get started doing this?” 
You’d better read a bunch of books, start to paper trade first. They never want to paper trade; they think it’s not the same as real trading and that’s true. You know what? When guys go to medical school, I love to put this question to doctors in my audience, “How many of you started to do surgery your first day of medical school?” They use cadavers
Interviews with Developers 293 
until their second or third year. We need some cadavers here to operate on and then see if this is for you. But to just rush in because you’re smart and you made a bunch of money in your business or you got it from your parents or you inherited it, that’s no reason to trade. You’d better learn the basics of this business before you start risking real money—and that’s the cool thing, you can do that! You can actually start to paper trade and see if this stuff fits you. Most people want to rush on in. This is the fast-lane, fast-track stuff. You can get hurt doing this, big time. So, I’d say go slow. 
Do you use the same approach to explain to somebody that this is just a day-
to-day business? I talked to Miles and he said you guys are in there at five 
o’clock in the morning, and we’re on East Coast time but it’s still eight o’clock 
and, you know, it’s every day. Do you try to stress that to people also? 
Well, yeah, I think there’s a lot of swashbucklers who have walked into this business and they think you can sit and stare at a quote machine and make money and it’s work and you have to be alert and you have to come in—this is not Nirvana, this is not an easy path to instant wealth. It sure beats the heck out of having a job or having a boss! It still has its up days and its down days. I’ve never yet found a way to make money where it’s just real easy, where you never have to work or sweat about it—never have found that in my life. You’re not going to find that, I don’t think, and commodity trading is no different. 
How much longer are you going to do it? 
I enjoy this so much. I’ll probably be trading for my entire life. To what point I remain a public figure is undetermined. I’ve started to back out of that a little. Miles Dunbar is taking over my newsletters. He’s doing more and more all of the time and I’m doing less and less. At least that’s the goal. At some point I need to fade into the woodwork. There are a lot of bright guys like Miles coming up that will blow me away. You know, it’s sad to see an athlete performing past his prime and this is no different. 
Whom do you see as the guys stepping up to fill your shoes? It doesn’t seem 
like there’s anyone like John Hill and yourself. You guys are huge in the 
industry. 
That’s an interesting point. It could be because guys like John and me literally traipsed around this country lecturing and talking about commodities for so long; it’s so ingrained in us. The new breed is highly computer, electronic, and stock oriented. They may not have the depth that guys like John have—of knowing what a soybean is, how gold is mined—and that may make a difference. Everybody has become so electronic, we old-timers may have a little better understanding of things. You look at the money managers and there is some new blood coming up. It intrigues me how many of those people, if you look at what they’re doing, they’re doing things that John Hill was doing 20, 30 years ago. They have a little variation and a little different insight, but they are not too far from where John and I have been all of these years.
294 BUILDING WINNING TRADING SYSTEMS WITH TRADESTATION 
So, really there’s one way to do it, and if you can follow the path and stick with 
it you will be successful. Do you think adjusting your psychological makeup 
to be able to handle losses and let the winners run is the crux? 
I think a lot of it is establishing your parameters. If you know going into a trade how bad the loss can be, you can play the game. If you try and play football and it’s not 100 yards to the touchdown, sometimes it’s 95 and sometimes it’s 110 and sometimes there are boundaries and sometimes there aren’t and sometimes there are penalties and sometimes there aren’t. You will create insanity because people don’t have a clue between what is right and wrong. Then they think, “I know what, it’s me, I need to go see a shrink,” so, somebody does a psychobabble number on them. The reality is that if you have a relatively decent approach and you realize that the market’s not perfect and you are never going to be right all of the time, and you just accept that and you have basic rules, then I think you might be a trader. People have these unreal expectations that you can call the market as W. D. Gann supposedly did, though he didn’t. We have evidence of that all over the place. 
If that is your expectation, and since you can never meet that expectation, you’ll go berserk as a trader. You need to realize, hey, this is a business of ups and downs, it’s just like somebody who buys sweaters in the store and some of the sweaters sell and some of them don’t sell. You have to take care of those losses. This is a business.
A P P E N D I X A 
TradeStation 2000i Source Code of 
Select Programs 
BOLLINGER BANDIT 
Vars: upBand(0),dnBand(0),liqDays(50); 
upBand = BollingerBand(Close,50,1.25); 
dnBand = BollingerBand(Close,50,-1.25); 
if(MarketPosition <> 1 and ExitsToday(date) = 0) then Buy("BanditBuy")tomorrow 
upBand 
stop; 
if(MarketPosition <> -1 and ExitsToday(date) = 0) then Sell("BanditSell") 
tomorrow dnBand 
stop; 
if(MarketPosition = 0) then liqDays = 50; 
if(MarketPosition <> 0) then 
begin 
liqDays = liqDays - 1; 
liqDays = MaxList(liqDays,10); 
end; 
if(MarketPosition = 1 and Average(Close,liqDays) < upBand) then 
ExitLong("LongLiq") tomorrow Average(Close,liqDays)stop; 
if(MarketPosition = -1 and Average(Close,liqDays) > dnBand) then 
ExitShort("ShortLiq") tomorrow Average(Close,liqDays)stop; 
295
296 APPENDIX A: TRADESTATION 2000I SOURCE CODE OF SELECT PROGRAMS 
DYNAMIC BREAK OUT II BY GEORGE PRUITT 
{This system is an extension of the original Dynamic Break Out system written 
by George for Futures Magazine in 1996. In addition to the channel break out 
methodology, DBS II incorporates [[Bollinger Bands]] to determine trade entry.} 
Inputs: ceilingAmt(60),floorAmt(20),bolBandTrig(2.00); 
Vars: lookBackDays(20),todayVolatility(0),yesterDayVolatility(0), 
deltaVolatility(0); 
Vars: buyPoint(0),sellPoint(0),longLiqPoint(0),shortLiqPoint(0),upBand(0), 
dnBand(0); 
todayVolatility = StdDev(Close,30); 
yesterDayVolatility = StdDev(Close[1],30); {See how I offset the function call to 
get yesterday’s value} 
deltaVolatility = (todayVolatility - yesterDayVolatility)/todayVolatility; 
lookBackDays = lookBackDays * (1 + deltaVolatility); 
lookBackDays = Round(lookBackDays,0); 
lookBackDays = MinList(lookBackDays,ceilingAmt); {Keep adaptive engine 
within bounds} 
lookBackDays = MaxList(lookBackDays,floorAmt); 
upBand = BollingerBand(Close,lookBackDays,+BolBandTrig); 
dnBand = BollingerBand(Close,lookBackDays,-BolBandTrig); 
buyPoint = Highest(High,lookBackDays); 
sellPoint = Lowest(Low,lookBackDays); 
longLiqPoint = Average(Close,lookBackDays); {Exit long at 1/2 look back period} 
shortLiqPoint = Average(Close,lookBackDays); {Exit short at 1/2 look back period} 
if(Close > upBand) then Buy("DBS-2 Buy") tomorrow at buyPoint stop; 
if(Close < dnBand) then Sell("DBS-2 Sell") tomorrow at sellPoint stop; 
if(MarketPosition = 1) then ExitLong("LongLiq") tomorrow at longLiqPoint stop; 
if(MarketPosition = -1) then ExitShort("ShortLiq") tomorrow at shortLiqPoint stop;
Appendix A: TradeStation 2000i Source Code of Select Programs 297 
DBS II FADE BY GEORGE PRUITT 
{This version of the DBS buys when the original DBS sold and sells when the 
original DBS bought.} 
Inputs: ceilingAmt(60),floorAmt(20),bolBandTrig(2.00); 
Vars: lookBackDays(20),todayVolatility(0),yesterDayVolatility(0), 
deltaVolatility(0); 
Vars: buyPoint(0),sellPoint(0),longLiqPoint(0),shortLiqPoint(0),upBand(0), 
dnBand(0); 
todayVolatility = StdDev(Close,30); 
yesterDayVolatility = StdDev(Close[1],30); {See how I offset the function call to 
get yesterday’s value} 
deltaVolatility = (todayVolatility - yesterDayVolatility)/todayVolatility; 
lookBackDays = lookBackDays * (1 + deltaVolatility); 
lookBackDays = Round(lookBackDays,0); 
lookBackDays = MinList(lookBackDays,ceilingAmt); {Keep adaptive engine 
within bounds} 
lookBackDays = MaxList(lookBackDays,floorAmt); 
upBand = BollingerBand(Close,lookBackDays,+bolBandTrig); 
dnBand = BollingerBand(Close,lookBackDays,-bolBandTrig); 
buyPoint = Highest(High,lookBackDays); 
sellPoint = Lowest(Low,lookBackDays); 
longLiqPoint = Average(Close,lookBackDays); {Exit long at 1/2 look back period} 
shortLiqPoint = Average(Close,lookBackDays); {Exit short at 1/2 look back period} 
if(Close > upBand) then Sell("DBS-2 Buy") tomorrow at buyPoint limit; 
if(Close < dnBand) then Buy("DBS-2 Sell") tomorrow at sellPoint limit; 
if(MarketPosition = 1) then ExitLong("LongLiq") tomorrow at longLiqPoint limit; 
if(MarketPosition = -1) then ExitShort("ShortLiq") tomorrow at shortLiqPoint limit;
298 APPENDIX A: TRADESTATION 2000I SOURCE CODE OF SELECT PROGRAMS 
KING KELTNER PROGRAM BY GEORGE PRUITT 
{This program—based on a trading system presented by 
Chester Keltner—is an example of a simple, robust and effective strategy.} 
Inputs: avgLength(40),atrLength(40); 
Vars: upBand(0),dnBand(0),liquidPoint(0),movAvgVal(0); 
movAvgVal = average((High + Low + Close)/3.0,avgLength); 
upBand = movAvgVal + AvgTrueRange(atrLength); 
dnBand = movAvgVal - AvgTrueRange(atrLength); 
{Remember buy stops are above the market and sell stops are below the market— if the market gaps above the buy stop, then the order turns into a market order 
vice versa for the sell stop} 
if(movAvgVal > movAvgVal[1]) then Buy ("KKBuy") tomorrow at upBand stop; 
if(movAvgVal < movAvgVal[1]) then Sell("KKSell")tomorrow at dnBand stop; 
liquidPoint = movAvgVal; 
if(MarketPosition = 1) then ExitLong tomorrow at liquidPoint stop; 
if(MarketPosition = -1) then ExitShort tomorrow at liquidPoint stop;
Appendix A: TradeStation 2000i Source Code of Select Programs 299 
MYADXSYS 
Inputs: adxLength(14),mavLength(9),mavLength2(19); 
Vars:adxVal(0); 
adxVal = Adx(adxLength); 
if(adxVal>=15) then 
begin 
if(Average(Close,mavLength1) crosses above Average(Close,mavLength2)) then 
buy tomorrow at High stop; 
if(Average(Close,mavLength1) crosses below Average(Close,mavLength2)) then 
sell tomorrow at Low stop; 
end; 
if(adxVal<15) then 
begin 
if(MarketPosition = 1) then ExitLong next bar at Lowest(Low,4) stop; 
if(MarketPosition = -1) then ExitShort next bar at Highest(High,4) stop; 
end;
300 APPENDIX A: TRADESTATION 2000I SOURCE CODE OF SELECT PROGRAMS 
MYMOMRSI 
{Combines Momentum and the [[RSI]] into one strategy and incorporates built-in 
protective stop and trailing stop functions.} 
Inputs: momLength(14),[[RSI|rsi]](14),protStop$(3000), 
trailStopThresh$(3000),trailStopPrcnt(25); 
if(Momentum(Close,momLength)>0 and 
[[RSI]](Close,rsiLength) crosses below 60) then 
{crosses below means the same as 
[[RSI]](Close,rsiLength)[1]>60 and [[RSI]](Close,rsiLength)<60} 
begin 
Buy("Mom+RetB")next bar at Lowest(Low,3) limit; 
end; 
if(Momentum(Close,momLength)<0 and 
[[RSI]](Close,rsiLength) crosses above 40) then 
begin 
Sell("Mom-RetS") next bar at Highest(High,3) limit; 
end; 
SetStopLoss(protStop$); SetPercentTrailing(trailStopThresh$,trailStopPrcnt);
Appendix A: TradeStation 2000i Source Code of Select Programs 301 
MYMOVAVGSYS 
{Demonstrates the use of nested function calls.} 
Inputs: movAvgLength1(9),movAvgLength2(19),channelLength(20); 
value1 = Highest(Average(Close,movAvgLength1),channelLength); 
value2 = Lowest(Average(Close,movAvgLength1),channelLength); 
Buy tomorrow at value1 stop; 
Sell tomorrow at value2 stop; 
{MyStrategy-1 or MySignal-1—TradeStation 2000i Format 
The hello world program of EasyLanguage} 
Inputs: longLength(40),shortLength(40); 
Buy tomorrow at Highest(High,longLength)stop; 
Sell tomorrow at Lowest(Low,shortLength)stop;
302 APPENDIX A: TRADESTATION 2000I SOURCE CODE OF SELECT PROGRAMS 
MYTRAILPRCNTSTOP 
{User defined/programmed percent trailing stop.} 
Inputs: trailStopThresh(3000),trailStopPrcnt(25); 
Vars: maxPositionProf(0),longLiqPoint(0),prevMarketPosition(0); 
if(marketposition <> 1) then buy tomorrow at Highest(high,10) on stop; 
if(marketposition <> prevMarketPosition) then maxPositionProf = 0; 
prevMarketPosition = MarketPosition; 
if(marketPosition = 1) then 
begin 
maxPositionProf = maxlist(High-entryPrice,maxPositionProf); if(maxPositionprof*bigPointValue>trailStopThresh) then 
begin 
longLiqPoint = EntryPrice + (maxPositionprof*(1-trailStopPrcnt/100); ExitLong next bar longLiqPoint stop; 
end; 
end; 
SetStepLoss(3000);
Appendix A: TradeStation 2000i Source Code of Select Programs 303 
SEASONAL SOYBEAN 
Inputs: goLongStart(301),goLongEnd(701),goShortStart(702),goShortEnd(228); 
Vars: monthAndDay(0); 
{The inputs represent the months and days that we can enter long and short trades} 
{301 is March 01 >> can only go long from this date and up to 
701 is July 01 >> this date 
702 is July 02 >> can only go short from this date and up to 
228 is February 28 >> this date} 
{Let’s use the date and extract the information that we need to determine the 
month and day} 
{If we divide the date by 10000, the remainder is the month and day. We can use 
the modulus function which determines the remainder of division} 
monthAndDay = Mod(Date of tomorrow,10000); 
if(monthAndDay >= goLongStart and monthAndDay <= goLongEnd) then 
begin 
buy("Seasonal Buy") tomorrow at Open; 
end; 
if(monthAndDay >= goShortStart or monthAndDay <= goShortEnd) then 
{Notice that we had to use "or" instead of "and"—this is due 
to the goShortEnd date is less than the goShortStart date} 
begin; 
sell("Seasonal Sell") tomorrow at Open; 
end;
304 APPENDIX A: TRADESTATION 2000I SOURCE CODE OF SELECT PROGRAMS 
SUPER COMBO BY GEORGE PRUITT 
{This intraday trading system will illustrate the multiple data handling 
capabilities of TradeStation. All pertinent buy and sell calculations will 
be based on daily bars and actual trades will be executed on 5-min bars. 
I have made most of the parameters input variables.} 
Inputs:waitPeriodMins(30),initTradesEndTime(1430),liqRevEndTime(1200), 
thrustPrcnt1(0.30),thrustPrcnt2(0.60),breakOutPrcnt(0.25), 
failedBreakOutPrcnt(0.25),protStopPrcnt1(0.25),protStopPrcnt2(0.15), 
protStopAmt(3.00),breakEvenPrcnt(0.50),avgRngLength(10),avgOCLength(10); 
Variables:averageRange(0),averageOCRange(0),canTrade(0),buyEasierDay(FALSE), 
sellEasierDay(FALSE),buyBOPoint(0),sellBOPoint(0),longBreakPt(0), 
shortBreakPt(0),longFBOPoint(0),shortFBOPoint(0),barCount(0), 
intraHigh(0),intraLow(999999),buysToday(0),sellsToday(0), 
currTrdType(0),longLiqPoint(0),shortLiqPoint(0),yesterdayOCRRange(0), 
intraTradeHigh(0),intraTradeLow(999999); 
{Just like we did in the pseudocode—let's start out with the daily 
bar calculations. If Date <> Date[1]—first bar of day} 
if(Date <> Date[1]) then {save time by doing these calculations once per day} 
begin 
averageRange = Average(Range,10) of Data2; {Data 2 points to daily bars} 
yesterdayOCRRange = AbsValue(Open of Data2-Close of Data2); 
average OCRange = Average(AbsValue(Open of Data2-Close of Data2),10); 
print(date,time,yesterdayOCRRange,averageOCRange); 
canTrade = 0; 
if(yesterdayOCRRange<0.80*averageOCRange) then canTrade = 1; 
buyEasierDay = FALSE; 
sellEasierDay = FALSE; 
if(Close of Data2 <= CLose[1] of Data2) then buyEasierDay = TRUE; 
if(Close of Data2 > Close[1] of Data2) then sellEasierDay = TRUE; 
if(buyEasierDay) then 
begin 
buyBOPoint = Open of data1 + thrustPrcnt1*averageRange; 
sellBOPoint = Open of data 1 - thrustPrcnt2*averageRange; 
end; 
if(sellEasierDay) then 
begin 
sellBOPoint = Open of data1 - thrustPrcnt1*averageRange; 
buyBOPoint = Open of data1 + thrustPrcnt2*averageRange; 
end; 
longBreakPt = High of Data2 + breakOutPrcnt*averageRange; 
shortBreakPt = Low of Data2 - breakOutPrcnt*averageRange;
Appendix A: TradeStation 2000i Source Code of Select Programs 305 
shortFBOPoint = High of Data2 - failedBreakOutPrcnt*averageRange; 
longFBOPoint = Low of Data2 + failedBreakOutPrcnt*averageRange; 
{Go ahead and initialize any variables that we may need later on in the day} 
barCount = 0; 
intraHigh = 0;intraLow = 999999;{Didn’t know you could do this} 
buysToday = 0;sellsToday = 0;{You can put multiple statements on one line} 
currTrdType = 0; 
end; 
{Now let's trade and manage on 5-min bars} 
if(High > intraHigh) then intraHigh = High; 
if(Low < intraLow) then intraLow = Low; 
barCount = barCount + 1; {count the number of bars of intraday data} 
if(barCount >= waitPeriodMins/BarInterval and canTrade = 1) then {have we 
waited long enough} 
begin 
if(MarketPosition = 0) then 
begin 
intraTradeHigh = 0; 
intraTradeLow = 999999; 
end; 
if(MarketPosition = 1) then 
begin 
intraTradeHigh = MaxList(intraTradeHigh,High); 
buysToday = 1; 
end; 
if(MarketPosition = -1) then 
begin 
intraTradeLow = MinList(intraTradeLow,Low); 
sellsToday = 1; 
end; 
if(buysToday = 0 and Time < initTradesEndTime) then 
Buy("LBreakOut") next bar at buyBOPoint stop; 
if(sellsToday = 0 and Time < initTradesEndTime) then 
Sell("SBreakOut") next bar at sellBOPoint stop; 
if(intraHigh > longBreakPt and sellsToday = 0 and Time < initTradesEndTime)then 
Sell("SfailedBO") next bar at shortFBOPoint stop; 
if(intraLow < shortBreakPt and buysToday = 0 and Time < initTradesEndTime)then 
Buy("BfailedBO") next bar at longFBOPoint stop; 
{The next module keeps track of positions and places protective stops} 
if(MarketPosition = 1) then 
begin 
longLiqPoint = EntryPrice-protStopPrcnt1*averageRage; longLiqPoint = MinList(longLiqPoint,EntryPrice - protStopAmt); 
if(MarketPosition(1) = -1 and BarsSinceEntry = 1 and
306 APPENDIX A: TRADESTATION 2000I SOURCE CODE OF SELECT PROGRAMS 
High[1] >= shortLiqPoint and shortLiqPoint < shortFBOPoint) then 
currTrdType = -2; {we just got long from a short liq reversal} 
if(currTrdType = -2) then 
begin 
longLiqPoint = EntryPrice - protStopPrcnt2*averageRange; 
longLiqPoint = MinList(longLiqPoint,EntryPrice - protStopAmt); 
end; 
if(intraTradeHigh >= EntryPrice + breakEvenPrcnt*averageRange) then 
longLiqPoint = EntryPrice; {Breakeven trade} 
if(Time >= initTradesEndTime) then 
longLiqPoint = MaxList(longLiqPoint,Lowest(Low,3));{Trailing stop} 
if(Time < liqRevEndTime and sellsToday = 0 and 
longLiqPoint <> EntryPrice and BarsSinceEntry > 4) then 
begin 
Sell("LongLiqRev") next bar at longLiqPoint stop; 
end 
else begin 
ExitLong("LongLiq") next bar at longLiqPoint stop; 
end; 
end; 
if(MarketPosition = -1) then 
begin 
shortLiqPoint = EntryPrice+protStopPrcnt1*averageRange; 
shortLiqPoint = MaxList(shortLiqPoint,EntryPrice + protStopAmt); 
if(MarketPosition(1) = 1 and BarsSinceEntry(0) = 1 and 
Low [1] <= longLiqPoint and longLiqPoint > longFBOPoint) then 
currTrdType = +2; {we just got long from a short liq reversal} 
if(currTrdType = +2) then 
begin 
shortLiqPoint = EntryPrice + protStopPrcnt2*averageRange; 
shortLiqPoint = MaxList(shortLiqPoint,EntryPrice + protStopAmt); 
end; 
if(intraTradeLow <= EntryPrice - breakEvenPrcnt*averageRange) then 
shortLiqPoint = EntryPrice; {Breakeven trade} 
if(Time >= initTradesEndTime) then 
shortLiqPoint = MinList(shortLiqPoint,Highest(High,3)); 
{Trailing stop} 
if(Time < liqRevEndTime and buysToday = 0 and 
shortLiqPoint <> EntryPrice and BarsSinceEntry > 4) then 
begin 
Buy("ShortLiqRev") next bar at shortLiqPoint stop; 
end 
else begin 
ExitShort("ShortLiq") next bar at shortLiqPoint stop; 
end; 
end; 
end; 
SetExitOnClose;
Appendix A: TradeStation 2000i Source Code of Select Programs 307 
THERMOSTAT BY GEORGE PRUITT 
{Two systems in one. If the ChoppyMarketIndex is less than 20 
then we are in a swing mode. If it is greater than or equal 
to 20 then we are in a trend mode. Swing system is an open range 
[[Breakout|breakout]] incorporating a buy easier/sell easier concept. The trend-
following system is based on [[Bollinger Bands]] and is similar to the 
BollingerBandit program.} 
Inputs: bollingerLengths(50),trendLiqLength(50),numStdDevs(2), 
swingPrcnt1(0.50),swingPrcnt2(0.75),atrLength(10), 
swingTrendSwitch(20); 
Vars:cmiVal(0),buyEasierDay(0),sellEasierDay(0),trendLokBuy(0), 
trendLokSell(0),keyOfDay(0),swingBuyPt(0),swingSellPt(0), 
trendBuyPt(0),trendSellPt(0),swingProtStop(0); 
cmiVal = ChoppyMarketIndex(30); 
buyEasierDay = 0; 
sellEasierDay = 0; 
trendLokBuy = Average(Low,3); 
trendLokSell = Average(High,3); 
keyOfDay = (High + Low + Close)/3; 
if(Close > keyOfDay) then sellEasierDay = 1; 
if(Close <= keyOfDay) then buyEasierDay = 1; 
if(buyEasierDay = 1) then 
begin 
swingBuyPt = Open of tomorrow + swingPrcnt1*AvgTrueRange(atrLength); 
swingSellPt = Open of tomorrow - swingPrcnt2*AvgTrueRange(atrLength); 
end; 
if(sellEasierDay = 1) then 
begin 
swingBuyPt = Open of tomorrow + swingPrcnt2*AvgTrueRange(atrLength); 
swingSellPt = Open of tomorrow - swingPrcnt1*AvgTrueRange(atrLength); 
end; 
swingBuyPt = MaxList(swingBuyPt,trendLokBuy); 
swingSellPt = MinList(swingSellPt,trendLokSell); 
trendBuyPt = BollingerBand(Close,bollingerLengths,numStdDevs); 
trendSellPt = BollingerBand(Close,bollingerLengths,-numStdDevs); 
if(cmiVal < swingTrendSwitch) then
308 APPENDIX A: TRADESTATION 2000I SOURCE CODE OF SELECT PROGRAMS 
begin 
if(MarketPosition <> 1) then Buy("SwingBuy") next bar at swingBuyPt stop; 
if(MarketPosition <> -1) then Sell("SwingSell") next bar at swingSellPt stop; 
end 
else 
begin 
swingProtStop = 3*AvgTrueRange(atrLength); 
Buy("TrendBuy") next bar at trendBuyPt stop; 
Sell("TrendSell") next bar at trendSellPt stop; 
ExitLong from Entry("TrendBuy") next bar at Average(Close, 
trendLiqLength)stop; 
ExitShort from Entry("TrendSell") next bar at Average(Close, 
trendLiqLength) stop; 
ExitLong from Entry("SwingBuy") next bar at EntryPrice - swingProtStop stop; 
ExitShort from Entry("SwingSell") next bar at EntryPrice + swingProtStop stop; 
end;
Appendix A: TradeStation 2000i Source Code of Select Programs 309 
THE GHOST TRADER BY GEORGE PRUITT 
{This strategy keeps track of the simulated trades of a trading system and 
makes real buying and selling decisions based on the performance of the 
simulated system.} 
vars: myPosition(0),myEntryPrice(0),myProfit(-1); 
{Ghost system} 
{Look to see if a trade would have been executed today and keep track 
of our position and our entry price. Test today’s high/low price 
against the trade signal that was generated by offsetting our calculations 
by one day.} 
if(myPosition = 0 and Xaverage(Close[1],9) > Xaverage(High[1],19) and 
[[RSI]](Close[1],9) crosses below 70 and High >= High[1]) then 
begin 
myEntryPrice = MaxList(Open,High[1]); {Check for a [[Gap|gap]] open} 
myPosition = 1; 
end; 
if(myPosition = 1 and Low < Lowest(Low[1],20) )then 
begin 
value1 = MinList((Lowest(low[1],20)),Open); {Check for a [[Gap|gap]] open} 
myProfit = value1 - myEntryPrice; {Calculate our trade 
profit/loss} 
myPosition = 0; 
end; 
if(myPosition = 0 and Xaverage(Close[1],9) < Xaverage(Low[1],19) and 
[[RSI]](Close[1],9) crosses above 30 and Low <= Low[1]) then 
begin 
myEntryPrice = MinList(Open,Low[1]); 
myPosition = -1; 
end; 
if(myPosition = -1 and High > Highest(High[1],20)) then 
begin 
value1 = MaxList((Highest(High[1],20)),Open);{Check again for a [[Gap|gap]] open} 
myProfit = myEntryPrice - value1; {Calculate our trade 
profit/loss} 
myPosition = 0; 
end;
310 APPENDIX A: TRADESTATION 2000I SOURCE CODE OF SELECT PROGRAMS 
{Real System} 
{Only enter a new position if the last simulated or real trade was a loser. 
If last trade was a loser, myProfit will be less than zero.} 
if(marketPosition = 0 and myProfit < 0 and Xaverage(Close,9) > Xaverage(High,19) and 
[[RSI]](Close,9) crosses below 70) then 
begin 
Buy next bar at High stop; 
end; 
if(marketPosition = 0 and myProfit < 0 and Xaverage(Close,9) < Xaverage(Low,19) and 
[[RSI]](Close,9) crosses above 30) then 
begin 
Sell next bar at Low stop; 
end; 
if(marketPosition = 1) then Exit Long next bar at Lowest(Low,20) stop; 
if(marketPosition = -1) then Exit Short next bar at Highest(High,20) stop;
Appendix A: TradeStation 2000i Source Code of Select Programs 311 
THE MONEY MANAGER BY GEORGE PRUITT 
{Demonstrates the programming and use of a money management scheme.} 
{The user inputs initial capital and the amount he wants to risk on each trade.} 
Inputs: initCapital(100000),rskAmt(.02); 
Vars: marketRisk(0),numContracts(0); 
marketRisk = StdDev(Close,30) * BigPointValue; 
numContracts = (initialCapital * rskAmt) / marketRisk; 
value1 = Round(numContracts,0); 
if(value1 > numContracts) then 
numContracts = value1 - 1 
else 
numContracts = value1; 
numContracts = MaxList(numContracts,1); {make sure at least 1 contract is traded} 
Buy("MMBuy") numContracts shares tomorrow at Highest(High,40) stop; 
Sell ("MMSell") numContracts shares tomorrow at Lowest(Low,40) stop; 
if(MarketPosition = 1) then ExitLong("LongLiq") next bar at Lowest(Low,20) stop; 
if(MarketPosition = -1) then ExitShort("ShortLiq")next bar at Highest(High,20)stop;
A P P E N D I X B 
Reserved Words Quick Reference 
# beginalert 
A compiler directive including all instructions between #BeginAlert and #End. 
# begincmtry 
A compiler directive including all instructions between #BeginCmtry and #End. 
# begincmtryoralert 
Compiler directive including instructions between #BeginCmtryOrAlert and #End. 
# end 
A compiler directive used to terminate an alert or commentary statement. 
# endregion 
An editor directive that marks the end of an expand/collapse #Region. 
# events 
A compiler directive used to declare an event block. 
# region 
An editor directive that starts an expand/collapse region including all instructions be-tween #Region and #EndRegion. 
313
314 APPENDIX B: RESERVED WORDS QUICK REFERENCE 
A 
Skip word. 
Ab addcell 
Adds a cell to an ActivityBar row. 
Ab colorintervals 
Specifies the color of AB cells based on user-defined interval. 
Ab getcellchar 
Returns the character stored in a cell. 
Ab getcellcolor 
Returns the color of the character stored in a cell. 
Ab getcelldate 
Returns the corresponding date of a cell. 
Ab getcelltime 
Returns the corresponding time of a cell. 
Ab getcellvalue 
Returns the extra value stored in a cell. 
Ab getnumcells 
Returns how many cells exist in a row-side. 
Ab getzonehigh 
Returns upper boundary of AB zone. 
Ab getzonelow 
Returns lower boundary of AB zone. 
Ab high 
Returns price of highest cell on AB. 
Ab letterintervals 
Returns the letter/number to use for an AB cell based on user-defined interval.
Appendix B: Reserved Words Quick Reference 315 
Ab low 
Returns price of lowest cell on AB. 
Ab modecount 
Returns cell count of row with the most cells (Mode row). 
Ab removecell 
Removes a cell from an ActivityBar row. 
Ab rowheight 
Returns the row height of AB data. 
Ab setactivecell 
Sets a cell-row as the active cell. 
Ab setrowheight 
AB SetRowHeight will change the current ActivityBar’s row (cell) height value. 
Ab setzone 
Set a zone range-box for an ActivityBar side. 
Abort 
Turn the status of the Analysis technique to Off. 
Above 
Detects when a value crosses over, or becomes greater than another value. 
Absvalue 
Absolute value of num. 
Activitydata 
References any bar data element (Open, upticks, etc.) of an ActivityBar. 
Addtomoviechain 
Appends movie file strFile to end of movie chain Chain ID. 
Ago 
References a specified number of bars back already analyzed by EasyLanguage.
316 APPENDIX B: RESERVED WORDS QUICK REFERENCE 
Aiappid 
GetAppInfo parameter: Returns a value unique to the specific Application window. 
Aiapplicationtype 
GetAppInfo parameter: Returns a value to identify the Application tool. 
Aibarspacing 
GetAppInfo parameter: Returns the bar spacing value of a chart. 
Aibidaskmodel 
GetAppInfo parameter: Returns the current Bid Ask Model for OptionStation Analysis. 
Aihighestdispvalue 
GetAppInfo parameter: Returns the highest displayed value when called from a chart. 
Aiintrabarorder 
GetAppInfo parameter: Returns 1 if intrabar orders are generated. 
Aileftdispdatetime 
GetAppInfo parameter: Returns the leftmost displayed bar’s DateTime in a chart. 
Ailowestdispvalue 
GetAppInfo parameter: Returns the lowest displayed value in a chart. 
Aimacroconf 
GetAppInfo parameter: Returns 1 if Macro confirmation is on, 0 if off. 
Aimacroenabled 
GetAppInfo parameter: Returns 1 if Macros are enabled in the UI, 0 if not. 
Aioptimizing 
GetAppInfo parameter: Returns 1 for a chart that is performing optimizations. 
Aioptionstationpane 
GetAppInfo parameter: Returns the current OptionStation pane. 
Aipercentchange 
GetAppInfo parameter: Returns 1 for a chart in percent change mode.
Appendix B: Reserved Words Quick Reference 317 
Aiplotacctcurrency 
GetAppInfo parameter: Returns 1 if the currency setting is Account and 0 if it is Symbol. 
Aipricingmodel 
GetAppInfo parameter: Returns the current Pricing Model for OptionStation Analysis. 
Airealtimecalc 
GetAppInfo parameter: Returns 1 if calculation is cause for a real-time event. 
Airightdispdatetime 
GetAppInfo parameter: Returns the rightmost displayed bar’s DateTime in a chart. 
Airow 
GetAppInfo parameter. Returns the current row in RadarScreen. 
Aispacetoright 
GetAppInfo parameter: Returns the right-bar spacing when called in charting. 
Aistrategyauto 
GetAppInfo parameter: Returns information about strategy automation. 
Aistrategyautoconf 
GetAppInfo parameter: Returns 1 if order confirmation is used. 
Aivolatilitymodel 
GetAppInfo parameter: Returns the current Volatility Model for OptionStation Analysis. 
Alert 
Triggers an alert for an indicator, ShowMe, PaintBar, or ActivityBar. 
Alertenabled 
True/false expression returning True if the Enable Alert check box is selected. 
All 
Specifies all shares/contracts are to be sold/covered when exiting a position. 
An 
Skip word.
318 APPENDIX B: RESERVED WORDS QUICK REFERENCE 
And 
Links two true/false expressions together. True if both expressions are True. 
Arctangent 
Arctangent value of num, in degrees. 
Array 
Used to declare an array. 
Array compare 
This function compares a range of elements between the SrcArrayName and DestArray-Name. 
Array copy 
This function copies n elements from the SrcArrayName to DestArrayName. 
Array getmaxindex 
This function returns the index of the last element of the dynamic array. 
Array gettype 
This function identifies the data type of the elements in the array. 
Array setmaxindex 
This function resizes a dynamic array. 
Array setvalrange 
This function places Val into the range of array elements specified. 
Array sort 
This function sorts the values in the dynamic array identified by ArrayName. 
Array sum 
This function sums the values in the dynamic array identified by ArrayName. 
Arrays 
Used to declare an array. 
Arraysize 
Reserved for use with custom DLLs designed for EasyLanguage.
Appendix B: Reserved Words Quick Reference 319 
Arraystartaddr 
Reserved for use with custom DLLs designed for EasyLanguage. 
Asactive 
Constant value (=1) to test for an account status of Active. 
Asclosed 
Constant value (=4) to test for an account status of Closed. 
Asclosingonly 
Constant value (=5) to test for an account status of Closing Only. 
Asfedmargincall 
Constant value (=7) to test for an account status of Fed Margin Call. 
Asinactive 
Constant value (=2) to test for an account status of InActive. 
Asinvalid 
Constant value (=0) to test for an account status of Invalid. 
Ask 
Modeled ask value of an option (OptionStation). 
Askdate 
Quote field returns the EL date of the last ask. 
Askdateex 
Quote field returns the Julian date of the last ask (to the second). 
Askexch 
Quote field returns the name of the exchange the last ask was sent from. 
Asksize 
Quote field returns the number of units offered at the best ask. 
Asktime 
Quote field returns the time of the last ask. 
Asktimeex 
Quote field returns the time of the last ask (to the second).
320 APPENDIX B: RESERVED WORDS QUICK REFERENCE 
Asliquidatingonly 
Constant value (=6) to test for an account status of Liquidating Only. 
Asrestricted 
Constant value (=3) to test for an account status of Restricted. 
Asset 
Modifier to other Asset-related reserved words (OptionStation). 
Assettype 
Identifies the underlying asset category (OptionStation). 
Assetvolatility 
Reserved for future use in OptionStation. 
Astype 
Used to perform conversions between compatible types. 
At 
Skip word. 
At$ 
Anchors exit prices to the bar where the entry order was placed. 
Atcash 
Constant value (=1) to test for an account type of Cash. 
Atcommentarybar 
True/false expression returning True when Expert Commentary is applied to a bar. 
Atdvp 
Constant value (=4) to test for an account type of DVP. 
Atforex 
Constant value (=7) to test for an account type of Forex. 
Atfutures 
Constant value (=5) to test for an account type of Futures.
Appendix B: Reserved Words Quick Reference 321 
Atfuturesgiveup 
Constant value (=6) to test for an account type of FuturesGiveup. 
Atinvalid 
Constant value (=0) to test for an account type of Invalid. 
Atmargin 
Constant value (=2) to test for an account type of Margin. 
Atshort 
Constant value (=1) to test for an account type of Short. 
Autosession 
Used with session information to refer to auto-detect sessions. 
Avgbarseventrade 
Average number of bars in closed-out even trades. 
Avgbarslostrade 
Average number of bars in closed-out losing trades. 
Avgbarswintrade 
Average number of bars in closed-out winning trades. 
Avgentryprice 
Average price of all currently open entries. 
Avglist 
Average of nums in list. 
Bar 
References a specific bar. 
Barinterval 
Bar interval of datastream currently being analyzed. 
Bars 
References a specific bar.
322 APPENDIX B: RESERVED WORDS QUICK REFERENCE 
Barssinceentry 
Bars since initial entry of position, num position(s) ago. 
Barssinceexit 
Bars since position closed-out, num position(s) ago. 
Barstatus 
Returns 0 for the first tick, 1 for a normal-tick, and 2 for bar-close. 
Bartype 
0 for tick, 1 for intraday, 2 for dly, 3 for wkly, 4 for mnthly, 5 for P&&F. 
Base 
Reserved for future use. 
Basecurrency 
Attribute used to change the currency setting for symbols when different from your account. 
Based 
Skip word. 
Begin 
Used to begin a block statement (e.g., If-Then-Else, For loops, While loops). 
Below 
Detects when a value crosses below, or becomes less than another value. 
Beta 
Quote field returns the most recent Beta value. 
Beta down 
Retained for backward compatibility. 
Beta up 
Retained for backward compatibility. 
Bid 
Modeled bid value of an option (OptionStation).
Appendix B: Reserved Words Quick Reference 323 
Biddate 
Quote field returns the EL date of the last bid. 
Biddateex 
Quote field returns the Julian date of the last bid (to the second). 
Biddirectionnnm 
Quote field returns the bid direction. 
Bidexch 
Quote field returns the name of the exchange from which the last bid was sent. 
Bidsize 
Quote field returns the number of units offered at the best bid. 
Bidtime 
Quote field returns the time of the last bid. 
Bidtimeex 
Quote field returns the time of the last bid (to the second). 
Bigpointvalue 
Dollar amount of 1 full point move. 
Black 
Specifies color Black (numeric value = 1) for plots and backgrounds. 
Blocknumber 
Unique Security Block number. 
Blue 
Specifies color Blue (numeric value = 2) for plots and backgrounds. 
Book val per share 
Retained for backward compatibility. 
Bool 
Used to explicatively declare a Boolean (true/false) value.
324 APPENDIX B: RESERVED WORDS QUICK REFERENCE 
Boxsize 
Box size of Point & Figure chart. 
Break 
Terminates execution of the loop or condition in which it appears. 
Breakevenstopfloor 
Break-even stop floor amount. 
Breakpoint 
Sets a BreakPoint. 
Buy 
Initiates a long position. Covers any short positions & reverses your position. 
Buytocover 
Used in trading strategy to partially or completely cover short positions. 
By 
Skip word. 
Byte 
Used to explicatively declare a single byte value. 
C 
Returns the closing price of the bar referenced (Abbreviation for Close). 
Call 
Constant parameter (numeric value = 3) for call (OptionStation). 
Callcount 
The number of calls in an option array in OptionStation. 
Callitmcount 
Reserved for future use (OptionStation). 
Callopenint 
Returns the daily total Call option open interest for the underlying stock, index, or future.
Appendix B: Reserved Words Quick Reference 325 
Callotmcount 
Reserved for future use (OptionStation). 
Callseriescount 
Reserved for future use (OptionStation). 
Callstrikecount 
Reserved for future use (OptionStation). 
Callvolume 
Returns the daily total Call option volume for the underlying stock, index, or future. 
Cancel 
Used in conjunction with Alert to cancel a previously enabled alert. 
Case 
Used with Switch to pass control to statements when the Case clause is True. 
Catch 
Executes the associated code block when a specific execption is found. 
Category 
Numeric value representing the symbol type: 0=Future, 1=Future Options, 2=Stock, etc. 
Cchart 
Identifies a Chart as the calling application using GetAppInfo.plication using GetAppInfo. 
Ceiling 
Lowest integer greater than num. 
Char 
Reserved for use with custom DLLs designed for EasyLanguage. 
Checkalert 
Returns True for the last bar when Enable Alert check box is selected. 
Checkcommentary 
True/False expression returning True when Expert Commentary is applied to a bar.
326 APPENDIX B: RESERVED WORDS QUICK REFERENCE 
Cleardebug 
Clears the contents of the Output Debug window. 
Clearprintlog 
Clears the contents of the Output Print Log window. 
Close 
Returns the closing price of the bar referenced. 
Coarse 
Specifies a coarse automatic optimization value for function inputs. 
Commentary 
Sends EasyLanguage expression(s) to the Expert Commentary window. 
Commentarycl 
Sends EasyLanguage expression(s) to Expert Commentary with a carriage return. 
Commentaryenabled 
True/false expression returning True when the Expert Commentary window is open. 
Commission 
Commission per stock/transaction. 
Commoditynumber 
Unique number representing particular symbol (optional). 
Computerdatetime 
Returns the system DateTime. 
Condition1-99 
Pre-declared True/False variables numbered 1–99. 
Const 
Declares custom words to behave as constants throughout your analysis technique. 
Constant 
Declares custom words to behave as constants throughout your analysis technique.
Appendix B: Reserved Words Quick Reference 327 
Constants 
Declares custom words to behave as constants throughout your analysis technique. 
Consts 
Declares custom words to behave as constants throughout your analysis technique. 
Continue 
Transfers control to the end of the loop, bypassing remaining statements. 
Contract 
Specifies the number of contracts for a particular order. 
Contractmonth 
Refers to the delivery/expiration month of any option or position leg. 
Contractprofit 
The position profit per contract or share. 
Contracts 
Specifies the number of contracts for a particular order. 
Contractsize 
Retained for backward compatibility. 
Contractyear 
Refers to the delivery/expiration year of any option or position leg. 
Coptionstation 
Identifies OptionStation as the calling application using GetAppInfo. 
Cosine 
Cosine value of num, in degrees. 
Cost 
Returns the cost of establishing an option leg or position (OptionStation). 
Cotangent 
Cotangent value of num, in degrees.
328 APPENDIX B: RESERVED WORDS QUICK REFERENCE 
Cover 
Retained for backward compatibility. 
Cradarscreen 
Identifies RadarScreen as the calling application using GetAppInfo. 
Createleg 
OptionStation word to create a leg during the Search process. 
Cross 
Used to detect when values have crossed over/under another value. 
Crosses 
Used to detect when values have crossed over/under another value. 
Cscanner 
Identifies Scanner as the calling application using GetAppInfo. 
Cunknown 
Identifies Unknown as the calling application using GetAppInfo. 
Current 
Reserved for future use. 
Current ratio 
Retained for backward compatibility. 
Currentbar 
Bar number of current bar. 
Currentcontracts 
Number of contracts currently open. 
Currentdate 
Computer or datafeed current calendar date. 
Currententries 
Number of entries currently open.
Appendix B: Reserved Words Quick Reference 329 
Currentopenint 
Quote field returns the last known Open Interest. 
Currentshares 
Number of shares currently open. 
Currenttime 
Computer or datafeed current time, in 24-hour format. 
Customerid 
Unique customer ID number. 
Cyan 
Specifies color Cyan (numeric value = 3) for plots and backgrounds. 
D 
Returns the closing date of the bar referenced (Abbreviation for Date). 
Dailyclose 
Quote field returns the Daily Close. 
Dailyhigh 
Quote field returns the Daily High. 
Dailylimit 
Number of stocks/contracts allowed traded in 1 day. 
Dailylow 
Quote field returns the Daily Low. 
Dailyopen 
Quote field returns the Open of the most recent session. 
Dailytrades 
Quote field returns the total trades during the most recent session. 
Dailytradesdn 
Quote field returns the number of “down” trades during the most recent session.
330 APPENDIX B: RESERVED WORDS QUICK REFERENCE 
Dailytradesuc 
Quote field returns the number of “unchanged” trades during the most recent session. 
Dailytradesup 
Quote field returns the number of “up” trades during the most recent session. 
Dailyvolume 
Returns the total trade volume for the current trading day. 
Dailyvolumedn 
Returns the down volume for the current trading day. 
Dailyvolumeuc 
Returns the unchanged volume for the current trading day. 
Dailyvolumeup 
Returns the up volume for the current trading day. 
Darkblue 
Specifies color Dark Blue (numeric value = 9) for plots and backgrounds. 
Darkbrown 
Specifies color Dark Brown (numeric value = 14) for plots and backgrounds. 
Darkcyan 
Specifies color Dark Cyan (numeric value = 10) for plots and backgrounds. 
Darkgray 
Specifies color Dark Gray (numeric value = 15) for plots and backgrounds. 
Darkgreen 
Specifies color Dark Green (numeric value = 11) for plots and backgrounds. 
Darkmagenta 
Specifies color Dark Magenta (numeric value = 12) for plots and backgrounds. 
Darkred 
Specifies color Dark Red (numeric value = 13) for plots and backgrounds.
Appendix B: Reserved Words Quick Reference 331 
Data 
Used to reference information from a specified data stream using a number or expres-sion. 
Data1-50 
Used to reference information from a specified data stream. 
Datacompression 
0 for tick, 1 for intraday, 2 for dly, 3 for wkly, 4 for mnthly, 5 for P&F. 
Datainunion 
Reserved for future use. 
Date 
Returns the closing date of the bar referenced. 
Datetimetostring 
Converts a Julian dDateTime value to a string DateTime. 
Datetojulian 
Converts an EasyLanguage calendar date cDate to Julian date. 
Datetostring 
Converts numeric dDateTime value to a string Date. 
Day 
References a specific bar occurring N days ago. 
Dayfromdatetime 
Returns day portion of dDateTime. 
Dayofmonth 
Day’s date on date cDate. 
Dayofweek 
Day of week (0 for Sun., 1 for Mon., . . . , 6 for Sat.) on date cDate. 
Dayofweekfromdatetime 
Returns day of week from dDateTime.
332 APPENDIX B: RESERVED WORDS QUICK REFERENCE 
Days 
References a specific bar occurring N days ago. 
Default 
Used in plot statements to set one of its styles to its default value. 
Definecustfield 
Reserved for future use. 
Definedllfunc 
Reserved for use with custom DLLs designed for EasyLanguage to declare a DLL. 
Deliverymonth 
Delivery month of futures contract. 
Deliveryyear 
Delivery year of futures contract. 
Delta 
Returns the risk value Delta of an option or position in OptionStation. 
Description 
Returns a string containing any symbol description. 
Dividend 
Retained for backward compatibility. 
Dividend yield 
Retained for backward compatibility. 
Dividendcount 
Retained for backward compatibility. 
Dividenddate 
Retained for backward compatibility. 
Dividendfreq 
Retained for backward compatibility.
Appendix B: Reserved Words Quick Reference 333 
Dividendtime 
Retained for backward compatibility. 
Divyield 
Returns the yield value of a bond. 
Does 
Skip word. 
Double 
Used to explicatively declare a double-precision (64-bit) floating point value. 
Doublequote 
Used to embed a double-quote character in a text string value. 
Downticks 
Reserved for backward compatibility. Replaced with DnVolume. 
Downto 
Part of a For statement used to indicate the final decreased value. 
Dword 
Reserved for use with custom DLLs designed for EasyLanguage. 
Easylanguageversion 
Number representing EasyLanguage implementation version. 
El datestr 
EL DateStr returns a string composed of the year, month, and day (YYYYMMDD). 
Eldatetodatetime 
Converts ELDate to a numeric DateTime. 
Else 
Included in If-Then statements to execute an alternate set of statements. 
Eltimetodatetime 
Converts ELTime to a numeric DateTime.
334 APPENDIX B: RESERVED WORDS QUICK REFERENCE 
Encodedate 
Encodes date parameters to a numeric DateTime. 
Encodetime 
Encodes date parameters to a numeric DateTime. 
End 
Completes a block of instructions that follow a Begin statement. 
Entry 
Ties an exit to an entry order in an exit order. 
Entrydate 
Date of entry, num position(s) ago. 
Entryprice 
Price of entry, num position(s) ago. 
Entrytime 
Time of entry of position, num position(s) ago. 
Eps 
Quote field returns the Earnings Per Share. 
Eps pchng y ago 
Retained for backward compatibility. 
Eps pchng ytd 
Retained for backward compatibility. 
Epscount 
Retained for backward compatibility. 
Epsdate 
Retained for backward compatibility. 
Epsestimate 
Retained for backward compatibility.
Appendix B: Reserved Words Quick Reference 335 
Epstime 
Retained for backward compatibility. 
Exchlisted 
Quote field returns the name of the exchange under which a symbol is listed. 
Execoffset 
Returns the local function execution bar-offset amount. 
Executescript 
Execute a script. 
Exitdate 
Date when position closed out, num position(s) ago. 
Exitprice 
Exit price of closed-out entry, num position(s) ago. 
Exittime 
Time when last entry closed out, num position(s) ago. 
Expdate 
Quote field returns the EL date of the symbol expiration date. 
Expdateex 
Quote field returns the Julian date of the symbol expiration date, future, or position leg. 
Expirationdate 
Returns the expiration/delivery date of an option, future, or position leg. 
Expirationstyle 
Returns the expiration style of an option (0=American, 1=European). 
Expstyle 
Quote field returns the expiration style of an option (0=American, 1=European). 
Expvalue 
Exponential value of num.
336 APPENDIX B: RESERVED WORDS QUICK REFERENCE 
External 
Defines a DLL entry point to be called from EasyLanguage. 
Fdrdataunavailable 
Returned by function GetLastFundDataError. 
Fdrfuturereference 
Returned by function GetLastFundDataError. 
Fdrinvalidfield 
Returned by function GetLastFundDataError. 
Fdrnomeaningfulvalue 
Returned by function GetLastFundDataError. 
Fdrnosnapshothistory 
Returned by function GetLastFundDataError. 
Fdrok 
Returned by function GetLastFundDataError. 
Fdrtypemismatch 
Returned by function GetLastFundDataError. 
Fdrvaluenotavailable 
Returned by function GetLastFundDataError. 
File 
Sends information to a specified file from a print statement. 
Fileappend 
Appends text string str Text to file str Filename. 
Filedelete 
Deletes file str Filename. 
Finally 
Releases resources used in a preceeding Try block.
Appendix B: Reserved Words Quick Reference 337 
Fine 
Specifies fine automatic optimization value for function inputs. 
Firstnoticedate 
Retained for backward compatibility. 
Firstnoticedateex 
Retained for backward compatibility. Use FNDEX. 
Firstoption 
True for the first option processed during an OptionStation core calculation event. 
Float 
Used to explicatively declare a single-precision (32-bit) floating point value. 
Floor 
Highest integer less than num. 
Fnd 
Quote field returns an EL date of first notice for a futures contract. 
Fndex 
Quote field returns a Julian date of first notice for a futures contract. 
For 
Defines a group of instructions executed a predefined number of times. 
Formatdate 
Format the date. 
Formattime 
Format the time. 
Fpcexact 
Specifies the tolerance level (numeric value = 5) for the function SetFPCompareA. 
Fpchighaccuracy 
Specifies the tolerance level (numeric value = 3) for the function SetFPCompareA.
338 APPENDIX B: RESERVED WORDS QUICK REFERENCE 
Fpclowaccuracy 
Specifies the tolerance level (numeric value = 1) for the function SetFPCompareA. 
Fpcmedaccuracy 
Specifies the tolerance level (numeric value = 2) for the function SetFPCompareA. 
Fpcveryhighaccuracy 
Specifies the tolerance level (numeric value = 4) for the function SetFPCompareA. 
Fpcverylowaccuracy 
Specifies the tolerance level (numeric value = 0) for the function SetFPCompareA. 
Fracportion 
Fractional portion of num. 
Freecshflwpershare 
Retained for backward compatibility. 
Friday 
Specifies day of the week Thursday (numeric value = 5). 
From 
Skip word. 
Future 
Used as a modifier for other Future related reserved words (OptionStation). 
Futuretype 
True if a position leg is determined to be a future (OptionStation). 
G rate eps ny 
Retained for backward compatibility. 
G rate nt in ny 
Retained for backward compatibility. 
G rate p net inc 
Retained for backward compatibility.
Appendix B: Reserved Words Quick Reference 339 
Gamma 
Returns the risk value Gamma of an option or position (OptionStation). 
Getaccount 
iAccountId. 
Getaccountid 
Gets the Account ID number that has been selected in the Format Strategy dialog. 
Getaccountlotsize 
For a mini forex account 10,000 will be returned. For a big forex account 100,000 will be returned. 
Getaccountstatus 
The Account Status code from the TM Balances tab for the specified account. 
Getaccounttype 
Gets the Account Type code from the TM Balances tab for the specified account. 
Getallornone 
The current state of the All or None advanced setting. 
Getappinfo 
Returns information about the running application. 
Getbackgroundcolor 
Current chart background color (see documentation for color values). 
Getbdaccountequity 
The Beginning Day Account Equity amount from the TM Balances tab for the specified account. 
Getbdaccountnetworth 
The Beginning Day Account Net Worth amount from the TM Balances tab for the speci-fied account. 
Getbdcashbalance 
The Beginning Day Cash Balance amount from the TM Balances tab for the specified account.
340 APPENDIX B: RESERVED WORDS QUICK REFERENCE 
Getbddaytradingbuyingpower 
The Beginning Day Overnight Buying Power amount from the TM Balances tab for the specified account. 
Getbdmarginrequirement 
The Beginning Day Margin Requirement from the TM Balances tab for the specified ac-count. 
Getbdovernightbuyingpower 
The Beginning Day Overnight Buying Power amount from the TM Balances tab for the specified account. 
Getbdtradeequity 
The Beginning Day TradeEquity amount from the TM Balances tab for the specified account. 
Getbuyminussellplus 
Identifies the current state of the “Buy on −/Sell on +” advanced setting. 
Getbvalue 
Returns the blue component of an RGB color. 
Getcdromdrive 
Drive letter of first CD-ROM found. 
Getcountry 
Returns the full localized name of the country/region. 
Getcurrency 
Returns the full English name of the currency. 
Getdiscretion 
Identifies the current state of the “Discretionary” advanced setting. 
Getexchangename 
The name of the exchange of which the chart’s symbol is a member. 
Getfunddata 
Returns the numeric value of the specified fundamental field.
Appendix B: Reserved Words Quick Reference 341 
Getfunddataasboolean 
Returns the true/false value of the specified fundamental field. 
Getfunddataasstring 
Returns the string value of the specified fundamental field. 
Getfundperiodenddate 
Returns the Period End Date of the specified fundamental field. Returned in Julian format. 
Getfundpostdate 
Returns the post date of the specified fundamental field. 
Getgvalue 
Returns the green component of an RGB color. 
Getlastfunddataerror 
Returns a numeric error code with the status of the last fundamental data request. 
Getnondisplay 
The current state of the Non-Display advanced setting. 
Getnow 
Identifies the current state of the “NOW (ECN’s Only)” advanced setting. 
Getnumaccounts 
Gets the number of available equity and futures accounts. 
Getnumpositions 
Gets the number of open positions for the specified account. 
Getopenorderinitialmargin 
The Open Order Initial Margin amount from the TM Balances tab for the specified account. 
Getpeg 
The current state of the Peg advanced setting.
342 APPENDIX B: RESERVED WORDS QUICK REFERENCE 
Getplotbgcolor 
Returns the background color of a cell for an analysis technique. 
Getplotcolor 
Returns the numeric color value of a chart’s plot line or grid’s foreground. 
Getplotwidth 
Returns the width value of a plot line in a chart. 
Getpositionaverageprice 
The average price of the equity or futures position for the specified symbol and account. 
Getpositionmarketvalue 
The future or equity position’s Market Value for the specified symbol and account. 
Getpositionopenpl 
The future or equity position’s Open P/L for the specified symbol and account. 
Getpositionquantity 
The net quantity and side of the equity or futures position for the specified symbol and account. 
Getpositionsymbol 
Identifies the symbol associated with the specified PositionNum and account. 
Getpositiontotalcost 
The future or equity position’s Total Cost for the specified symbol and account. 
Getroute 
Identifies the currently selected route. 
Getroutecount 
Gets the number of Routes. 
Getroutename 
Identifies the name of the currently selected route.
Appendix B: Reserved Words Quick Reference 343 
Getrtaccountequity 
The Real-time Account Equity amount from the TM Balances tab for the specified account. 
Getrtaccountnetworth 
The Real-time Account Net Worth amount from the TM Balances tab for the specified account. 
Getrtcashbalance 
The Real-time Cash Balance amount from the TM Balances tab for the specified account. 
Getrtcostofpositions 
The Real-time Cost of Positions amount from the TM Balances tab for the specified account. 
Getrtdaytradingbuyingpower 
The Real-time Daytrading Buying Power amount from the TM Balances tab for the spec-ified account. 
Getrtinitialmargin 
The Real-time Initial Margin amount from the TM Balances tab for the specified account. 
Getrtmaintmargin 
The Real-time Maintenance Margin amount from the TM Balances tab for the specified account. 
Getrtmarginrequirement 
The Real-time Margin Requirement amount from the TM Balances tab for the specified account. 
Getrtovernightbuyingpower 
The Real-time Overnight Buying Power amount from the TM Balances tab for the speci-fied account. 
Getrtpurchasingpower 
The Real-time Purchasing Power amount from the TM Balances tab for the specified account.
344 APPENDIX B: RESERVED WORDS QUICK REFERENCE 
Getrtrealizedpl 
The Real-time Realized P/L amount from the TM Balances tab for the specified account. 
Getrttradeequity 
The Real-time Trade Equity amount from the TM Balances tab for the specified account. 
Getrtunrealizedpl 
The Real-time Unrealized P/L amount from the TM Balances tab for the specified account. 
Getrvalue 
Returns the red component of an RGB color. 
Getscreenname 
Unique User Name. 
Getshaveimprove 
Identifies the amount by which the strategy limit price will be adjusted. 
Getshowonly 
Identifies the current state of the Show Only advanced setting. 
Getstrategyname 
The name of the trading strategy which is applied to the chart. 
Getsubscriberonly 
Identifies the current state of the Subscriber Only advanced setting. 
Getsymbolname 
Name of the symbol study currently is analyzing. 
Getsystemname 
Reserved for backward compatibility. See GetStrategyName. 
Gettodaysrttradeequity 
Today’s Real-time Trade Equity amount from the TM Balances tab for the specified account. 
Getuncleareddeposits 
The Uncleared Deposits amount from the TM Balances tab for the specified account.
Appendix B: Reserved Words Quick Reference 345 
Gr rate p eps 
Retained for backward compatibility. 
Gradientcolor 
Return the RGB color representing a value within a graident range. 
Green 
Specifies color Cyan (numeric value = 4) for plots and backgrounds. 
Grossloss 
Cumulative dollar total of all closed-out losing trades. 
Grossprofit 
Cumulative dollar total of all closed-out winning trades. 
H 
Returns the highest price of the bar referenced (abbreviation for High). 
Handle 
Reserved for use with custom DLLs designed for EasyLanguage. 
High 
Returns the highest price of the bar referenced. 
High52wk 
Quote field returns the 52-week high. 
Higher 
Synonym for stop or limit orders depending on the context used within a strategy. 
Histfundexists 
Informs if historical fundamental data available for symbol. 
Hoursfromdatetime 
Returns the hours portion of DateTime. 
I 
Number of contracts outstanding at the close of a bar (abbreviation for OpenInt).
346 APPENDIX B: RESERVED WORDS QUICK REFERENCE 
I avgentryprice 
Average of applied strategy’s open entries. 
I closedequity 
Applied strategy’s total net profit. 
I currentcontracts 
Number of contracts applied strategy has currently bought/sold. 
I currentshares 
Number of shares applied strategy has currently bought/sold. 
I marketposition 
Applied strategy’s current market position: 1 = long, −1 = short, 0 = flat. 
I openequity 
Applied strategy’s total net profit + open position Profit/Loss. 
Ieasylanguageobject 
The execution context pointer to an EXTERNAL DLL function. 
If 
Specifies a condition that must be met to execute a set of instructions. 
In 
Modifier that indicates a method parameter is for input only. This is the default value. 
Includesignal 
Allows the inclusion of a strategy within another strategy. 
Includesystem 
Allows the inclusion of a strategy within another strategy. 
Incmonth 
Increment DateTime by a number of months. 
Infiniteloopdetect 
Enables or disables infinite loop detection: True = enabled, False = disabled.
Appendix B: Reserved Words Quick Reference 347 
Initialmargin 
Returns the initial margin of an option position. 
Input 
Declares custom words to behave as constants throughout an analysis technique. 
Inputs 
Declares custom words to behave as constants throughout an analysis technique. 
Insideask 
Returns the current best ask for a symbol. 
Insidebid 
Returns the current best bid for a symbol. 
Inst percent held 
Retained for backward compatibility. 
Instr 
Location of string2 within string1. 
Int 
Used to explicatively declare an integer (32-bit) value. 
Int64 
Used to explicatively declare an integer (64-bit) value. 
Intervaltype 
Returns a number representing the chart interval type. 
Intportion 
Integer portion of num. 
Intrabarordergeneration 
Enables or disables IntrabarOrderGeneration: True = enabled, False = disabled. 
Intrabarpersist 
Used to indicate that the value of a variable can be updated every tick.
348 APPENDIX B: RESERVED WORDS QUICK REFERENCE 
Is 
Skip word. 
Isfunddataavailable 
Returns True if the specified fundamental field value is available. 
Istype 
Returns True if the object being tested is of the specified data type. 
Isvalidfundfield 
Returns True if the specified fundamental field is valid. 
Ivolatility 
Returns the daily average weighted implied volatility for an option. 
Juliantodate 
Converts Julian date jDate to calendar date. 
L 
Returns the lowest price of the bar referenced (abbreviation for Low). 
Largestlostrade 
Dollar amount of largest closed-out losing trade. 
Largestwintrade 
Dollar amount of largest closed-out winning trade. 
Last 
Quote field returns the price of the last completed trade. 
Last split date 
Retained for backward compatibility. 
Last split fact 
Retained for backward compatibility. 
Lastcalcjdate 
Julian date of last completed bar.
Appendix B: Reserved Words Quick Reference 349 
Lastcalcmmtime 
Time of last completed bar, in minutes since midnight. 
Lasttradingdate 
Refers to the last day an option, future, position leg, or asset may be traded. 
Leapyear 
Quote field that returns a nonzero value for a leap year. 
Leftside 
Used with ActivityBars to refer to a cell or zone on the left side of a bar. 
Leftstr 
Leftmost sSize portion of string. 
Leg 
Modifier to other position leg related words. 
Legacycolortorgb 
Return the RGB from a legacy color value. 
Legacycolorvalue 
Specifies color system to be used: True = 16 bit, False = RGB. 
Legtype 
Returns the type of option position: Asset, Future, Call, or Put. 
Lightgray 
Specifies color Light Gray (numeric value = 16) for plots and backgrounds. 
Limit 
A limit order meaning “or higher” or “or lower,” depending on the context. 
Livedate 
Reserved for future use. 
Livetime 
Reserved for future use.
350 APPENDIX B: RESERVED WORDS QUICK REFERENCE 
Log 
Natural logarithm of num. 
Long 
Used to explicatively declare a long (32-bit) integer value. 
Longrolladj 
The end-of-day roll adjust factor for a long forex position. 
Losscf 
The loss currency correction factor for use when a losing trade is exited. 
Low 
Returns the lowest price of the bar referenced. 
Low52wk 
Quote field that returns the 52-week low. 
Lower 
Synonym for stop or limit orders depending on the context used within a strategy. 
Lowerstr 
Lowercase copy of string str1. 
Lpbool 
Reserved for use with custom DLLs designed for EasyLanguage. 
Lpbyte 
Reserved for use with custom DLLs designed for EasyLanguage. 
Lpdouble 
Reserved for use with custom DLLs designed for EasyLanguage. 
Lpdword 
Reserved for use with custom DLLs designed for EasyLanguage. 
Lpfloat 
Reserved for use with custom DLLs designed for EasyLanguage.
Appendix B: Reserved Words Quick Reference 351 
Lpint 
Reserved for use with custom DLLs designed for EasyLanguage. 
Lplong 
Reserved for use with custom DLLs designed for EasyLanguage. 
Lpstr 
Reserved for use with custom DLLs designed for EasyLanguage. 
Lpword 
Reserved for use with custom DLLs designed for EasyLanguage. 
Ltd 
Quote field returns the EL date of the last trading date for a symbol. 
Ltdex 
Quote field returns the Julian date of the last trading date for a symbol. 
Magenta 
Specifies color Magenta (numeric value = 5) for plots and backgrounds. 
Makenewmovieref 
Creates new movie reference number. 
Margin 
Margin per stock/contract/transaction. 
Market 
Order type referring to the opening price of the next bar. 
Marketposition 
Market position (1 = long, −1 = short, 0 = flat) of num position(s) ago. 
Maxbarsback 
Maximum number of reference bars (buffer) needed before study can plot. 
Maxbarsforward 
Number bars allocated (by charting) to the right of the chart.
352 APPENDIX B: RESERVED WORDS QUICK REFERENCE 
Maxconseclosers 
Longest chain of consecutive closed-out losing trades. 
Maxconsecwinners 
Longest chain of consecutive closed-out winning trades. 
Maxcontractprofit 
Calculates maximum position profit per contract or share. 
Maxcontracts 
Maximum number of contracts held during the specified position. 
Maxcontractsheld 
Maximum number of contracts held at any one time. 
Maxentries 
Max entries open during life of position, num position(s) ago. 
Maxgain 
Returns the theoretical maximum gain for a position. 
Maxiddrawdown 
True dollar amount needed to sustain largest equity dip. 
Maxlist 
Highest value num in list. 
Maxlist2 
Second highest value num in list. 
Maxloss 
Returns the theoretical maximum loss for a position. 
Maxpositionloss 
Dollar amount of largest loss during position, num position(s) ago. 
Maxpositionprofit 
Dollar amount of largest gain during position, num position(s) ago.
Appendix B: Reserved Words Quick Reference 353 
Maxshares 
Max shares held during num position(s) ago. 
Maxsharesheld 
Maximum number of shares held at any one time. 
Medium 
Specifies a medium automatic optimization value for function inputs. 
Messagelog 
Sends information to the printlog. 
Method 
Declares a method containing executable code that can act on class data. May include parameters and a return value. Void indicates no return value. 
Midstr 
Arbitrary slice of string str, starting at pos position for size characters. 
Millisecondsfromdatetime 
Returns milliseconds portion of DateTime. 
Minlist 
Lowest value num in list. 
Minlist2 
Second lowest value num in list. 
Minmove 
Minimum tick movement of stock/future symbol. 
Minutesfromdatetime 
Returns minutes portion of DateTime. 
Miviterationcount 
The count reached with the MIV indicator algorithm converges to a value (OptionSta-tion).
354 APPENDIX B: RESERVED WORDS QUICK REFERENCE 
Mivonask 
The market implied volatility of the current modeled ask price for an option (OptionSta-tion). 
Mivonbid 
The market implied volatility of the current modeled bid price for an option (OptionSta-tion). 
Mivonclose 
The market implied volatility of the last trade price for an option (OptionStation). 
Mivonrawask 
The market implied volatility of the best ask price for an option (OptionStation). 
Mivonrawbid 
The market implied volatility of the best bid price for an option (OptionStation). 
Mivonrawmid 
The market implied volatility of the mid price for an option (OptionStation). 
Moc 
Reserved for future use. 
Mod 
Remainder of num/divisor. 
Modelposition 
Retained for backward compatibility. 
Modelprice 
Returns the underlying asset price used as a Pricing Model input. 
Modelrate 
Returns the interest rate used as a Pricing Model input. 
Modelrate2 
Returns the second interest rate used as a Pricing Model input. 
Modelvolatility 
Returns the volatility used as a Pricing Model input.
Appendix B: Reserved Words Quick Reference 355 
Monday 
Specifies day of the week Monday (numeric value = 1). 
Moneymgtstopamt 
Money management stop dollar amount. 
Month 
Month on date cDate, from 1 to 12. 
Monthfromdatetime 
Returns month portion of DateTime. 
Multiple 
Reserved for use with custom DLLs designed for EasyLanguage. 
Neg 
Absolute negative of num. 
Net profit margin 
Retained for backward compatibility. 
Netprofit 
Cumulative dollar total of all closed-out trades. 
New 
Creates an object for the specified class and initializes all the members of that class. 
Newline 
Carriage return/linefeed useful for commentary/file output strings. 
Newscount 
Quote field returns the number of headlines transmitted on the current day. 
Next 
Used with Bar to reference the next bar in a trading strategy. 
Noplot 
Removes a plot from the current bar in a chart or cell in a grid.
356 APPENDIX B: RESERVED WORDS QUICK REFERENCE 
Not 
Reserved for future use. 
Nthmaxlist 
Nth highest value num in list. 
Nthminlist 
Nth lowest value num in list. 
Null 
Represents the absence of a value or object. 
Numeric 
Defines an input as a numeric expression. 
Numericarray 
Defines an input as a numeric array. 
Numericarrayref 
Defines an input as a numeric function-modifiable array. 
Numericref 
Allows the code to pass a Numeric variable so it can be modified by the function. 
Numericseries 
Defines an input as a numeric series expression. 
Numericsimple 
Defines an input as a numeric simple expression. 
Numeventrades 
Total count of closed-out even trades. 
Numfutures 
The number of futures contracts in the asset section (OptionStation). 
Numlegs 
The number of legs in a position (OptionStation).
Appendix B: Reserved Words Quick Reference 357 
Numlostrades 
Total count of closed-out losing trades. 
Numoptions 
The number of options in the option section (OptionStation). 
Numtostr 
Converts num to string with dec decimal places. 
Numwintrades 
Total count of closed-out winning trades. 
O 
Returns the opening price of the bar referenced (abbreviation for Open). 
Objectref 
Allows the code to pass an object variable so it can be modified by the function. 
Objectsimple 
Defines an input to accept object values to be read by the function. 
Of 
Skip word. 
On 
Skip word. 
Once 
Specifies that the compiler execute the specified statements only one time. 
Oncreate 
Used to call a DLL when an analysis technique is inserted or enabled. 
Ondestroy 
Used to call a DLL when an analysis technique is removed or disabled. 
Open 
Returns the opening price of the bar referenced.
358 APPENDIX B: RESERVED WORDS QUICK REFERENCE 
Openint 
Returns the number of contracts outstanding at the close of the bar referenced. 
Openpositionprofit 
Profit/Loss of current open position. 
Option 
Modifier to other option-related reserved words. 
Optiontype 
Returns the option type (Put = 2, Call = 3). 
Or 
Links 2 true/false expressions together. True if either expression is True. 
Osassetpane 
GetAppInfo constant (1) that represents an OptionStation Asset pane. 
Osinvalidwindowtype 
GetAppInfo constant (−1) that represents an invalid pane. 
Osoptionpane 
GetAppInfo constant (2) that represents an OptionStation Option pane. 
Ospositionpane 
GetAppInfo constant (3) that represents an OptionStation Position pane. 
Out 
Modifier that indicates a method parameter is to be passed by reference. The parameter must be assigned to in the method code. 
Over 
Detects when a value crosses above or becomes greater than another value. 
Override 
A method modifier used to create a new implementation of a base class method. 
Pager defaultname 
Default subscriber name for a pager.
Appendix B: Reserved Words Quick Reference 359 
Pager send 
Sends text message str Msg to str Name (if pager module enabled). 
Pegbest 
Specifies the state of the Peg Advanced order setting (numeric value = 1). Used with SetPeg or GetPeg. 
Pegdisable 
Specifies the state of the Peg Advanced order setting (numeric value = 0). Used with SetPeg or GetPeg. 
Pegmid 
Specifies the state of the Peg Advanced order setting (numeric value = 2). Used with SetPeg or GetPeg. 
Peratio 
Quote field returns the PE Ratio for the current symbol. 
Percentprofit 
Percentage of all closed-out winning trades. 
Place 
Skip word. 
Playmoviechain 
Queues then plays movies in movie chain mRef. 
Playsound 
Plays sound from file sFile. 
Plot 
References the value of a plot. 
Plot1-99 
Plots a specified expression in a chart or grid. 
Plotpaintbar 
Plots a range of values inside the current bar in a chart.
360 APPENDIX B: RESERVED WORDS QUICK REFERENCE 
Plotpb 
Plots a range of values inside the current bar in a chart. 
Pm getcellvalue 
Returns the cell value in a Probability Map study. 
Pm getnumcolumns 
PM GetNumColumns. 
Pm getrowheight 
PM GetRowHeight. 
Pm high 
PM High. 
Pm low 
PM Low. 
Pm setcellvalue 
PM SetCellValue. 
Pm sethigh 
PM SetHigh. 
Pm setlow 
PM SetLow. 
Pm setnumcolumns 
PM SetNumColumns. 
Pm setrowheight 
PM SetRowHeight. 
Pob 
A synonym for a limit order. 
Point 
Returns the minimal interval value a symbol can move.
Appendix B: Reserved Words Quick Reference 361 
Pointer 
Reserved for use with custom DLLs designed for EasyLanguage. 
Points 
Returns the minimal interval value a symbol can move. 
Pointvalue 
Dollar amount of 1 point move. 
Pos 
Absolute positive of num. 
Position 
Modifier to other position-related reserved words. 
Positionid 
Returns a value for an OS position. See help topic. 
Positionprofit 
Profit/Loss of position, num position(s) ago. 
Positionstatus 
Retained for backward compatibility. 
Power 
Num raised to a specified power. 
Prevclose 
Quote field returns the close of the previous trading session. 
Prevopenint 
Quote field returns the open interest of the previous trading session. 
Prevvolume 
Quote field returns the previous volume for the current symbol. 
Price to book 
Retained for backward compatibility.
362 APPENDIX B: RESERVED WORDS QUICK REFERENCE 
Pricescale 
Price scale of stock/future symbol (inverted for EasyLanguage). 
Print 
Sends output to the PowerEditor’s Debug Window, a specified file, or a printer. 
Printer 
Sends information to a printer from a print statement. 
Product 
Number representing TradeStation product currently being used. 
Profit 
Retained for backward compatibility. 
Profitcf 
Correction factor used for calculating a profit from an exited trade. 
Profittargetstop 
Profit target stop amount. 
Protective 
Retained for backward compatibility. 
Ptdate 
Specifies Date (numeric value = 25) as the plot type for function SetPlotType. 
Ptdatetime 
Specifies DateTime (numeric value = 27) as the plot type for function SetPlotType. 
Ptdouble 
Specifies Double (numeric value = 28) as the plot type for function SetPlotType. 
Ptfloat 
Specifies Float (numeric value = 29) as the plot type for function SetPlotType. 
Ptinvalid 
Specifies Invalid (numeric value = 3) as the plot type for function SetPlotType.
Appendix B: Reserved Words Quick Reference 363 
Ptprobability 
Specifies ptProbability (numeric value = 4) as the plot type for function SetPlo. 
Ptstring 
Specifies String (numeric value = 2) as the plot type for function SetPlotType. 
Pttime 
Specifies Time (numeric value = 26) as the plot type for function SetPlotType. 
Pttruefalse 
Specifies TrueFalse (numeric value = 1) as the plot type for function SetPlotTyp. 
Put 
OptionStation constant parameter for put (numeric value = 2). 
Putcount 
Returns the number of puts in the OS option array. 
Putitmcount 
Reserved for future use. 
Putopenint 
Returns the daily total Put option open interest. 
Putotmcount 
Reserved for future use. 
Putseriescount 
Reserved for future use. 
Putstrikecount 
Reserved for future use. 
Putvolume 
Returns the daily total Put option volume. 
Q ask 
Quote field returns the current best ask.
364 APPENDIX B: RESERVED WORDS QUICK REFERENCE 
Q askexchange 
Quote field returns the exchange name the last ask was sent from. 
Q asksize 
Retained for backward compatibility. Use AskSize. 
Q bid 
Retained for backward compatibility. Use InsideBid. 
Q bidexchange 
Retained for backward compatibility. Use BidExch. 
Q bidsize 
Retained for backward compatibility. Use BidSize. 
Q bigpointvalue 
Retained for backward compatibility. Use BigPointValue. 
Q callopenint 
Quote field returns daily total Call option open interest. 
Q callvolume 
Quote field returns daily total Call option open volume. 
Q category 
Retained for backward compatibility. Use Category. 
Q close 
Retained for backward compatibility. 
Q dailylimit 
Retained for backward compatibility. Use DailyLimit. 
Q date 
Retained for backward compatibility. Use TradeDate. 
Q dateex 
Retained for backward compatibility. Use TradeDateEX.
Appendix B: Reserved Words Quick Reference 365 
Q datelastask 
Retained for backward compatibility. Use AskDate. 
Q datelastaskex 
Retained for backward compatibility. Use AskDateEX. 
Q datelastbid 
Retained for backward compatibility. Use BidDate. 
Q datelastbidex 
Retained for backward compatibility. Use BidDateEX. 
Q datelasttrade 
Retained for backward compatibility. Use TradeDate. 
Q datelasttradeex 
Retained for backward compatibility. Use TradeDateEX. 
Q downvolume 
Retained for backward compatibility. Use DailyDownVolume. 
Q exchangelisted 
Retained for backward compatibility. Use ExchListed. 
Q expirationdate 
Retained for backward compatibility. Use ExpDate. 
Q expirationdateex 
Retained for backward compatibility. Use ExpDateEX. 
Q high 
Retained for backward compatibility. 
Q ivolatility 
Quote field returns daily average weighted implied volatility for an option. 
Q last 
Retained for backward compatibility. Use Last.
366 APPENDIX B: RESERVED WORDS QUICK REFERENCE 
Q lasttradingdate 
Retained for backward compatibility. Use LTD. 
Q lasttradingdateex 
Retained for backward compatibility. Use LTDEX. 
Q low 
Retained for backward compatibility. 
Q margin 
Retained for backward compatibility. Use Margin. 
Q minmove 
Retained for backward compatibility. Use MinMove. 
Q newscount 
Retained for backward compatibility. Use NewsCount. 
Q numoptions 
Retained for backward compatibility. Use NumOptions. 
Q offer 
Retained for backward compatibility. Use InsideAsk. 
Q open 
Retained for backward compatibility. 
Q openinterest 
Retained for backward compatibility. Use CurrentOpenInt. 
Q optiontype 
Retained for backward compatibility. Use OptionType. 
Q previousclose 
Retained for backward compatibility. Use PrevClose. 
Q previousopeninterest 
Retained for backward compatibility. Use PrevOpenInt.
Appendix B: Reserved Words Quick Reference 367 
Q previousvolume 
Retained for backward compatibility. Use PrevVolume. 
Q prevtotalvolume 
Retained for backward compatibility. 
Q putopenint 
Quote field returns the daily total Put option open interest. 
Q putvolume 
Quote field returns the daily total Put option volume. 
Q strikeprice 
Quote field returns the strike price of an option. 
Q ticks 
Retained for backward compatibility. 
Q time 
Retained for backward compatibility. Use TradeTime. 
Q timeex 
Retained for backward compatibility. Use TradeTimeEX. 
Q timelastask 
Retained for backward compatibility. Use AskTime. 
Q timelastaskex 
Retained for backward compatibility. Use AskTimeEX. 
Q timelastbid 
Retained for backward compatibility. Use BidTime. 
Q timelastbidex 
Retained for backward compatibility. Use BidTimeEX. 
Q timelasttrade 
Retained for backward compatibility. Use TradeTime.
368 APPENDIX B: RESERVED WORDS QUICK REFERENCE 
Q timelasttradeex 
Retained for backward compatibility. Use TradeTimeEX. 
Q totalvolume 
Retained for backward compatibility. Use DailyVolume. 
Q tradevolume 
Retained for backward compatibility. Use TradeVolume. 
Q unchangedvolume 
Retained for backward compatibility. Use DailyVolumeUC. 
Q upvolume 
Retained for backward compatibility. Use DailyVolumeUp. 
Q yield 
Retained for backward compatibility. Use DivYield. 
Quick ratio 
Retained for backward compatibility. 
Raiseruntimeerror 
Display a Run-time error. 
Random 
Returns a pseudo-random number. 
Rawask 
The modeled current best ask for an option of underlying asset. 
Rawbid 
The modeled current best bid for an option of underlying asset. 
Reciprocal 
Reciprocal value of a number (1 / num). 
Red 
Specifies color Red (numeric value = 6) for plots and backgrounds.
Appendix B: Reserved Words Quick Reference 369 
Regularsession 
Used with session information to refer to regular sessions. 
Repeat 
Evaluates statements in a loop that exits only when the Until condition is True. 
Ret on avg equity 
Retained for backward compatibility. 
Return 
Ends execution of a method and returns a value. 
Revsize 
Reversal size of Point & Figure chart. 
Rgb 
Returns an RGB color. The red, green, and blue components are valid only from 0 to 255. 
Rgbtolegacycolor 
Return the nearest legacy color value from an RGB color. 
Rho 
Returns the risk value Rho of an option or position (OptionStation). 
Rightside 
Used with ActivityBars to refer to a cell or zone on the right side of a bar. 
Rightstr 
Rightmost sSize portion of string. 
Round 
Num rounded to nearest prec precision. 
Runcommand 
Run a command. 
Sametickopt 
Enables or disables the Same-tick Optimization setting for analysis techiques. True = enabled, False = disabled.
370 APPENDIX B: RESERVED WORDS QUICK REFERENCE 
Saturday 
Specifies day of the week Thursday (numeric value = 6). 
Screen 
Reserved for future use. 
Sdecommentary 
Reserved for future use. 
Secondsfromdatetime 
Returns seconds portion of DateTime. 
Self 
Used to send the execution context to an EXTERNAL DLL function. 
Sell 
Used in trading strategy to partially or completely liquidate a long position. 
Sellshort 
Initiates a short position, closes any open long positions & reverses position. 
Seriescount 
Returns the number of series months in a option array. 
Serverfield 
An attribute used to declare a server field used by an EXTERNAL DLL function. 
Sess1endtime 
Ending time of first session. 
Sess1firstbartime 
Time when first bar in morning session completed. 
Sess1starttime 
Starting time of first session. 
Sess2endtime 
Ending time of second session.
Appendix B: Reserved Words Quick Reference 371 
Sess2firstbartime 
Time when first bar in evening session completed. 
Sess2starttime 
Starting time of second session. 
Sessioncount 
The number of total (0) or regular (1) sessions for the week. 
Sessioncountms 
The number of merged (multidata) sessions for the week. 
Sessionendday 
The numeric day of the week when a specified session ends. 
Sessionenddayms 
The numeric day of the week when a merged (multidata) session ends. 
Sessionendtime 
The 24-hour time when a specified session ends. 
Sessionendtimems 
The 24-hour time when a merged session (multidata) ends. 
Sessionstartday 
The numeric day of the week when a specified session starts. 
Sessionstartdayms 
The numeric day of the week when a merged (multidata) session starts. 
Sessionstarttime 
The 24-hour time when a specified session starts. 
Sessionstarttimems 
The 24-hour time when a merged (multidata) session starts. 
Setallornone 
The current state of the All or None advanced setting.
372 APPENDIX B: RESERVED WORDS QUICK REFERENCE 
Setbreakeven 
Sets up a break-even stop. 
Setbuyminussellplus 
Enables or disables the Buy on −/Sell on + advanced setting. 
Setdiscretion 
Enables or disables the Discretionary advanced setting. 
Setdollartrailing 
Sets up a dollar-trailing stop. 
Setexitonclose 
Sets the Exit on Close stop to true. 
Setfpcompareaccuracy 
Sets the tolerance value to be used when comparing two floating point values. 
Setnondisplay 
Enables or disables the Non-Display advanced setting. 
Setnow 
Enables or disables the NOW (ECNs Only) advanced setting. 
Setpeg 
Enables or disables the Peg advanced setting. 
Setpercenttrailing 
Sets up a percent-trailing stop. 
Setplotbgcolor 
Assigns a specified background color to a grid containing an indicator. 
Setplotcolor 
Assigns the color value (color) to the plot specified by (num). 
Setplottype 
Sets the Plot Type.
Appendix B: Reserved Words Quick Reference 373 
Setplotwidth 
Modifies the thickness of an indicator’s plot line. 
Setprofittarget 
Sets up a profit-target stop. 
Setroute 
Sets the route for an order. 
Setroutename 
Sets the route for an order. 
Setshaveimprove 
Adjusts the strategy calculated limit price by the dShaveImprove. 
Setshowonly 
Enables or disables the Show Only advanced setting. 
Setstopcontract 
Sets the built-in stops to execute on a contract basis. 
Setstoploss 
Sets up a stop-loss stop. 
Setstopposition 
Sets the built-in stops to execute on a position basis. 
Setstopshare 
Sets the built-in stops to execute on a share basis. 
Setsubscriberonly 
Enables or disables the Subscriber Only advanced setting. 
Settlement 
Quote field returns the settlement value. 
Sga exp by netsales 
Retained for backward compatibility.
374 APPENDIX B: RESERVED WORDS QUICK REFERENCE 
Share 
Used to specify the number of shares for a particular order. 
Shares 
Used to specify the number of shares for a particular order. 
Sharesout 
Retained for backward compatibility. 
Short 
Retained for backward compatibility. 
Shortrolladj 
Returns the EOD roll adjust factor for a short forex position. 
Siccode 
Quote field that returns the SIC code. 
Sign 
1 for positive num, −1 for negative num, and 0 for 0. 
Sine 
Sine value of num, in degrees. 
Skip 
Reserved for future use. 
Slippage 
Slippage per stock/contract. 
Snapfundexists 
Informs if snapshot fundamental data available for symbol. 
Spaces 
String of cnt empty spaces, used for padding output. 
Square 
Square of num.
Appendix B: Reserved Words Quick Reference 375 
Squareroot 
Square root of num. 
Startdate 
Reserved for future use. 
Stateless 
Attribute that specifies if an analysis technique is stateless or stateful. 
Stautosession 
Specifies the Type of session (numeric value = 0). 
Stockspilttime 
Retained for backward compatibility. 
Stocksplit 
Retained for backward compatibility. 
Stocksplitcount 
Retained for backward compatibility. 
Stocksplitdate 
Retained for backward compatibility. 
Stocksplittime 
Retained for backward compatibility. 
Stop 
A stop order meaning “or higher” or “or lower,” depending on the context. 
Stregularsession 
Specifies the Type of session (numeric value = 1). 
Strike 
Returns the strike price of an option. 
Strikecount 
Reserved for future use.
376 APPENDIX B: RESERVED WORDS QUICK REFERENCE 
Strikeitmcount 
Reserved for future use. 
Strikeotmcount 
Reserved for future use. 
String 
Defines an input as a string expression. 
Stringarray 
Defines an input as a string array. 
Stringarrayref 
Defines an input as a string function-modifiable array. 
Stringref 
Allows the code to pass a Text-String variable so it can be modified by the function. 
Stringseries 
Defines a function’s input as a string series expression. 
Stringsimple 
Defines a function’s input as a string simple expression. 
Stringtodate 
Converts a date from string to numeric value. 
Stringtodatetime 
Converts a DateTime string to numeric value. 
Stringtotime 
Converts a time value from string to numeric value. 
Strlen 
Number of characters in string str. 
Strtonum 
Numerical value of str, zero if str not numeric.
Appendix B: Reserved Words Quick Reference 377 
Sumlist 
Sum of all nums in list. 
Sunday 
Specifies day of the week Sunday (numeric value = 0). 
Switch 
Accepts an expression that is used to process statements when the Case clause is True. 
Symbol 
Quote field returns the symbol name. 
Symbolname 
Quote field returns the symbol name. 
Symbolroot 
Quote field returns the symbol name as a string. 
T 
Returns the closing time of the bar referenced (abbreviation for Time). 
Tangent 
Tangent of num degrees. 
Target 
Reserved for future use. 
Targettype 
Reserved for future use. 
Text 
Reserved for backward compatibility with previous EasyLanguage versions. 
Text delete 
Deletes text object TX Ref. 
Text getactive 
Returns the ID of the active/selected text object.
378 APPENDIX B: RESERVED WORDS QUICK REFERENCE 
Text getcolor 
Color of text object TX Ref (see documentation for color values). 
Text getdate 
Date axis value of text object TX Ref. 
Text getfirst 
First created text object of type pref (see documentation for pref types). 
Text gethstyle 
TX Ref horizontal text placement style (see documentation for style values). 
Text getnext 
Text object created after TX Ref (see documentation for pref types). 
Text getstring 
Text stored in text object TX Ref. 
Text gettime 
Time axis value of text object TX Ref. 
Text getvalue 
Price axis value of text object TX Ref. 
Text getvstyle 
TX Ref vertical text placement style (see documentation for style values). 
Text new 
Draws text object str1 at value nPrice on cDate date at tTime time. 
Text setcolor 
Changes the color of TX Ref to clr (see documentation for color values). 
Text setlocation 
Moves text object TX Ref to price nPrice on date cDate at time tTime. 
Text setstring 
Changes the text of text object TX Ref to str1.
Appendix B: Reserved Words Quick Reference 379 
Text setstyle 
Sets horiz/vert position of TX Ref (see documentation for horiz/vert values). 
Than 
Skip word. 
The 
Skip word. 
Then 
Specifies the action to be executed if an If-Then statement is true. 
Theoreticalgrossin 
The theoretical gross cost for entering a position. 
Theoreticalgrossout 
The theoretical gross proceeds for entering a position. 
Theoreticalvalue 
The modeled theoretical value of an option. 
This 
Used with Bar to reference the current bar. 
Throw 
Generates the specified exception. 
Thursday 
Specifies day of the week Thursday (numeric value = 4). 
Ticks 
Reserved for backward compatibility. Replaced with Volume. 
Ticktype 
The type of price update that triggered the current core calc event. 
Time 
Closing time of the bar in charting or specified time interval in a grid.
380 APPENDIX B: RESERVED WORDS QUICK REFERENCE 
Timetostring 
Converts numeric DateTime value to a string Time. 
Tl delete 
Deletes trendline TL Ref and recycles its reference. 
Tl getactive 
Returns the ID of the active/selected trendline. 
Tl getalert 
TL Ref’s alert type value (see documentation for alert values). 
Tl getbegindate 
Date of trendline TL Ref’s start point. 
Tl getbegintime 
Bar time of trendline TL Ref’s start point. 
Tl getbeginval 
Price axis value at trendline TL Ref’s start point. 
Tl getcolor 
Trendline TL Ref’s color value (see documentation for color values). 
Tl getenddate 
Date of trendline TL Ref’s end point. 
Tl getendtime 
Bar time of trendline TL Ref’s end point. 
Tl getendval 
Price value at trendline TL Ref’s end point. 
Tl getextleft 
TRUE if trendline TL Ref is extended left, FALSE otherwise. 
Tl getextright 
TRUE if trendline TL Ref is extended right, FALSE otherwise.
Appendix B: Reserved Words Quick Reference 381 
Tl getfirst 
First created trendline of type pref (see documentation for pref types). 
Tl getnext 
Trendline created after TL Ref (see documentation for pref types). 
Tl getsize 
Thickness of trendline TL Ref (see documentation for size values). 
Tl getstyle 
Trendline TL Ref’s style value (see documentation for style values). 
Tl getvalue 
Price value at date cDate and time tTime on trendline TL Ref. 
Tl new 
Creates a new trendline with listed s start and e end points. 
Tl setalert 
Sets trendline TL ref’s alert to alertVal (see documentation for alert values). 
Tl setbegin 
Sets the start point of trendline TL Ref to sVal on sDate at sTime. 
Tl setcolor 
Sets color of trendline TL Ref to clr (see documentation for color values). 
Tl setend 
Sets the end point of trendline TL Ref to eVal on eDate at eTime. 
Tl setextleft 
Sets indefinite leftward extention of trendline TL Ref (tfExt = true/false). 
Tl setextright 
Sets indefinite rightward extention of trendline TL Ref (tfExt = true/false). 
Tl setsize 
Sets thickness/size of trendline TL Ref (see documentation for size values).
382 APPENDIX B: RESERVED WORDS QUICK REFERENCE 
Tl setstyle 
Sets trendline TL Ref to style (see documentation for style values). 
To 
Used as part of a For statement before increasing finished value. 
Today 
References the most current bar, even when analyzing intraday bars. 
Tomorrow 
References the next bar, even when analyzing intraday bars. 
Tool black 
References the color black. 
Tool blue 
References the color blue. 
Tool cyan 
References the color cyan. 
Tool darkblue 
References the color dark blue. 
Tool darkbrown 
References the color dark brown. 
Tool darkcyan 
References the color dark cyan. 
Tool darkgray 
References the color dark gray. 
Tool darkgreen 
References the color dark green. 
Tool darkmagenta 
References the color dark magenta.
Appendix B: Reserved Words Quick Reference 383 
Tool darkred 
References the color dark red. 
Tool darkyellow 
References the color dark yellow (brown). 
Tool dashed 
Assigns a dashed line to a drawing object. 
Tool dashed2 
Assigns a dashed2 line to a drawing object. 
Tool dashed3 
Assigns a dashed3 line to a drawing object. 
Tool dotted 
Assigns a dotted line to a drawing object. 
Tool green 
References the color green. 
Tool lightgray 
References the color light gray. 
Tool magenta 
References the color magenta. 
Tool red 
References the color red. 
Tool solid 
Assigns a solid line to a drawing object. 
Tool white 
References the color white. 
Tool yellow 
References the color yellow.
384 APPENDIX B: RESERVED WORDS QUICK REFERENCE 
Total 
Number of shares/contracts to exit from a position created by pyramiding. 
Totalbarseventrades 
Total number of bars in closed-out even trades. 
Totalbarslostrades 
Total number of bars in closed-out losing trades. 
Totalbarswintrades 
Total number of bars in closed-out winning trades. 
Totaltrades 
Number of all closed-out trades in the life of a strategy. 
Tradedate 
Quote field returns the EL Date of last update time for any price field. 
Tradedateex 
Quote field returns the Julian of last update time for any price field. 
Tradedirectionseries 
Quote field returns the Trade Direction Series. 
Tradeexch 
Quote field returns the Trade Exchange. 
Tradetime 
Quote field returns the EL time for the last time the symbol was updated. 
Tradetimeex 
Quote field returns the Julian time for the last time the symbol was updated (to the second). 
Tradevolume 
Quote field returns the trade volume of the last trade. 
Tradingdaysleft 
The number of whole and fractional trading session days left to expiration for an option (OptionStation).
Appendix B: Reserved Words Quick Reference 385 
Trailingstopamt 
Risk trailing stop dollar amount. 
Trailingstopfloor 
Risk trailing stop floor amount. 
Trailingstoppct 
Risk trailing stop percent amount. 
Truefalse 
Defines an input as a true/false expression. 
Truefalsearray 
Defines an input as a true/false array. 
Truefalsearrayref 
Defines an input as a true/false function-modifiable array. 
Truefalseref 
Allows the code to pass a true/false variable so it can be modified by the function. 
Truefalseseries 
Defines an input as a true/false series expression. 
Truefalsesimple 
Defines an input as a true/false simple expression. 
Try 
Starts a block of code containing statements to test for an error. 
Ttldbt by netassts 
Retained for backward compatibility. 
Tuesday 
Specifies day of the week Tuesday (numeric value = 2). 
Under 
Detects when a value crosses under or becomes less than another value.
386 APPENDIX B: RESERVED WORDS QUICK REFERENCE 
Underlying 
Quote field returns the underlying symbol. 
Unionsess1endtime 
Latest session 1 end time of all datas in a multidata chart. 
Unionsess1firstbar 
Earliest session 1 first bar time of all datas in a multidata chart. 
Unionsess1starttime 
Earliest session 1 start time of all datas in a multidata chart. 
Unionsess2endtime 
Latest session 2 end time of all datas in a multidata chart. 
Unionsess2firstbar 
Earliest session 2 first bar time of all datas in a multidata chart. 
Unionsess2starttime 
Earliest session 2 start time of all datas in a multidata chart. 
Units 
Number of assets, options, or futures comprising a specific position leg. 
Unsigned 
Reserved for use with custom DLLs designed for EasyLanguage. 
Until 
The REPEAT statement is similar to the while loop, however, with the repeat sta. 
Upperstr 
Uppercase copy of string str. 
Upticks 
Reserved for backward compatibility. Replaced with UpVolume. 
Using 
Used to access members within a namespace without needing an explicate reference.
Appendix B: Reserved Words Quick Reference 387 
V 
Number of shares/contracts traded for the bar referenced (abbreviation for Volume). 
Value1-99 
Predeclared numeric double variables numbered 1–99. 
Var 
Declares custom words to behave as variables throughout your analysis technique. 
Variable 
Declares custom words to behave as variables throughout your analysis technique. 
Variables 
Declares custom words to behave as variables throughout your analysis technique. 
Vars 
Declares custom words to behave as variables throughout your analysis technique. 
Varsize 
Reserved for use with custom DLLs designed for EasyLanguage. 
Varstartaddr 
Reserved for use with custom DLLs designed for EasyLanguage. 
Vega 
Returns the risk value of an option or postion (OptionStation). 
Void 
Reserved for use with custom DLLs designed for EasyLanguage. 
Volume 
Returns the number of shares or contracts traded for the bar referenced. 
Vsb commentary 
Reserved for future use. 
[[VWAP|Vwap]] 
Quote field that returns the [[Volume Weighted Average Price]] as calculated by the TradeStation network.
388 APPENDIX B: RESERVED WORDS QUICK REFERENCE 
Was 
Skip word. 
Wednesday 
Specifies day of the week Wednesday (numeric value = 3). 
While 
Defines instructions executed until a true/false expression returns false. 
White 
Specifies color White (numeric value = 8) for plots and backgrounds. 
Word 
Reserved for use with custom DLLs designed for EasyLanguage. 
Year 
Returns the year portion (YYYY) of an EasyLanguage cDate value. 
Yearfromdatetime 
Returns the year portion of DateTime. 
Yellow 
Specifies color Yellow (numeric value = 7) for plots and backgrounds. 
Yesterday 
References the previous bar, even when analyzing intraday bars. 
FALSE 
Assigns a false value to a variable. Checks the status of an expression. 
TRUE 
Assigns a true value to a variable. Checks the status of an expression.
About the Website 
T he companion Website for this book can be found at www.wiley.com/go/ 
tradingsystems (password: pruitt123). It includes a list of common EasyLanguage syntax errors and the EasyLanguage source code from the book, which will keep 
you from having to type the analysis techniques in by hand. This code is compatible with versions of TradeStation 9.0 or higher. 
Before starting the book it would be a good idea to download and import the files into your TradeStation. Once you download the files, do the following: 
1. Launch TradeStation and use the Import feature from within the TradeStation EasyLanguage Development Environment to import the code and begin using the files. 
2. Print the files by selecting File→Print from the pull-down menu. 
3. Save your edits under a new file name by selecting File→Save As from the pull-down menu. 
If you need assistance with using the files on the Website or have questions about the source code, please contact George Pruitt (george.p.pruitt@gmail.com) or Wiley Customer Service. 
Any questions regarding TradeStation products should be forwarded to TradeStation Securities at www.tradestation.com. 
389
Index 
Aan, Peter, 281–284 Adapting code, 195 American style options, 227 Analysis techniques programs, 33–40. See also 
TradeStation Anchor bar, selecting, 212 AND operator, 43 Argument list, 70 Arithmetic expressions, 5 Arps, Jan, 211 Arrays, 61 
Back-testing on daily bars, 76, 77 Balsara, Nauzer J., 171 Bar charts, 56–58, 204–208 Barna, Mike, 265–267 Batch processing, 202 Binary operators, 4–5 Bollinger Band calculation, 142 Bollinger Bandit trading strategy, 131–134, 
135 Book value, 224 BreakPoint call to invoke Debugger, 178, 180, 
182 Buy easier day, 148–149 
Calculation module of MyRSIsystem, 35–40 Camel ratio spreads, 244, 249, 250 Chahal, Ziad, 268–270 Chande, Tushar, 95 Changing conditions and options trading, 229 Chisholm, Michael, 284–286 ChoppyMarketIndexFunction, 69–70 Clayburg, John, 254–256 Closing options trades, 226–227 Code 
commenting out, 34, 194 reusing, 35, 68 syntax errors in, 176 
verifying, 60 See also Debugging; Program examples 
Colors for PaintBar studies, 63–64 Combinational strategies, 240–242 Commenting out code, 34, 194 Commitment of Traders Report (CFTC), 
191–196 Commodity Futures Trading Commission 
(CFTC) Website, 194 Compiled languages, 1 Computer languages, 1–2 Concatenation, 5 Conditional branching 
with if-then-else statements, 45–50 with if-then statements, 41–45 
Combinational strategies, 240–241 Covered option positions, 232 Credit spreads, 241 Curly brackets ({}), 34, 194 Curve-fitting, 84 Cycles, methods for finding, 145 
Data types, 2–4 Day of week analysis, 197–199 Day of week volatility analysis, 199–200 [[Day Trading|Day trading]], 200. See also Super Combo day 
trading strategy Debugger (EasyLanguage) 
description of, 175 limitations of, 182, 184 using, 178–182, 183 
Debugging logical and syntax errors, 176 with Print Statement and Print Log, 176–177, 
178, 189–190 setting up code for, 184–190 See also Debugger 
Decision processing, information required for, 41 
391
392 INDEX 
Delta, 229–230, 244 Development Environment (TradeStation 9.0), 
17–21 Diversification, magic of, 80–81 Donchian channel system, 141 Double bottom pattern, 205–208 Dynamic Break Out II trading strategy, 
141–147 
EasyLanguage case sensitivity of, 38 Debugger, 175, 178–184 Editor, 28–31, 38–39 multidata capabilities of, 208–210 Options dialog box, 39 overview of, 1–2 purpose of, 6, 33 
Ehlers, John interview with, 273–277 Rocket Science for Traders, 145 
Entry and exit efficiency, 87 Equivalent strategies, 239–240 European style options, 227 Excel and optimization 
version 2010, 108–113 versions prior to 2010, 99, 102–107 
Exercising options, 221–222 Expired options, 221, 222 Exponential [[Moving Average|moving average]], 165–166 Expressions, 4–7 
Failed [[Breakout|breakout]] methods, 149 Finite state machines, 207–208 Fitschen, Keith, 256–258 Flexibility 
of functions, 70 of indicators, 60–61 
For loops, 50–52 Formal parameter list, 70 Format Analysis Techniques & Strategies 
dialog box (TradeStation), 96, 98, 113, 114, 118, 119 
Format Report Settings dialog box (TradeStation), 92, 93 
Forward contracts, 220 Fox, Dave, 261–262 Function prototyping, 71 Functions 
creating, 68–69 passing values to, 36 TradeStation, 68–72 
Functions, built-in ADX and Average, 74 barsSinceEntry, 44 FundValue, 194 Highest, 75 marketPosition, 45 Momentum, 75 Round, 170 [[RSI]], 36, 75 StdDev, 169 
Fuzzy logic, 204 
Gamma, 230 [[Gap]] Back Filler trading strategy, 173–174 Genetic optimization, 113–117 GeoRussell trading strategy, 171–173 Ghost Trader trading strategy, 165–168 Graphs, scales of, 55–56 Greek parameters, 229–231, 244 Griffith, Wayne, 262–265 
Hill, Lundy, 279–281 
If-then-else statements, 45–50 If-then statements, 41–45 Indicators 
functions compared to, 70 overview of, 55–62 strategies compared to, 72 
Individual trade run-up and draw down, 87 
Inputs, 4 Intermarket analysis, 208–210 Intraday bars, 147 Intrinsic value, 224 
Jackson, J. T., 184 
Keltner, Chester, 128 King Keltner trading strategy, 128–131, 
132 
LeBeau, Charles “Chuck,” 277–279 Listed options, 222–223 Logical errors, 176, 184 Long calls, 233 Long calls with short stock, 235, 236 Long positions, 223–226 Long puts, 236–237 Long puts with long stock, 239 Looping, 50–52
Index 393 
Market makers, 231 Market volatility, measures of, 141–142 Marshall, Steve, 270–273 Mermer, Michael A., 286–288 Microsoft Excel. See Excel and optimization Mini Russell, taking advantage of [[Gap|gap]] 
openings in, 171–174 Modular programming, 35–40, 184 Money Manager trading strategy, 168–171 [[Moving Average|Moving average]] of closing prices, 55, 128–129 
Naked option positions, 232, 242, 244, 247 Naming variables, 2, 38 Nested if-then statements, 47 
Open-range [[Breakout|breakout]] system, 147–148 Open-to-close and open-to-open relationships, 
197, 199 Operators 
conditional expressions, 42–43 overview of, 4–5 precedence of, 5–7 
Optimization (TradeStation) Excel 2010, 108–113 Excel versions prior to 2010, 99, 102–107 genetic, 113–117 overview of, 95–99, 126 Strategy Optimization Report, 99, 100–102, 
117 time of day analysis, 201–204 Walk Forward Optimization, 121–125 walk-forward testing, 117–121 
Options trading American and European styles of, 227 basics of, 220–222 changing conditions and, 229 closing trades, 226–227 combinational strategies, 240–242 getting started with, 219–220 greek parameters, 229–231, 244 listed options, 222–223 long and short positions, 223–226 market makers, 231 nomenclature and terminology, 223 real-life strategies and trades, 242–250 single-option strategies, 232–240 special properties of options, 227–229 volatility trading, 229 
Orders, placing, 73 OR operator, 43 Out of the money, 221, 224 
Output Print Log, 178 Table Creator, 184–190 
PaintBar study, 62–66 Parameters 
greeks, 229–231, 244 reference-type, 71–72 simple and series, 70–71 See also Optimization 
Passing values to functions, 36 Pattern recognition, 204–208 Percent Change chart feature (TradeStation), 
212–217 Performance 
of group of stocks or commodities, tracking, 211–217 
of options, 227–229 Performance Graphs tab (TradeStation), 92, 93 Performance Report window (TradeStation), 
87–90 Pivot points, 205–208 Pivot tables, 102–104, 105, 108, 109–110 PlotPaintBar statement, 63–64, 66 Portfolio analysis, 79–80 PowerEditor (TradeStation 2000i), 8–10 Precedence of operators, 5–7 Print Log and Print Statement, debugging 
with, 176–177, 178, 189–190 Profit target stops, 48–49 Program control structures 
if-then-else statements, 45–50 if-then statements, 41–45 repetitive, 50–52 
Program examples Bollinger Bandit, 133 Dynamic Break Out II, 143 [[Gap]] Back Filler, 173–174 GeoRussell, 171–173 Ghost System, 166 King Keltner, 129 Money Manager, 170 Super Combo [[Day Trading|day trading]] strategy, 156–158 Table Creator, 184–185 Thermostat, 138–139 TradeStation 9.0, 21–28 TradeStation 2000i, 10–11 
Program headers, 34–35 Programming environments, elements of, 175 Programming indicators, 58–60 Protective stops, 48–49, 149–150
394 INDEX 
Pruitt, George, 141, 163, 171 Pseudocode, 127 
Ratio spreads, 244, 248–249 Reference-type parameters, 71–72 Relative Strength Index ([[RSI]]) function, 36, 75 Remarks, 1–2 Repetitive control structures, 50–52 Reports 
creating, 184–190 Strategy Optimization, 99, 100–102, 117 See also Summary report 
Researching trading ideas Commitment of Traders Report, 191–196 day of week analysis, 197–199 day of week volatility analysis, 199–200 intermarket analysis, 208–210 pattern recognition, 204–208 time of day analysis, 200–204 
Reserved words, 1 Reusing code, 35, 68 Rho, 230 RINA Systems, 80 Risk 
measuring, 169 trading options, 242–244 
Rotating surface charts, 107, 112 [[RSI]] (Relative Strength Index) function, 36, 75 
Seasonality, 145 Selection process, 211–213 Sell easier day, 148–149 Series parameters, 71 Short covered calls, 233–234 Short covered puts, 237, 238 Short naked calls, 234–235, 236 Short naked puts, 237, 238–239 Short positions, 223–226 Short-term swing mode, 135 ShowMe study, 62, 66–68 Simple parameters, 70–71 Single-option strategies, 232–240 Spread trading, 244, 247–248 Standard deviation, 131–132 Statements 
conditional branching, 41–50 description of, 3 PlotPaintBar, 63–64 Print, debugging with, 176–177, 178, 
189–190 Straddles, 241, 242 
Strategies Bollinger Bandit, 131–134, 135 Dynamic Break Out II, 141–147 [[Gap]] Back Filler, 173–174 GeoRussell, 171–173 Ghost Trader, 165–168 King Keltner, 128–131, 132 Money Manager, 168–171 robustness of, 126 Super Combo [[Day Trading|day trading]] strategy, 147–165 Thermostat, 134–141 TradeStation, 72–77 validity of, 79 
StrategyBuilder (TradeStation 2000i), 11–16, 22 
Strategy Optimization Report (TradeStation), 99, 100–102, 117 
Stridsman, Thomas, 95 Strike price, 220 Structured programming, 33–40 Stuckey, Randy, 258–261 Subroutines, 71 Summary report (TradeStation) 
account size required and return on account, 84 
average trade, 84–85 average winning and losing trade, 85–86 buy and hold return, 87 maximum consecutive winners and losers, 
85 maximum intraday draw down, 81, 83–84 number of trades and average number of 
bars per trade, 85 overview of, 80–81, 82–83 Rina index, 86–87 Sharpe ratio, 86 total net profit, 81 trades, 87–90 
Super Combo [[Day Trading|day trading]] strategy code, 156–158 daily data bar calculation pseudocode, 
152–156 overview of, 147–152 performance, 159, 163, 164 summary, 160–165 trades, 160 
Surface charts, three-dimensional, 104, 106, 107, 108, 110–112 
Sweeney, John, 90 Switching modes, 135 Syntax errors, 176
Index 395 
Table Creator, 184–190 Technical analysis, elements of, 211 Thermostat trading strategy, 134–141 Theta, 230, 244 Three-dimensional surface or contour charts, 
104, 106, 107, 108, 110–112 Tick data, 152 Time frames, use of multiple, 150–152 Time of day analysis, 200–204 Time value, 225 Tolan, John, 270–273 Total efficiency, 87, 90 Tracking relative performance, 211–217 Trade Analysis tab (TradeStation), 90–92 TradeStation 
evolution of, 79 functions, 68–72 graphs, 92–95 indicators, 55–62 PaintBar and ShowMe studies, 62–68 Percent Change chart feature, 212–217 as research tool, 191 strategies, 72–77 summary report, 80–90 Trade Analysis tab, 90–92 uses of, 72 versions of, 7–8 See also Optimization 
TradeStation 9.0 Development Environment, 17–21 EasyLanguage Editor, 28–31, 38–39 simple program example, 21–28 
TradeStation 2000i PowerEditor, 8–10 simple program example, 10–11 StrategyBuilder, 11–16, 22 
Trading at parity, 226 Trading Solutions Website, 115 Trading strategies. See Strategies Trailing stops, problems with, 76, 77 Translated languages, 1 Trend-following mode, 132 Trend-following systems, 144–145 True ranges, 129 Tweaking code, 68 
Underlying assets, 220 Underwater Equity Curve (TradeStation), 
94 
Values, passing to functions, 36 Variables, 2–4, 38 Vega, 230 Verifying code, 60 Volatility trading, 229 
Walk Forward Optimization (WFO), 121–125 
Walk-forward testing, 112–113, 117–121 Weekend time decay, 249–250 While loops, 52 Wilder, Welles, 251–254 Williams, Larry, 288–294