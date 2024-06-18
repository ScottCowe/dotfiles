import { applauncher } from "./applauncher.js"
import { Bar } from "./bar.js"

App.config({
    windows: [applauncher],
})

App.config({
    style: "./style.css",
    windows: [
      Bar(0),
      Bar(1)
    ],
})

