#[void](New-Item -itemtype directory "DIR1")
[void](New-Item -itemtype directory "DIR1/DIR2")
$identity = "sysadmin_lab"
# Создание записи в ACL для модификации содержимого каталога
 $newAcl2 = Get-Acl DIR1
 $fsAList = $identity, "Modify", "None", "NoPropagateInherit", "Allow"
 $fsa2 = New-Object -TypeName System.Security.AccessControl.FileSystemAccessRule -ArgumentList $fsAList
 $newAcl2.SetAccessRule($fsa2)
 Set-Acl -Path "DIR1" -AclObject $newAcl2
# Создание записи в acl для доступ ко всему созданому в каталоге содержимому
# (наследуемые права для всех объектов в папке)
# $newAcl = Get-Acl DIR1
# $fsAList = $identity, "FullControl", "ContainerInherit,ObjectInherit", "InheritOnly", "Allow"
# $fsa = New-Object -TypeName System.Security.AccessControl.FileSystemAccessRule -ArgumentList $fsAList
# $newAcl.SetAccessRule($fsa)
# Set-Acl -Path "DIR1" -AclObject $newAcl

[void](New-Item -force -itemtype directory "DIR1/DIR2")