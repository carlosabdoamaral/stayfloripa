import ReactDOM from "react-dom/client";
import reportWebVitals from "./reportWebVitals";

// import { initializeApp } from "firebase/app";
// import { getAnalytics } from "firebase/analytics";
// import { firebaseConfig } from "./firebase";
// import { BrowserRouter, Route, Routes } from "react-router-dom";
// import { HomeView } from "./views/home/home";
import "./assets/styles/index.scss";
import { ToastContainer } from "react-bootstrap";
import React from "react";
import App from "./App";

// const app = initializeApp(firebaseConfig);
// getAnalytics(app);

const root = ReactDOM.createRoot(
  document.getElementById("root") as HTMLElement
);

root.render(
  <React.StrictMode>
    <ToastContainer />
    <App />
  </React.StrictMode>
);

reportWebVitals();
