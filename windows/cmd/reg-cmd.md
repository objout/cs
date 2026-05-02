# Reg Cmd

## Export Reg

```
reg export <reg path> <export file path>

reg export "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Null" null.reg
```

## Import reg

```
reg import <file path>

reg import null.reg
```
