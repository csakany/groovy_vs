# CPI Groovy Local Runner (IntelliJ-style, offline-ready)

This repo lets you run **SAP CPI-style Groovy scripts** locally using a plain `groovy` command or the VS Code ▶ play button.  
It mirrors an IntelliJ-style flow: one CPI script and one matching runner that constructs a Camel `Exchange` and passes it into the CPI `Message` (from `cpi-mock-msg.jar`).

## Structure
```
cpi-groovy-offline-template/
├─ libs/                         # jars live here
├─ src/
│  ├─ main/resources/script/sample.groovy    # CPI-style script (package src.main.resources.script)
│  └─ test/sample_test.groovy                # IntelliJ-like runner
├─ data/
│  ├─ in/sample.xml
│  └─ out/ (results written here)
└─ .vscode/settings.json         # play-button runs current test with correct classpath
```

## Run with VS Code ▶ play
Open `src/test/sample_test.groovy` and press ▶. The classpath is set in `.vscode/settings.json` and matches the CLI above.

## Notes
- Keep your CPI scripts under `src/main/resources/script/` with package `src.main.resources.script`.
- The runner reads `data/in/sample.xml`, executes `processData(Message)`, and writes `data/out/result.xml`.