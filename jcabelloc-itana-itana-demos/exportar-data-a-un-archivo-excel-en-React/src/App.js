import "./App.css";
import { BrowserRouter, Route, Routes } from "react-router-dom";
import AdmProductos from "./AdmProductos/AdmProductos";
import 'bootstrap/dist/css/bootstrap.min.css';

function App() {
  return (
    <BrowserRouter>
      <Routes>
        <Route path="/productos" element={<AdmProductos />} />
      </Routes>
    </BrowserRouter>
  );
}

export default App;
