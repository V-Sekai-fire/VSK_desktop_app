# AutomationApp: A Desktop Automation App

This application is an Elixir LiveView based desktop application. It uses the elixir-desktop library and a local SQLite database to create a web-technology based desktop app.

## Roadmap

- [x] Build a desktop app
- [x] Add a webview
- [x] Create a sqlite database
- [x] Show a CRUD view of the database
- [x] Integrate kaffy admin panel
- [ ] Take a glb and apply gltfpack
    - [ ] glb as a membrane source element
    - [ ] gltfpack as a membrane filter element to optimize gltf
    - [ ] gltfpack as a membrane filter element as a way to get json statistics
    - [ ] glb as a membrane sink element

## Application set-up

Run:

```bash
cd assets
npm install
cd ..
mix assets.deploy
```
