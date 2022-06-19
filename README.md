## Usage

- Register Zone
```lua
    exports["p-zone"]:registerZone(coords vector3, radius, name)
```

- Remove Zone
```lua
   exports["p-zone"]:removeZone(name)
```

- 

```lua
    AddEventHandler("p-zone:enter", function(zone)
        print(zone)
    end)

    AddEventHandler("p-zone:exit", function(zone)
        print(zone)
    end)
```
