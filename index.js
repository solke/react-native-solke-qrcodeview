'use strict';
const Platform = require('Platform');
const React = require('React');
const PropTypes = require('prop-types');
const StyleSheet = require('StyleSheet');
const ViewPropTypes = require('ViewPropTypes');
const requireNativeComponent = require('requireNativeComponent');

let RCTQRCodeView

class QRCodeView extends React.Component{
    static propTypes = {
        options:PropTypes.object,
    }

    static defaultProps = {
        options:{
            backgroundColor:'#ffffff',
            forcegroundColor:'#000000',
            size:200,
            value:'QRCode'
        }
    }
    render(){
        const props = {...this.props};
        props.onStartShouldSetResponder = () => true;
        props.onResponderTerminationRequest = () => false;
        if (Platform.OS === 'android') {
            props.style = [styles.rctQrcodeStyle, this.props.style];
        } else if (Platform.OS === 'ios') {
            props.style = [styles.rctQrcodeStyle, this.props.style];
        }
        return(
            <RCTQRCodeView
                {...props}
                ref={(ref) => { this._rctQRCode = ref; }}
            />
        )
    }
}

RCTQRCodeView = requireNativeComponent('RNQRcodeView', QRCodeView, {
    nativeOnly: {
        qrOptions: true
    }
});

const styles = StyleSheet.create({
    rctQrcodeStyle: {
        height: 200,
        width: 200,
    }
});



module.exports = QRCodeView;

