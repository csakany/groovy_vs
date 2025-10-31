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

## Run from the command line

### macOS & Linux

Use the helper script (it builds the correct colon-separated classpath automatically):

```bash
./scripts/run_groovy.sh src/test/sample_test.groovy
```

You can pass any additional arguments after the script path and they will be forwarded to Groovy.

### Windows PowerShell / CMD

Use the same command structure but keep the Windows classpath separators:

```powershell
java -cp "libs\cpi-mock-msg.jar;libs\groovy-all-2.4.21.jar;libs\camel-api-3.14.7.jar;libs\camel-base-3.14.7.jar;libs\camel-base-engine-3.14.7.jar;libs\camel-core-engine-3.14.7.jar;libs\camel-core-languages-3.14.7.jar;libs\camel-core-model-3.14.7.jar;libs\camel-support-3.14.7.jar;libs\camel-util-3.14.7.jar;libs\slf4j-api-1.7.36.jar;libs\slf4j-simple-1.7.36.jar;src\main\resources;src\test" groovy.ui.GroovyMain src\test\sample_test.groovy
```

## Notes
- Keep your CPI scripts under `src/main/resources/script/` with package `src.main.resources.script`.
- The runner reads `data/in/sample.xml`, executes `processData(Message)`, and writes `data/out/result.xml`.