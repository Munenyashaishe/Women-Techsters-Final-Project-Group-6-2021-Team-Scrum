import React from 'react'
import Contact from './components/Contact'
import Footer from './components/Footer'
import Icons from './components/Icons'


function App() {

  //submit form
  const submitForm = (e) => {
    console.log(e.target.value)
  }

  return (
    <div className="container">
      <Contact onSubmit ={submitForm}/>
      <Icons />
      <Footer />
    </div>
  );
}

export default App;
