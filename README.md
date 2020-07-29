# backend
in order to add to ur app:
- create new app on firebase console and get build ID
- need these in ur Podfile
   - pod 'Firebase/Core'
   - pod 'Firebase/Database'
   - pod 'Firebase/Analytics'
   - pod 'Firebase/Firestore'
   - pod 'FirebaseFirestoreSwift'
- "GoogleService-Info.plist" in same folder as AppDelegate.swift
-  add "import Firebase" and "FirebaseApp.configure()" in AppDelegate.swift
