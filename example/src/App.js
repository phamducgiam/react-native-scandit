import React, { Component } from 'react';

import ScanditSDK from 'react-native-scandit';

import Index from './Index';

class App extends Component {

  constructor(props) {
    super(props);

    ScanditSDK.init('U/p/uHr2xXjMTC8q7uYCOFnHBLtZWvoaDq8WGAEGpcI');
  }

  render() {
    return (
      <Index />
    );
  }
}

export default App;
