import React from 'react';
import ReactDOM from 'react-dom';
import './css/Chatpack.scss';
import './css/tailwind.css';
import Chatpack from './Chatpack';
import * as serviceWorker from './serviceWorker';

ReactDOM.render(<Chatpack />, document.getElementById('cp-root'));

// If you want your app to work offline and load faster, you can change
// unregister() to register() below. Note this comes with some pitfalls.
// Learn more about service workers: https://bit.ly/CRA-PWA
serviceWorker.unregister();
