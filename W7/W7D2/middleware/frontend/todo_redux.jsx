import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';

import Root from './components/root';

document.addEventListener('DOMContentLoaded', () => {
  const preloadedState = localStorage.state ?
    JSON.parse(localStorage.state) : {};
  const store = configureStore(preloadedState);
  store.dispatch = addLoggingToDispatch(store);

  const root = document.getElementById('content');
  ReactDOM.render(<Root store={store} />, root);
});

const addLoggingToDispatch = store => next => action => {
  // your code here
  console.log('Old state: ', store.getState());
  console.log(action);
  next(action);
  console.log('New state: ', store.getState());
};

const applyMiddleWares = store => next => action => {
  let dispatch = store.dispatch;

    Array.from(arguments).forEach(middleWare => {
      dispatch = middleWare(store)(dispatch);
    });
};
