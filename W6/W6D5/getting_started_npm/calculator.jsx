import React from 'react';

class Calculator extends React.Component {
  constructor(props) {
    super(props);
    // your code here
    this.state = {result: 0, num1: "", num2: ""};
  }

  // your code here
  setNum1(e) {
    this.setState({num1: parseInt(e.target.value)});
  }

  setNum2(e) {
    this.setState({num2: parseInt(e.target.value)});
  }

  add(e) {
    e.preventDefault();
    this.setState({result: this.state.num1 + this.state.num2});
  }

  subtract(e) {
    e.preventDefault();
    this.setState({result: this.state.num1 - this.state.num2});
  }

  multiply(e) {
    e.preventDefault();
    this.setState({result: this.state.num1 * this.state.num2});
  }

  divide(e) {
    e.preventDefault();
    this.setState({result: this.state.num1 / this.state.num2});
  }

  clear(e) {
    e.preventDefault();
    this.setState({result: 0, num1: "", num2: ""});
  }

  render() {
    const {result, num1, num2} = this.state;
    return (
      <div>
        <input value={num1} onChange={this.setNum1.bind(this)} />
        <input value={num2} onChange={this.setNum2.bind(this)} />
        <div>Result: {result}</div>
        <br></br>
        <button onClick={(e => this.add(e))}>+</button>
        <button onClick={(e => this.subtract(e))}>-</button>
        <button onClick={(e => this.multiply(e))}>*</button>
        <button onClick={(e => this.divide(e))}>/</button>
        <button onClick={(e => this.clear(e))}>clear</button>

      </div>
    );
  }
}

export default Calculator;
