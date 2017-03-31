import React, { Component } from 'react';
import {
  View,
  StyleSheet,
  TouchableOpacity,
  Text,
} from 'react-native';

import ScanditSDK from 'react-native-scandit';

class Index extends Component {

  constructor(props) {
    super(props);

    this.state = {

    }
  }

  _startScanning() {
    const options = {
      nib: 'ScanViewController',
      symbologies: ['qr'],
    };
    ScanditSDK.scan(options, (result) => {
      console.log(`result = ${result}`);
      this.setState({
        code: result,
      });
    });
  }

  render() {
    return (
      <View
        style = { styles.container }>
        {this.state.code && <Text
          style = { styles.text }>
          { this.state.code }
        </Text>}

        <TouchableOpacity
          style = { styles.touchable }
          onPress = { () => this._startScanning() }>
          <Text
            style = { styles.text }>
            START SCANNING
          </Text>
        </TouchableOpacity>
      </View>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#fff',
  },
  touchable: {
    height: 44,
    marginTop: 20,
  },
  text: {
    color: '#000',
    fontSize: 17,
    backgroundColor: 'transparent',
  },
});

export default Index;
