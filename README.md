
# react-native-qrcodeview

## Getting started

`$ npm install react-native-qrcodeview --save`

### Mostly automatic installation

`$ react-native link react-native-qrcodeview`

### Manual installation


#### iOS

1. In XCode, in the project navigator, right click `Libraries` ➜ `Add Files to [your project's name]`
2. Go to `node_modules` ➜ `react-native-qrcodeview` and add `RNQrcodeview.xcodeproj`
3. In XCode, in the project navigator, select your project. Add `libRNQrcodeview.a` to your project's `Build Phases` ➜ `Link Binary With Libraries`
4. Run your project (`Cmd+R`)<

#### Android

1. Open up `android/app/src/main/java/[...]/MainActivity.java`
  - Add `import com.solke.qrcodeview.RNQrcodeviewPackage;` to the imports at the top of the file
  - Add `new RNQrcodeviewPackage()` to the list returned by the `getPackages()` method
2. Append the following lines to `android/settings.gradle`:
  	```
  	include ':react-native-qrcodeview'
  	project(':react-native-qrcodeview').projectDir = new File(rootProject.projectDir, 	'../node_modules/react-native-qrcodeview/android')
  	```
3. Insert the following lines inside the dependencies block in `android/app/build.gradle`:
  	```
      compile project(':react-native-qrcodeview')
  	```


## Usage
```javascript
import QRCodeView from 'react-native-qrcodeview';

// TODO: What to do with the module?
render() {
    const options = {
        value:'www.xxx.com',
        size:400,
        backgroundColor:'#6495ED',
        foregroundColor:'#32CD32'
    }
    return (
        <View style={styles.container}>
            <View style={{backgroundColor:'white',marginTop:20}}>
                <QRCodeView 
                    qrOptions={options} 
                    style={{width:400,height:400}}/>
            </View>
        </View>
    );
  }
```
  