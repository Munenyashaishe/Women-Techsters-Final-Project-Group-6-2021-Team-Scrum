import './App.module.css';
import NavigationBar from './components/Navigation/NavigationBar';
import Home from './pages/Home';
import { Route, Switch } from 'react-router-dom';

function App() {
  return (
    <div className="App">
      <NavigationBar />
      <Switch>
        <Route path="/home" component={Home} />
      </Switch>
    </div>
  );
}

export default App;
