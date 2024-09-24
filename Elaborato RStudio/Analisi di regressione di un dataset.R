mydataset=read.csv('Dataset_IZ_gruppo1.csv')
View(mydataset)

#ANALISI DI CORRELAZIONE TRA LE VARIABILI DI INGRESSO E QUELLA DI USCITA
  dev.new(); plot(mydataset$x1_CPU, mydataset$y_prestazSWcalc,
                  main="Analisi della correlazione tra Indice stand. e centr. di velocita' CPU e Indice stand. e centr. delle prestazioni SW",
                  xlab="Indice stand. e centr. di velocita' CPU",
                  ylab="Indice stand. e centr. delle prestazioni SW")
  lines(lowess(mydataset$x1_CPU, mydataset$y_prestazSWcalc), col="red", lty=2) #Rappresentazione della linea di andamento
  cat("Correlazione tra Indice stand. e centr. di velocita' CPU e Indice stand. e centr. delle prestazioni CW: ", cor(mydataset$x1_CPU, mydataset$y_prestazSWcalc))
  
  dev.new(); plot(mydataset$x2_HD, mydataset$y_prestazSWcalc,
                  main="Analisi della correlazione tra Indice stand. e centr. di dimensione HD e Indice stand. e centr. delle prestazioni SW",
                  xlab="Indice stand. e centr. di dimensione HD",
                  ylab="Indice stand. e centr. delle prestazioni SW")
  lines(lowess(mydataset$x2_HD, mydataset$y_prestazSWcalc), col="red", lty=2)
  cat("Correlazione tra Indice stand. e centr. di dimensione HD e Indice stand. e centr. delle prestazioni SW: ", cor(mydataset$x2_HD, mydataset$y_prestazSWcalc))
  
  dev.new(); plot(mydataset$x3_proc, mydataset$y_prestazSWcalc,
                  main="Analisi della correlazione tra Indice stand. e centr. legato al numero di processi SW e Indice stand. e centr. delle prestazioni SW",
                  xlab="Indice stand. e centr. legato al numero di processi SW",
                  ylab="Indice stand. e centr. delle prestazioni SW")
  lines(lowess(mydataset$x3_proc, mydataset$y_prestazSWcalc), col="red", lty=2)
  cat("Correlazione tra Indice stand. e centr. legato al numero di processi SW e Indice stand. e centr. delle prestazioni SW: ", cor(mydataset$x3_proc, mydataset$y_prestazSWcalc))
  
  dev.new(); plot(mydataset$x4_aging, mydataset$y_prestazSWcalc,
                  main="Analisi della correlazione tra Indice stand. e centr. legato all'aging SW e Indice stand. e centr. delle prestazioni SW",
                  xlab="Indice stand. e centr. legato all'aging SW",
                  ylab="Indice stand. e centr. delle prestazioni SW")
  lines(lowess(mydataset$x4_aging, mydataset$y_prestazSWcalc), col="red", lty=2)
  cat("Correlazione tra Indice stand. e centr. legato all'aging SW e Indice stand. e centr. delle prestazioni SW: ", cor(mydataset$x4_aging, mydataset$y_prestazSWcalc))
  
  dev.new(); plot(mydataset$x5_audio, mydataset$y_prestazSWcalc,
                  main="Analisi della correlazione tra Indice stand. e centr. legato alle prestazioni scheda audio e Indice stand. e centr. delle prestazioni SW",
                  xlab="Indice stand. e centr. legato alle prestazioni scheda audio",
                  ylab="Indice stand. e centr. delle prestazioni SW")
  lines(lowess(mydataset$x5_audio, mydataset$y_prestazSWcalc), col="red", lty=2)
  cat("Correlazione tra Indice stand. e centr. legato alle prestazioni scheda audio e Indice stand. e centr. delle prestazioni SW: ", cor(mydataset$x5_audio, mydataset$y_prestazSWcalc))
  
  dev.new(); plot(mydataset$x6_RAM, mydataset$y_prestazSWcalc,
                  main="Analisi della correlazione tra Indice stand. e centr. legato alle prestazioni RAM e Indice stand. e centr. delle prestazioni SW",
                  xlab="Indice stand. e centr. legato alle prestazioni RAM",
                  ylab="Indice stand. e centr. delle prestazioni SW")
  lines(lowess(mydataset$x6_RAM, mydataset$y_prestazSWcalc), col="red", lty=2)
  cat("Correlazione tra Indice stand. e centr. legato alle prestazioni RAM e Indice stand. e centr. delle prestazioni SW: ", cor(mydataset$x6_RAM, mydataset$y_prestazSWcalc))
  
  
  #Per mostrare l'analisi di correlazione di tutte le variabili indipendenti e' possibile utilizzare la funzione plot() sull'intero dataset
  dev.new(); plot(mydataset, col="black")
  
  #METODO ALTERNATIVO TRAMITE LA FUNZIONE corrplot
    dev.new(); library(corrplot)  
    corrplot.mixed(cor(mydataset[,2:7]),
                   lower = "circle",
                   upper = "circle",
                   bg = "white",
                   addgrid.col = "grey",
                   lower.col = rainbow(20),
                   upper.col = rainbow(20))

#RAPPRESENTAZIONE DEGLI ISTOGRAMMI
  N=100
  k=round(1+33/10*log10(N), 0) #Calcolo del numero di classi con conseguente arrotondamento per eccesso
  
  dev.new(); hist(mydataset$y_prestazSWcalc, las=1, freq = FALSE, breaks=k, main="Istogramma delle prestazioni SW", xlab="Indice stand. e centr. delle prestazioni SW", col="blue");
  lines(density(mydataset$y_prestazSWcalc), lwd=2, col="black")
  cat("Variabile y:\nMedia: ", mean(data$y_prestazSWcalc),
      "\nMediana: ", median(data$y_prestazSWcalc),
      "\nRange dei valori: ", range(data$y_prestazSWcalc),
      "\nEscursione campionaria: ", max(data$y_prestazSWcalc)-min(data$y_prestazSWcalc),
      "\nVarianza: ", var(data$y_prestazSWcalc),
      "\nDeviazione standard: ", sqrt(var(data$y_prestazSWcalc)),
      "\nCoefficiente di variazione: ", sqrt(var(data$y_prestazSWcalc))/mean(data$y_prestazSWcalc))
  
  dev.new(); hist(mydataset$x1_CPU, las=1, freq = FALSE, breaks=k, main="Istogramma della velocita' di CPU", xlab="Indice stand. e centr. di velocita' CPU", col="red");
  lines(density(mydataset$x1_CPU), lwd=2, col="black")
  
  dev.new(); hist(mydataset$x2_HD, las=1, freq = FALSE, breaks=k, main="Istogramma della dimensione di HD", xlab="Indice stand. e centr. di dimensione HD", col="yellow");
  lines(density(mydataset$x2_HD), lwd=2, col="black")
  
  dev.new(); hist(mydataset$x3_proc, las=1, freq = FALSE, breaks=k, main="Istogramma del numero di processi di SW", xlab="Indice stand. e centr. legato al numero di processi SW", col="purple");
  lines(density(mydataset$x3_proc), lwd=2, col="black")
  
  dev.new(); hist(mydataset$x4_aging, las=1, freq = FALSE, breaks=k, main="Istogramma dell'aging di SW", xlab="Indice stand. e centr. legato all'aging SW", col="green");
  lines(density(mydataset$x4_aging), lwd=2, col="black")
  
  dev.new(); hist(mydataset$x5_audio, las=1, freq = FALSE, breaks=k, main="Istogramma delle prestazioni della scheda audio", xlab="Indice stand. e centr. legato alle prestazioni scheda audio", col="orange");
  lines(density(mydataset$x5_audio), lwd=2, col="black")
  
  dev.new(); hist(mydataset$x6_RAM, las=1, freq = FALSE, breaks=k, main="Istogramma delle prestazioni della RAM", xlab="Indice stand. e centr. legato alle prestazioni RAM", col="grey");
  lines(density(mydataset$x6_RAM), lwd=2, col="black")
  
#ANALISI DEI DATI TRAMITE BOXPLOT
  dev.new(); boxplot(mydataset$y_prestazSWcalc,
                     main = "Indice standardizzato e centrato delle prestazioni SW di calcolo",
                     col = "red",
                     border = "black",
                     horizontal = TRUE,
                     notch = TRUE)
  
  dev.new(); boxplot(mydataset$x1_CPU,
                     main = "Indice standardizzato e centrato di velocita' CPU",
                     col = "yellow",
                     border = "black",
                     horizontal = TRUE,
                     notch = TRUE)
  
  dev.new(); boxplot(mydataset$x2_HD,
                     main = "Indice standardizzato e centrato di dimensione HD",
                     col = "orange",
                     border = "black",
                     horizontal = TRUE,
                     notch = TRUE)
  
  dev.new(); boxplot(mydataset$x3_proc,
                     main = "Indice standardizzato e centrato legato al numero di processi SW",
                     col = "green",
                     border = "black",
                     horizontal = TRUE,
                     notch = TRUE)
  
  dev.new(); boxplot(mydataset$x4_aging,
                     main = "Indice standardizzato e centrato legato all'aging SW",
                     col = "blue",
                     border = "black",
                     horizontal = TRUE,
                     notch = TRUE)
  
  dev.new(); boxplot(mydataset$x5_audio,
                     main = "Indice standardizzato e centrato legato alle prestazioni scheda audio",
                     col = "purple",
                     border = "black",
                     horizontal = TRUE,
                     notch = TRUE)
  
  dev.new(); boxplot(mydataset$x6_RAM,
                     main = "Indice standardizzato e centrato legato alle prestazioni RAM",
                     col = "grey",
                     border = "black",
                     horizontal = TRUE,
                     notch = TRUE)
  
  dev.new(); boxplot(scale(mydataset[2:7]),
                     main="Indice standardizzato e centrato legato alle molteplici variabili coinvolte",
                     col=rainbow(20),
                     horizontal=TRUE,
                     notch=TRUE)

#REGRESSIONE POLINOMIALE E VALUTAZIONE DELLA RELAZIONE TRE LA Y E LE SINGOLE X
  data=na.omit(mydataset) #Funzione necessaria per la rimozione di valori mancanti (Not Available, NA)
  
  summary(lm(data$y_prestazSWcalc~data$x1_CPU)) #Regressore X1
  summary(lm(data$y_prestazSWcalc~data$x1_CPU+I(data$x1_CPU^2))) #Regressore X1^2
  summary(lm(data$y_prestazSWcalc~data$x1_CPU+I(data$x1_CPU^2)+I(data$x1_CPU^3))) #Regressore X1^3
  summary(lm(data$y_prestazSWcalc~data$x1_CPU+I(data$x1_CPU^2)+I(data$x1_CPU^3)+I(data$x1_CPU^4))) #Regressore X1^4
  
  summary(lm(data$y_prestazSWcalc~data$x2_HD)) #Regressore X2
  summary(lm(data$y_prestazSWcalc~data$x2_HD+I(data$x2_HD^2))) #Regressore X2^2
  summary(lm(data$y_prestazSWcalc~data$x2_HD+I(data$x2_HD^2)+I(data$x2_HD^3))) #Regressore X2^3
  summary(lm(data$y_prestazSWcalc~data$x2_HD+I(data$x2_HD^2)+I(data$x2_HD^3)+I(data$x2_HD^4))) #Regressore X2^4
  
  summary(lm(data$y_prestazSWcalc~data$x3_proc)) #Regressore X3
  summary(lm(data$y_prestazSWcalc~data$x3_proc+I(data$x3_proc^2))) #Regressore X3^2
  summary(lm(data$y_prestazSWcalc~data$x3_proc+I(data$x3_proc^2)+I(data$x3_proc^3))) #Regressore X3^3
  summary(lm(data$y_prestazSWcalc~data$x3_proc+I(data$x3_proc^2)+I(data$x3_proc^3)+I(data$x3_proc^4))) #Regressore X3^4
  
  summary(lm(data$y_prestazSWcalc~data$x4_aging)) #Regressore X4
  summary(lm(data$y_prestazSWcalc~data$x4_aging+I(data$x4_aging^2))) #Regressore X4^2
  summary(lm(data$y_prestazSWcalc~data$x4_aging+I(data$x4_aging^2)+I(data$x4_aging^3))) #Regressore X4^3
  summary(lm(data$y_prestazSWcalc~data$x4_aging+I(data$x4_aging^2)+I(data$x4_aging^3)+I(data$x4_aging^4))) #Regressore X4^4
  
  summary(lm(data$y_prestazSWcalc~data$x5_audio)) #Regressore X5
  summary(lm(data$y_prestazSWcalc~data$x5_audio+I(data$x5_audio^2))) #Regressore X5^2
  summary(lm(data$y_prestazSWcalc~data$x5_audio+I(data$x5_audio^2)+I(data$x5_audio^3))) #Regressore X5^3
  summary(lm(data$y_prestazSWcalc~data$x5_audio+I(data$x5_audio^2)+I(data$x5_audio^3)+I(data$x5_audio^4))) #Regressore X5^4
  
  summary(lm(data$y_prestazSWcalc~data$x6_RAM)) #Regressore X6
  summary(lm(data$y_prestazSWcalc~data$x6_RAM+I(data$x6_RAM^2))) #Regressore X6^2
  summary(lm(data$y_prestazSWcalc~data$x6_RAM+I(data$x6_RAM^2)+I(data$x6_RAM^3))) #Regressore X6^3
  summary(lm(data$y_prestazSWcalc~data$x6_RAM+I(data$x6_RAM^2)+I(data$x6_RAM^3)+I(data$x6_RAM^4))) #Regressore X6^4

#DEFINIZIONE DEL MODELLO STATISTICO DEI DATI TRAMITE REGRESSIONE LINEARE MULTIPLA
  #Y=B0+B1X1+B2X2+...+BnXn
  fit1=lm(data$y_prestazSWcalc~data$x1_CPU+data$x2_HD+data$x3_proc+data$x4_aging+data$x5_audio+data$x6_RAM, data=data) #Modello iniziale
  summary(fit1) #Hybrid Stepwise con criterio basato sul valore di R^2
  
  fit2=lm(data$y_prestazSWcalc~data$x1_CPU+I(data$x1_CPU^2)+I(data$x1_CPU^3)+data$x2_HD+data$x3_proc+I(data$x3_proc^2)+I(data$x3_proc^3)+data$x4_aging+I(data$x4_aging^2)+I(data$x4_aging^3)+data$x5_audio+data$x6_RAM+I(data$x6_RAM^2), data=data)
  summary(fit2) #Si è cercato di far incrementare il valore di R^2, per precisione Adjusted R^2
  
  fit3=lm(data$y_prestazSWcalc~data$x1_CPU+data$x2_HD+data$x3_proc+I(data$x3_proc^2)+data$x4_aging+data$x5_audio+data$x6_RAM, data=data)
  summary(fit3) 
  
  fit4=lm(data$y_prestazSWcalc~data$x1_CPU+data$x3_proc+I(data$x3_proc^2)+data$x4_aging+data$x5_audio+data$x6_RAM, data=data)
  summary(fit4)#Modello risultante

#STIMA AI MINIMI QUADRATI DEL MODELLO O DEI MODELLI E DETERMINAZIONE DEGLI INTERVALLI DI CONFIDENZA DEI PARAMETRI
  #Informazioni aggiuntive correlate al modello ottimale trovato nel punto precedente
  attributes(fit4) #Lista attributi dell'oggetto
  coef(fit4) #Vettore dei coefficienti di regressione
  deviance(fit4) #Devianza dei residui
  residuals(fit4) #Vettore dei residui del modello
  fitted(fit4) #Valori della risposta stimati dal modello
  model.matrix(fit4) #Matrice X del modello di regressione
  summary(fit4, correlation=TRUE) #Correlazioni tra i coefficienti
  vcov(fit4) #Matrice delle varianze e covarianze dei coefficienti di regressione
  
  #Dopo aver stimato il modello di regressione e' necessario verificare che le IPOTESI DI BASE siano valide, tramite opportuni test statistici
  t.test(residuals(fit4)) #Si verifica che la media degli errori non sia significativamente diversa da zero attuando il test t di Student
  #Il valore di p-value e' maggiore di quello limite (Alpha=0.05), e' possibile confermare H0
  
  shapiro.test(residuals(fit4)) #Verifica della normalita' della distribuzione degli errori con il test di Shapiro-Wilk
  #Il valore di W e' molto vicino a 1, quindi l'ipotesi nulla della distribuzione dei valori campionari come una variabile causale normale viene accettata
  qqnorm(scale(residuals(fit4))) #Applicazione grafica del test ai residui standardizzati
  
  library(lmtest)
  bptest(formula(fit4), data=data) #Verifica dell'omoschedasticita' dei residui tramite test di Breusch-Pagan noto anche come Cook-Weisberg
  #Il valore di p e' maggiore della soglia del 5% (0.05), quindi l'ipotesi nulla di omoschedasticita' viene accettata
  
  dwtest(formula(fit4), data=data) #Verifica dell'assenza di correlazione seriale tramite test di Durbin-Watson
  #Il valore di d e' compreso tra 0 e 4, nello specifico molto vicino a 2. Si puo' quindi affermare che non appare presente alcuna autocorrelazione
  
  #Tutti i test di specificazione del modello hanno dato esito positivo, possiamo affermare che le ipotesi alla base del modello di regressione OLS (Stima ai minimi quadrati)
  #sono valide. Si passa ora alla determinazione degli intervalli di confidenza
  
  #Intervalli di confidenza al 95% (forniti di default) e al 99% dei regressori X1, X2, x3, x4, x5, x6
  confint(fit4)
  confint(fit4, level=0.99)
  
  #Quando il dataset inizia a riempirsi ulteriormente di valori, ci si aspetta che la relazione continui ad essere mantenuta. Questa base di valori che rappresenta quelli
  #noti e' il Training Set, mentre i futuri costituiranno il Test Set. Il primo e' ovviamente noto, il secondo no perche' si tratta di valori futuri.
  #Si prende quindi il dataset e si divide in un certo punto per il quale tutti i valori prima costituiscono il Training set effettivo,
  #tutti quelli dopo si ipotizza di non conoscerli dando vita cosi' al Test set. Si verifica poi se il sistema riesce a riconoscere i valori futuri.
  
  splitpoint=75
  trainset=data[1:splitpoint, ]
  testset=data[(splitpoint+1):100, ]
  trainlm=lm(y_prestazSWcalc~x1_CPU+x3_proc+I(x3_proc^2)+x4_aging+x5_audio+x6_RAM, data=trainset)
  plot(testset$y_prestazSWcalc, col="black")
  lines(predict(trainlm, testset, interval = "predict")[, 2], col="red", lty=2)
  lines(predict(trainlm, testset, interval = "predict")[, 3], col="red", lty=2)
  cbind(testset, " ", predict(trainlm, testset, interval = "predict"))
  
#CALCOLO DEL COEFFICIENTE DI DETERMINAZIONE E GRAFICI DIAGNOSTICI DEI MODELLI STATISTICI IN ESAME
  sqtot=sum((data$y_prestazSWcalc-mean(data$y_prestazSWcalc))^2) #Applicazione della formula per ottenere R^2
  sqe=sum((data$y_prestazSWcalc-fit4$fitted.values)^2)
  (sqtot-sqe)/sqtot
  
  #CALCOLO ALTERNATIVO DEL COEFFICIENTE DI DETERMINAZIONE
    library(modelr) #Metodo alternativo alla formula per il calcolo di R^2
    rsquare(fit4, data=data)
  
  #Grafici diagnostici
  plot(fit1,
       main="Modello 1",
       sub="Valori stimati del modello")
  
  plot(fit2,
       main="Modello 2",
       sub="Valori stimati del modello")
  
  plot(fit3,
       main="Modello 3",
       sub="Valori stimati del modello")
  
  plot(fit4,
       main="Modello 4",
       sub="Valori stimati del modello")

#SCELTA DEL MODELLO CHE MEGLIO SI ADATTA AI DATI FORNITI
  #Scelta del modello basata su AIC e BIC
  library(broom)
  cat("Modello 1:\n")
  glance(fit1)
  cat("\nModello 2:\n")
  glance(fit2)
  cat("\nModello 3:\n")
  glance(fit3)
  cat("\nModello 4:\n")
  glance(fit4)
  cat("\nIl valore di AIC minore è: ", min(AIC(fit1, fit2, fit3, fit4)[2]), "\n")
  cat("\nIl valore di BIC minore è: ", min(BIC(fit1, fit2, fit3, fit4)[2]), "\n")
  if(min(AIC(fit1, fit2, fit3, fit4)[2])==AIC(fit4) && min(AIC(fit1, fit2, fit3, fit4)[2])==BIC(fit4)){
    cat("Il Modello 4 è quello ottimale")
  }
  
  #ESECUZIONI ALTERNATIVE
    #Scelta del modello basata su AIC
    library(AICcmodavg)
    models=list(fit1, fit2, fit3, fit4)
    model.names=c("Modello 1", "Modello 2", "Modello 3", "Modello 4")
    aictab(cand.set=models, modnames=model.names)
    
    #Scelta del modello basata su AIC (strada alternativa, applicata in caso di malfunzionamento della funzione aictab dovuto a errori sulla libreria AICcmodavg)
    cat("Elenco dei valori di AIC:\n")
    AIC(fit1, fit2, fit3, fit4)
    cat("\nIl valore di AIC minore è: ", min(AIC(fit1, fit2, fit3, fit4)[2]))
    
    #Scelta del modello basata su BIC
    cat("Elenco dei valori di BIC:\n")
    BIC(fit1, fit2, fit3, fit4)
    cat("\nIl valore di BIC minore è: ", min(BIC(fit1, fit2, fit3, fit4)[2]))
  
  #Scelta basata su Mean Square Error (MSE)
  #Funzione per il calcolo del MSE
  mse_func=function(actual, predicted){
    mean((actual-predicted)^2)
  }
  
  cat("Elenco dei valori MSE:\nModello 1: ", mse_func(data$y_prestazSWcalc, fit1$fitted.values),
      "\nModello 2: ", mse_func(data$y_prestazSWcalc, fit2$fitted.values),
      "\nModello 3: ", mse_func(data$y_prestazSWcalc, fit3$fitted.values),
      "\nModello 4: ", mse_func(data$y_prestazSWcalc, fit4$fitted.values))
  
  cat("La soluzione e' proposta dal Modello 4, il cui MSE e': ", mse_func(data$y_prestazSWcalc, fit4$fitted.values), "in quanto e' il modello che meglio si bilancia tra tale valore e l'Overfitting")
  
  #Modello di regressione ottenuto tramite stepwise (forward, backward, hybrid)
  step(fit4, direction="forward"); cat("\nValore AIC: ", AIC(step(fit4, direction="forward")), "\n")
  step(fit4, direction="backward"); cat("\nValore AIC: ", AIC(step(fit4, direction="backward")), "\n")
  step(fit4, direction="both"); cat("\nValore AIC: ", AIC(step(fit4, direction="both")), "\n")