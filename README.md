DCLazyInstantiate
======
Generates lazy instantiation for you!

<p align="center" >
  <img src="https://raw.githubusercontent.com/Tengag/DCLazyInstantiate/master/screenshot.gif" alt="DCLazyInstantiate" title="DCLazyInstantiate">
</p>

## Install & Update

### Via Alcatraz

1. Search `DCLazyInstantiate` on Alcatraz Package Manager

### Via source

1. Clone this repo

2. Then build the `DCLazyInstantiate` target in the Xcode project and the plug-in will automatically be installed in `~/Library/Application Support/Developer/Shared/Xcode/Plug-ins`

3. Restart Xcode.

### Via command-line

```shell
curl -fsSL https://raw.githubusercontent.com/Tengag/DCLazyInstantiate/master/script/install.sh | sh
```

## Usage

Move your cursor to the property you want to generate lazy instantiation.
### In Xcode

```
Xcode -> Edit -> DCLazyInstantiate 
```

### DCLazyInstantiate Shortcut (default)

```
Shift + Cmd + -
```

You can change the shortcut in Settings, `Xcode -> Edit -> DCLazyInstantiate -> Settings`.

## Todo

1. Customizing code style.
2. Insert instantiation in specific prama mark section.

## Done

1. Mutiselect property support.(Thanks to:[@D1g1K1d](https://github.com/D1g1K1d))
