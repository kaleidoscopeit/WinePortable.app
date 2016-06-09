* Wine Engine

  - Wine viene ditribuito in varie versioni, molto spesso per talune applicazioni è necessario usare certe specifiche versioni.
  - WinePortable consente di usare una specifica versione di Wine copiandola da quelle che scarica PlayOnLinux nella sua directory di configurazione ( ~/.PlayOnLinux/WineVersions )
      Per installare uno specifico motore scaricare la versione desiderata usando il pannello di PlayOnLinux e copiare ~/.PlayOnLinux/WineVersions/[tua versione]/usr in app/wine

  - E' possibile usare il portable con l'installazione Wine di sistema, ma è sconsigliato, perchè rende l'applicazione non più portabile

* Installare una applicazione da WinePortable

  NOTA : allo stato attuale e per applicazioni complesse è consigliabile installare seguire la procedura con il supporto di PlayOnLinux

  - È consigliato installare un motore Wine, per sapere quale versione usare per l'applicazione che si vuole installare andare sul sito WineHQ se non si sa quale versione usare installare l'ultima
  - Procurarsi l'installer della applicazione
  - Eseguire app/tools/file_manager
  - Cercare l'eseguibile ed aprirlo
  - Attendere il completamento
  - Se nel frattempo si è chiuso rieseguire app/tools/file_manager
  - Cercare l'eseguibile della applicazione installata ( probabilmente in C:\Programmi\[nome applicazione]\eseguibile.exe ) e lanciarlo

* Creare il lanciatore rapido

  - Cercare la posizione dell'eseguibile/i installato
  - Aprire per la modifica 'YourAppName.star'
  - Modificare 'APPLICATION_PATH' come descritto nel commento
  - Modificare 'EXECUTABLE' come descritto nel commento
  - Rinominare 'YourAppName.star' a piacere

* Creare un portable da un prefisso Wine esistente

  - Copiare il contenuto di ~/.wine/ in app/prefix
  - Eseguire app/tools/file_manager per provare se funziona tutto
  - Creare eventualmente il lanciatore rapido se necesasario

  NOTA: È necessario fare delle prove, con il lanciatore rapido viene applicata anche l'Integrazione Desktop che, specialmente nel caso della integrazione
        della home crea dei problemi su alcune applicazioni

* Creare un portable da un prefisso PlayOnLinux

  - Copiare il contenuto di ~/.PlayOnLinux/wineprefix/[nome applicazione]/ in app/prefix
  - Copiare il motore wine usato dalla applicazione ( Vedi il pannello di PlayOnLinux )
  - Creare eventualmente il lanciatore rapido
