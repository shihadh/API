url in the app 

add depentancy url_launcher

add this on androidMainifest.xml (inside <manifest (outside the <application))

<uses-permission android:name="android.permission.INTERNET"/>
      <queries>
        <!-- For launching URLs -->
        <intent>
            <action android:name="android.intent.action.VIEW" />
            <category android:name="android.intent.category.BROWSABLE"/>
            <data android:scheme="http"/>
        </intent>
        <intent>
            <action android:name="android.intent.action.VIEW" />
            <category android:name="android.intent.category.BROWSABLE"/>
            <data android:scheme="https"/>
        </intent>
        <!-- Already present for text -->
        <intent>
            <action android:name="android.intent.action.PROCESS_TEXT"/>
            <data android:mimeType="text/plain"/>
        </intent>
    </queries>
