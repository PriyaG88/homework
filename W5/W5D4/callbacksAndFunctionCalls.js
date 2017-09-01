//Ways to call a Function

function Cat () {
  this.name = 'Markov';
  this.age = 3;
}

function Dog () {
  this.name = 'Noodles';
  this.age = 4;
}

Dog.prototype.chase = function (cat) {
  console.log(`My name is ${this.name} and I'm chasing ${cat.name}! Woof!`)
};

const Markov = new Cat ();
const Noodles = new Dog ();

Noodles.chase(Markov);

Noodles.chase.call(Markov, Noodles);

Noodles.chase.apply(Markov, [Noodles]);

//Some tea? Some biscuits?

const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

function teaAndBiscuits() {

  reader.question("Would you like tea? ", function(answer) {
    console.log(`Your response was ${answer}.`);

    reader.question("Would you like biscuits? ", function(answer2) {
      console.log(`So you said ${answer} to tea and ${answer2} to biscuits!`);
      reader.close();
    });
  });
}

teaAndBiscuits();

//Simple Timeout

window.setTimeout(function() {
  alert('HAMMERTIME!');
}, 5000);

//Timeout plus Closure

function hammerTime(time) {
  window.setTimeout(function() {
    alert(time + ' is hammertime!');
  }, time);
}
