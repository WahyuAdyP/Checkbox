# Checkbox
Checkbox subclass UIButton

<img src="https://github.com/WahyuAdyP/Checkbox/blob/master/IMG_1419.PNG" height="35%" width="35%">


Check/ uncheck state with your own icon.
Drag & drop CheckBox.swift in your project, change UIButton class to CheckBox
Set icon as check/ uncheck state


Handle switch state
```
checkbox.setOnTap { (checkBox, isChecked) in
  print("Checkbox in checked state is \(isChecked)")
}
```

Change state programmatically
```
checkbox.setState(in: true)
```
