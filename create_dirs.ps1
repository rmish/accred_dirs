Function createSPO ($data)
{
    # общий префикс для всех каталогов
    $dirprefix = "./СПО/"+$data.faculty+"/"+$data.speciality
    [void](New-Item -force -itemtype directory $dirprefix)
    
    # пользователь для установки прав доступа
    $identity = "sysadmin_lab"
    # общий объект для раздачи прав на модификацию подкаталогов
    $newAcl = Get-Acl $dirprefix
    $fsAList = $identity, "FullControl", "ContainerInherit,ObjectInherit", "InheritOnly", "Allow"
    $fsa = New-Object -TypeName System.Security.AccessControl.FileSystemAccessRule -ArgumentList $fsAList
    $newAcl.SetAccessRule($fsa)
    # Шаблон команды для расстановки прав
    # Set-Acl -Path "$tdir" -AclObject $newAcl

    $years = 2015..2020
    foreach ($year in $years)
    {
        # п.1. ООП
        $tdir = $dirprefix+"/п1 ООП/"+$data.profile+"/"+$year+"/РПД "+$data.profile+" "+$year
        [void](New-Item -force -itemtype directory $tdir)
        Set-Acl -Path "$tdir" -AclObject $newAcl
        $tdir = $dirprefix+"/п1 ООП/"+$data.profile+"/"+$year+"/РП модулей "+$data.profile+" "+$year
        [void](New-Item -force -itemtype directory $tdir)
        Set-Acl -Path "$tdir" -AclObject $newAcl
        $tdir = $dirprefix+"/п1 ООП/"+$data.profile+"/"+$year+"/методические материалы"+$data.profile+" "+$year
        [void](New-Item -force -itemtype directory $tdir)
        Set-Acl -Path "$tdir" -AclObject $newAcl
        $tdir = $dirprefix+"/п1 ООП/"+$data.profile+"/"+$year+"/иные материалы"+$data.profile+" "+$year
        [void](New-Item -force -itemtype directory $tdir)
        Set-Acl -Path "$tdir" -AclObject $newAcl
        $tdir = $dirprefix+"/п1 ООП/"+$data.profile+"/"+$year
        Set-Acl -Path "$tdir" -AclObject $newAcl
        # п.2. расписания
        $tdir = $dirprefix+"/п2 Расписания/"+$data.profile+"/"+$year
        [void](New-Item -force -itemtype directory $tdir)
        Set-Acl -Path "$tdir" -AclObject $newAcl
        # п.3. Расписания промежуточных аттестаций ГИА(ИА)
        $tdir = $dirprefix+"/п3 Расписания промежуточных аттестаций, ГИА(ИА)/"+$data.profile+"/"+$year
        [void](New-Item -force -itemtype directory $tdir)
        Set-Acl -Path "$tdir" -AclObject $newAcl
        # п.5. Программы практик
        $tdir = $dirprefix+"/п5 Программы практик/"+$data.profile+"/"+$year
        [void](New-Item -force -itemtype directory $tdir)
        Set-Acl -Path "$tdir" -AclObject $newAcl
        # п7 Документы содержащие информацию об индивидуальном учёте результатов освоения обучающимися ОП предусмотренные ЛНА ВГУ 
        $tdir = $dirprefix+"/п7 Документы содержащие информацию об индивидуальном учёте результатов освоения обучающимися ОП предусмотренные ЛНА ВГУ/"+$data.profile+"/"+$year+"/Зачётные книжки"
        [void](New-Item -force -itemtype directory $tdir)
        Set-Acl -Path "$tdir" -AclObject $newAcl
        $tdir = $dirprefix+"/п7 Документы содержащие информацию об индивидуальном учёте результатов освоения обучающимися ОП предусмотренные ЛНА ВГУ/"+$data.profile+"/"+$year+"/Личные карточки"
        [void](New-Item -force -itemtype directory $tdir)
        Set-Acl -Path "$tdir" -AclObject $newAcl
        $tdir = $dirprefix+"/п7 Документы содержащие информацию об индивидуальном учёте результатов освоения обучающимися ОП предусмотренные ЛНА ВГУ/"+$data.profile+"/"+$year
        Set-Acl -Path "$tdir" -AclObject $newAcl
        # п8 Отчётность обучающихся по практикам оценочные материалы и результаты аттестации по практикам 
        $tdir = $dirprefix+"/п8 Отчётность обучающихся по практикам оценочные материалы и результаты аттестации по практикам/"+$data.profile+"/"+$year+"/Дневники практик"
        [void](New-Item -force -itemtype directory $tdir)
        Set-Acl -Path "$tdir" -AclObject $newAcl
        $tdir = $dirprefix+"/п8 Отчётность обучающихся по практикам оценочные материалы и результаты аттестации по практикам/"+$data.profile+"/"+$year+"/Отчёты"
        [void](New-Item -force -itemtype directory $tdir)
        Set-Acl -Path "$tdir" -AclObject $newAcl
        $tdir = $dirprefix+"/п8 Отчётность обучающихся по практикам оценочные материалы и результаты аттестации по практикам/"+$data.profile+"/"+$year+"/Аттестационные листы"
        [void](New-Item -force -itemtype directory $tdir)
        Set-Acl -Path "$tdir" -AclObject $newAcl
        $tdir = $dirprefix+"/п8 Отчётность обучающихся по практикам оценочные материалы и результаты аттестации по практикам/"+$data.profile+"/"+$year+"/Характеристики обучающегося по практике"
        #[void](New-Item -force -itemtype directory $tdir)
        #write-output $tdir
        New-Item -force -itemtype directory $tdir
        Set-Acl -Path "$tdir" -AclObject $newAcl
    }
    # п.4. Программа ГИА требования ВКР критерии оценк 
    $tdir = $dirprefix+"/п4 Программа ГИА требования ВКР критерии оценк/"
    [void](New-Item -force -itemtype directory $tdir)
    Set-Acl -Path "$tdir" -AclObject $newAcl
    # п6 Документы подтверждающие разработку ОП ВГУ совместно с заинтересованным работодателем 
    $tdir = $dirprefix+"/п6 Документы подтверждающие разработку ОП ВГУ совместно с заинтересованным работодателем"
    [void](New-Item -force -itemtype directory $tdir)
    Set-Acl -Path "$tdir" -AclObject $newAcl
    # п9 Индивидуальные УП обучающихся
    $tdir = $dirprefix+"/п9 Индивидуальные УП обучающихся/"+$data.profile
    [void](New-Item -force -itemtype directory $tdir)
    Set-Acl -Path "$tdir" -AclObject $newAcl
    # п10 ВКР 
    $tdir = $dirprefix+"/п10 ВКР/"+$data.profile
    [void](New-Item -force -itemtype directory $tdir)
    Set-Acl -Path "$tdir" -AclObject $newAcl
    # п11 Протоколы заседания ГЭК 
    $tdir = $dirprefix+"/п11 Протоколы заседания ГЭК/"+$data.profile
    [void](New-Item -force -itemtype directory $tdir)
    Set-Acl -Path "$tdir" -AclObject $newAcl
    #  п12 Заключение председателя ГЭК о соблюдении процедурных вопросов при проведении ГЭ и защите ВКР
    $tdir = $dirprefix+"/п12 Заключение председателя ГЭК о соблюдении процедурных вопросов при проведении ГЭ и защите ВКР/"+$data.profile
    [void](New-Item -force -itemtype directory $tdir)
    Set-Acl -Path "$tdir" -AclObject $newAcl
    # п13 Документы предусмотренные ЛНА ВГУ устанавливающие порядок и форму проведения ИА по не имеющим ГА ОП 
    $tdir = $dirprefix+"/п13 Документы предусмотренные ЛНА ВГУ устанавливающие порядок и форму проведения ИА по не имеющим ГА ОП/"+$data.profile
    [void](New-Item -force -itemtype directory $tdir)
    Set-Acl -Path "$tdir" -AclObject $newAcl
    #  п14 Договоры об организации и проведении производственной практики между ВГУ и организациями осуществляющими деятельность по профилю ОП
    $tdir = $dirprefix+"/п14 Договоры об организации и проведении производственной практики между ВГУ и организациями осуществляющими деятельность по профилю ОП"
    [void](New-Item -force -itemtype directory $tdir)
    Set-Acl -Path "$tdir" -AclObject $newAcl
    #  п15 Договоры о сетевой форме реализации ОП
    $tdir = $dirprefix+"/п15 Договоры о сетевой форме реализации ОП"
    [void](New-Item -force -itemtype directory $tdir)
    Set-Acl -Path "$tdir" -AclObject $newAcl
    #  п16 Штатное расписание и личные дела НПР
    $tdir = $dirprefix+"/п16 Штатное расписание и личные дела НПР"
    [void](New-Item -force -itemtype directory $tdir)
    Set-Acl -Path "$tdir" -AclObject $newAcl
    $tdir = $dirprefix+"/п16 Штатное расписание и личные дела НПР/Личные дела"
    [void](New-Item -force -itemtype directory $tdir)
    Set-Acl -Path "$tdir" -AclObject $newAcl
    #  п17 Документы подтверждающие наличие или право использования в ВГУ ЭБС и ЭИОС соответствующих требованиям ФГОС
    $tdir = $dirprefix+"/п17 Документы подтверждающие наличие или право использования в ВГУ ЭБС и ЭИОС соответствующих требованиям ФГОС"
    [void](New-Item -force -itemtype directory $tdir)
    Set-Acl -Path "$tdir" -AclObject $newAcl
    #  п18 Документы подтверждающие соответствие требованиям ФГОС укомплектование библиотечного фонда ВГУ печатными и (или) электронными изданиями 
    $tdir = $dirprefix+"/п18 Документы подтверждающие соответствие требованиям ФГОС укомплектование библиотечного фонда ВГУ печатными и (или) электронными изданиями"
    [void](New-Item -force -itemtype directory $tdir)
    Set-Acl -Path "$tdir" -AclObject $newAcl
    #  п19 Документы подтверждающие наличие в ВГУ маттех базы соответствующей требованиям ФГОС
    $tdir = $dirprefix+"/п19 Документы подтверждающие наличие в ВГУ маттех базы соответствующей требованиям ФГОС"
    [void](New-Item -force -itemtype directory $tdir)
    Set-Acl -Path "$tdir" -AclObject $newAcl
    #  п20 Договора базовые
    $tdir = $dirprefix+"/п20 Договора базовые"
    [void](New-Item -force -itemtype directory $tdir)
    Set-Acl -Path "$tdir" -AclObject $newAcl
    #  п21 Документы подтверждающие общественную аккредитацию ВГУ и ПОА ОП реализуемые в ВГУ
    $tdir = $dirprefix+"/п21 Документы подтверждающие общественную аккредитацию ВГУ и ПОА ОП реализуемые в ВГУ"
    [void](New-Item -force -itemtype directory $tdir)
    Set-Acl -Path "$tdir" -AclObject $newAcl
    #  п23 Результаты НОК подготовки обучающихся
    $tdir = $dirprefix+"/п23 Результаты НОК подготовки обучающихся"
    [void](New-Item -force -itemtype directory $tdir)
    Set-Acl -Path "$tdir" -AclObject $newAcl
    #  п24 ЛНА
    $tdir = $dirprefix+"/п24 ЛНА"
    [void](New-Item -force -itemtype directory $tdir)
    Set-Acl -Path "$tdir" -AclObject $newAcl
    #  п25 Распорядительные акты
    $tdir = $dirprefix+"/п25 Распорядительные акты/О приёме"
    [void](New-Item -force -itemtype directory $tdir)
    Set-Acl -Path "$tdir" -AclObject $newAcl
    $tdir = $dirprefix+"/п25 Распорядительные акты/Об обучении по ИУП в том числе ускоренное"
    [void](New-Item -force -itemtype directory $tdir)
    Set-Acl -Path "$tdir" -AclObject $newAcl
    $tdir = $dirprefix+"/п25 Распорядительные акты/О переводе обучающихся для получения образования по другому профилю специальности или форме обучения"
    [void](New-Item -force -itemtype directory $tdir)
    Set-Acl -Path "$tdir" -AclObject $newAcl
    $tdir = $dirprefix+"/п25 Распорядительные акты/О зачислении в в качестве экстернов в ВГУ для прохождения промежуточных и ГИА по имеющей ГА ОП лиц обучавшихся по соответствующей ОО не имеющей ГА"
    [void](New-Item -force -itemtype directory $tdir)
    Set-Acl -Path "$tdir" -AclObject $newAcl
    $tdir = $dirprefix+"/п25 Распорядительные акты/О направлении на практику обучающихся"
    [void](New-Item -force -itemtype directory $tdir)
    Set-Acl -Path "$tdir" -AclObject $newAcl
    $tdir = $dirprefix+"/п25 Распорядительные акты/О допуске обучающихся к ГИА"
    [void](New-Item -force -itemtype directory $tdir)
    Set-Acl -Path "$tdir" -AclObject $newAcl
    $tdir = $dirprefix+"/п25 Распорядительные акты/Об утверждении состава ГЭК"
    [void](New-Item -force -itemtype directory $tdir)
    Set-Acl -Path "$tdir" -AclObject $newAcl
    $tdir = $dirprefix+"/п25 Распорядительные акты/О закреплении за студентами тем ВКР и назначению руководителей и консультантов"
    [void](New-Item -force -itemtype directory $tdir)
    Set-Acl -Path "$tdir" -AclObject $newAcl
    $tdir = $dirprefix+"/п25 Распорядительные акты/Об отчислении обучающихся по ОП из ВГУ"
    [void](New-Item -force -itemtype directory $tdir)
    Set-Acl -Path "$tdir" -AclObject $newAcl
}

Function createAspirant ($data)
{
    # общий префикс для всех каталогов
    $dirprefix = "./Аспирантура/"+$data.faculty+"/"+$data.speciality
    [void](New-Item -force -itemtype directory $dirprefix)
    
    # пользователь для установки прав доступа
    $identity = "sysadmin_lab"
    # общий объект для раздачи прав на модификацию подкаталогов
    $newAcl = Get-Acl $dirprefix
    $fsAList = $identity, "FullControl", "ContainerInherit,ObjectInherit", "InheritOnly", "Allow"
    $fsa = New-Object -TypeName System.Security.AccessControl.FileSystemAccessRule -ArgumentList $fsAList
    $newAcl.SetAccessRule($fsa)
    # Шаблон команды для расстановки прав
    # Set-Acl -Path "$tdir" -AclObject $newAcl

    $years = 2015..2020
    foreach ($year in $years)
    {

    }
}

Function createOrdinator ($data)
{
    # общий префикс для всех каталогов
    $dirprefix = "./Ординатура/"+$data.faculty+"/"+$data.speciality
    [void](New-Item -force -itemtype directory $dirprefix)
    
    # пользователь для установки прав доступа
    $identity = "sysadmin_lab"
    # общий объект для раздачи прав на модификацию подкаталогов
    $newAcl = Get-Acl $dirprefix
    $fsAList = $identity, "FullControl", "ContainerInherit,ObjectInherit", "InheritOnly", "Allow"
    $fsa = New-Object -TypeName System.Security.AccessControl.FileSystemAccessRule -ArgumentList $fsAList
    $newAcl.SetAccessRule($fsa)
    # Шаблон команды для расстановки прав
    # Set-Acl -Path "$tdir" -AclObject $newAcl

    $years = 2015..2020
    foreach ($year in $years)
    {

    }
}

Function createHighEdu ($data)
{
    # общий префикс для всех каталогов
    $dirprefix = "./"+$data.level+"/"+$data.faculty+"/"+$data.speciality
    [void](New-Item -force -itemtype directory $dirprefix)
    
    # пользователь для установки прав доступа
    $identity = "sysadmin_lab"
    # общий объект для раздачи прав на модификацию подкаталогов
    $newAcl = Get-Acl $dirprefix
    $fsAList = $identity, "FullControl", "ContainerInherit,ObjectInherit", "InheritOnly", "Allow"
    $fsa = New-Object -TypeName System.Security.AccessControl.FileSystemAccessRule -ArgumentList $fsAList
    $newAcl.SetAccessRule($fsa)
    # Шаблон команды для расстановки прав
    # Set-Acl -Path "$tdir" -AclObject $newAcl

    $years = 2015..2020
    foreach ($year in $years)
    {
        # п.1. ООП
        $tdir = $dirprefix+"/п1 ООП/"+$data.profile+"/"+$data.form+"/"+$year+"/РПД "+$data.profile+" "+$year
        [void](New-Item -force -itemtype directory $tdir)
        Set-Acl -Path "$tdir" -AclObject $newAcl
        $tdir = $dirprefix+"/п1 ООП/"+$data.profile+"/"+$data.form+"/"+$year+"/РП модулей "+$data.profile+" "+$year
        [void](New-Item -force -itemtype directory $tdir)
        Set-Acl -Path "$tdir" -AclObject $newAcl
        $tdir = $dirprefix+"/п1 ООП/"+$data.profile+"/"+$data.form+"/"+$year+"/методические материалы"+$data.profile+" "+$year
        [void](New-Item -force -itemtype directory $tdir)
        Set-Acl -Path "$tdir" -AclObject $newAcl
        $tdir = $dirprefix+"/п1 ООП/"+$data.profile+"/"+$data.form+"/"+$year+"/иные материалы"+$data.profile+" "+$year
        [void](New-Item -force -itemtype directory $tdir)
        Set-Acl -Path "$tdir" -AclObject $newAcl
        $tdir = $dirprefix+"/п1 ООП/"+$data.profile+"/"+$year
        Set-Acl -Path "$tdir" -AclObject $newAcl
        # п.2. расписания
        $tdir = $dirprefix+"/п2 Расписания/"+$data.profile+"/"+$data.form+"/"+$year
        [void](New-Item -force -itemtype directory $tdir)
        Set-Acl -Path "$tdir" -AclObject $newAcl
        # п.3. Расписания промежуточных аттестаций ГИА(ИА)
        $tdir = $dirprefix+"/п3 Расписания промежуточных аттестаций, ГИА(ИА)/"+$data.profile+"/"+$data.form+"/"+$year
        [void](New-Item -force -itemtype directory $tdir)
        Set-Acl -Path "$tdir" -AclObject $newAcl
        # п5 Документы содержащие информацию об индивидуальном учёте результатов освоения обучающимися ОП предусмотренные ЛНА ВГУ 
        $tdir = $dirprefix+"/п5 Документы содержащие информацию об индивидуальном учёте результатов освоения обучающимися ОП предусмотренные ЛНА ВГУ/"+$data.profile+"/"+$data.form+"/"+$year+"/Зачётные книжки"
        [void](New-Item -force -itemtype directory $tdir)
        Set-Acl -Path "$tdir" -AclObject $newAcl
        $tdir = $dirprefix+"/п5 Документы содержащие информацию об индивидуальном учёте результатов освоения обучающимися ОП предусмотренные ЛНА ВГУ/"+$data.profile+"/"+$data.form+"/"+$year+"/Личные карточки"
        [void](New-Item -force -itemtype directory $tdir)
        Set-Acl -Path "$tdir" -AclObject $newAcl
        $tdir = $dirprefix+"/п5 Документы содержащие информацию об индивидуальном учёте результатов освоения обучающимися ОП предусмотренные ЛНА ВГУ/"+$data.profile+"/"+$data.form+"/"+$year
        Set-Acl -Path "$tdir" -AclObject $newAcl
        # п7 Отчётность обучающихся по практикам оценочные материалы и результаты аттестации по практикам 
        $tdir = $dirprefix+"/п7 Отчётность обучающихся по практикам оценочные материалы и результаты аттестации по практикам/"+$data.profile+"/"+$data.form+"/"+$year+"/Дневники практик"
        [void](New-Item -force -itemtype directory $tdir)
        Set-Acl -Path "$tdir" -AclObject $newAcl
        $tdir = $dirprefix+"/п7 Отчётность обучающихся по практикам оценочные материалы и результаты аттестации по практикам/"+$data.profile+"/"+$data.form+"/"+$year+"/Отчёты"
        [void](New-Item -force -itemtype directory $tdir)
        Set-Acl -Path "$tdir" -AclObject $newAcl
        $tdir = $dirprefix+"/п7 Отчётность обучающихся по практикам оценочные материалы и результаты аттестации по практикам/"+$data.profile+"/"+$data.form+"/"+$year+"/Аттестационные листы"
        [void](New-Item -force -itemtype directory $tdir)
        Set-Acl -Path "$tdir" -AclObject $newAcl
    }
    # п4 Индивидуальные УП обучающихся
    $tdir = $dirprefix+"/п4 Индивидуальные УП обучающихся/"+$data.profile
    [void](New-Item -force -itemtype directory $tdir)
    Set-Acl -Path "$tdir" -AclObject $newAcl
    # п6 Документы и материалы о результатах НИР обучающихся
    $tdir = $dirprefix+"/п6 Документы и материалы о результатах НИР обучающихся/"
    [void](New-Item -force -itemtype directory $tdir)
    Set-Acl -Path "$tdir" -AclObject $newAcl
    # п8 ВКР 
    $tdir = $dirprefix+"/п8 ВКР/"+$data.profile
    [void](New-Item -force -itemtype directory $tdir)
    Set-Acl -Path "$tdir" -AclObject $newAcl
    # п9 Протоколы заседания ГЭК 
    $tdir = $dirprefix+"/п9 Протоколы заседания ГЭК/"+$data.profile
    [void](New-Item -force -itemtype directory $tdir)
    Set-Acl -Path "$tdir" -AclObject $newAcl
    # п10 Отзывы руководителей ВКР 
    $tdir = $dirprefix+"/п10 Отзывы руководителей ВКР/"+$data.profile
    [void](New-Item -force -itemtype directory $tdir)
    Set-Acl -Path "$tdir" -AclObject $newAcl
    # п11 Рецензии на ВКР 
    $tdir = $dirprefix+"/п11 Рецензии на ВКР/"+$data.profile
    [void](New-Item -force -itemtype directory $tdir)
    Set-Acl -Path "$tdir" -AclObject $newAcl
    # п12 Документы предусмотренные ЛНА ВГУ устанавливающие порядок и форму проведения ИА по не имеющим ГА ОП 
    $tdir = $dirprefix+"/п12 Документы предусмотренные ЛНА ВГУ устанавливающие порядок и форму проведения ИА по не имеющим ГА ОП/"+$data.profile
    [void](New-Item -force -itemtype directory $tdir)
    Set-Acl -Path "$tdir" -AclObject $newAcl
    #  п13 Договоры об организации и проведении практик между ВГУ и организациями осуществляющими деятельность по профилю ОП
    $tdir = $dirprefix+"/п13 Договоры об организации и проведении практик между ВГУ и организациями осуществляющими деятельность по профилю ОП"
    [void](New-Item -force -itemtype directory $tdir)
    Set-Acl -Path "$tdir" -AclObject $newAcl
    #  п14 Договоры о сетевой форме реализации ОП
    $tdir = $dirprefix+"/п14 Договоры о сетевой форме реализации ОП"
    [void](New-Item -force -itemtype directory $tdir)
    Set-Acl -Path "$tdir" -AclObject $newAcl
    #  п15 Штатное расписание и личные дела НПР
    $tdir = $dirprefix+"/п15 Штатное расписание и личные дела НПР"
    [void](New-Item -force -itemtype directory $tdir)
    Set-Acl -Path "$tdir" -AclObject $newAcl
    $tdir = $dirprefix+"/п16 Штатное расписание и личные дела НПР/Личные дела"
    [void](New-Item -force -itemtype directory $tdir)
    Set-Acl -Path "$tdir" -AclObject $newAcl
    #  п16 Индивидуальные планы работы НПР
    $tdir = $dirprefix+"/п16 Индивидуальные планы работы НПР"
    [void](New-Item -force -itemtype directory $tdir)
    Set-Acl -Path "$tdir" -AclObject $newAcl
    #  п17 Документы подтверждающие наличие или право использования в ВГУ ЭБС и ЭИОС соответствующих требованиям ФГОС
    $tdir = $dirprefix+"/п17 Документы подтверждающие наличие или право использования в ВГУ ЭБС и ЭИОС соответствующих требованиям ФГОС"
    [void](New-Item -force -itemtype directory $tdir)
    Set-Acl -Path "$tdir" -AclObject $newAcl
    #  п18 Документы подтверждающие наличие в ВГУ маттех базы соответствующей требованиям ФГОС
    $tdir = $dirprefix+"/п18 Документы подтверждающие наличие в ВГУ маттех базы соответствующей требованиям ФГОС"
    [void](New-Item -force -itemtype directory $tdir)
    Set-Acl -Path "$tdir" -AclObject $newAcl
    #  п19 Договоры о создании в ВГУ лабораторий осуществляющих научную научно-исследовательскую или научно-техническую деятельность
    $tdir = $dirprefix+"/п19 Договоры о создании в ВГУ лабораторий осуществляющих научную научно-исследовательскую или научно-техническую деятельность"
    [void](New-Item -force -itemtype directory $tdir)
    Set-Acl -Path "$tdir" -AclObject $newAcl
    #  п20 Договоры о создании ВГУ в научных и иных организациях осуществляющих научно исследовательскую деятельность кафедр осуществляющих образовательную деятельность
    $tdir = $dirprefix+"/п20 Договоры о создании ВГУ в научных и иных организациях осуществляющих научно исследовательскую деятельность кафедр осуществляющих образовательную деятельность"
    [void](New-Item -force -itemtype directory $tdir)
    Set-Acl -Path "$tdir" -AclObject $newAcl
    #  п21 Договор о создании в ВГУ кафедр и иных структурных подразделений обеспечивающих практическую подготовку обучающихся на базе иных организаций осуществляющих деятельность по профилю ОП
    $tdir = $dirprefix+"/п21 Договор о создании в ВГУ кафедр и иных структурных подразделений обеспечивающих практическую подготовку обучающихся на базе иных организаций осуществляющих деятельность по профилю ОП"
    [void](New-Item -force -itemtype directory $tdir)
    Set-Acl -Path "$tdir" -AclObject $newAcl
    # п22 Документы подтверждающие реализацию ОП требующих особого порядка реализации в связи с использованием сведений составляющих гостайну 
    $tdir = $dirprefix+"/п22 Документы подтверждающие реализацию ОП требующих особого порядка реализации в связи с использованием сведений составляющих гостайну"
    [void](New-Item -force -itemtype directory $tdir)
    Set-Acl -Path "$tdir" -AclObject $newAcl
    #  п23 Документы подтверждающие общественную аккредитацию ВГУ и ПОА ОП реализуемые в ВГУ
    $tdir = $dirprefix+"/п23 Документы подтверждающие общественную аккредитацию ВГУ и ПОА ОП реализуемые в ВГУ"
    [void](New-Item -force -itemtype directory $tdir)
    Set-Acl -Path "$tdir" -AclObject $newAcl
    #  п24 Результаты НОК подготовки обучающихся
    $tdir = $dirprefix+"/п24 Результаты НОК подготовки обучающихся"
    [void](New-Item -force -itemtype directory $tdir)
    Set-Acl -Path "$tdir" -AclObject $newAcl
    #  п25 ЛНА
    $tdir = $dirprefix+"/п25 ЛНА"
    [void](New-Item -force -itemtype directory $tdir)
    Set-Acl -Path "$tdir" -AclObject $newAcl
    #  п26 Распорядительные акты
    $tdir = $dirprefix+"/п26 Распорядительные акты/О приёме"
    [void](New-Item -force -itemtype directory $tdir)
    Set-Acl -Path "$tdir" -AclObject $newAcl
    $tdir = $dirprefix+"/п26 Распорядительные акты/Об обучении по ИУП в том числе ускоренное"
    [void](New-Item -force -itemtype directory $tdir)
    Set-Acl -Path "$tdir" -AclObject $newAcl
    $tdir = $dirprefix+"/п26 Распорядительные акты/О переводе обучающихся для получения образования по другому профилю специальности или форме обучения"
    [void](New-Item -force -itemtype directory $tdir)
    Set-Acl -Path "$tdir" -AclObject $newAcl
    $tdir = $dirprefix+"/п26 Распорядительные акты/О зачислении в в качестве экстернов в ВГУ для прохождения промежуточных и ГИА по имеющей ГА ОП лиц обучавшихся по соответствующей ОО не имеющей ГА"
    [void](New-Item -force -itemtype directory $tdir)
    Set-Acl -Path "$tdir" -AclObject $newAcl
    $tdir = $dirprefix+"/п26 Распорядительные акты/О направлении на практику обучающихся"
    [void](New-Item -force -itemtype directory $tdir)
    Set-Acl -Path "$tdir" -AclObject $newAcl
    $tdir = $dirprefix+"/п26 Распорядительные акты/О допуске обучающихся к ГИА"
    [void](New-Item -force -itemtype directory $tdir)
    Set-Acl -Path "$tdir" -AclObject $newAcl
    $tdir = $dirprefix+"/п26 Распорядительные акты/Об утверждении состава ГЭК"
    [void](New-Item -force -itemtype directory $tdir)
    Set-Acl -Path "$tdir" -AclObject $newAcl
    $tdir = $dirprefix+"/п26 Распорядительные акты/О закреплении за студентами тем ВКР и назначению руководителей и консультантов"
    [void](New-Item -force -itemtype directory $tdir)
    Set-Acl -Path "$tdir" -AclObject $newAcl
    $tdir = $dirprefix+"/п26 Распорядительные акты/Об отчислении обучающихся по ОП из ВГУ"
    [void](New-Item -force -itemtype directory $tdir)
    Set-Acl -Path "$tdir" -AclObject $newAcl
}

Function logRecord($data)
{
    write-output($data)
}


$CoursesData = Import-Csv -Path "./regdata/test_reestr.csv" -Delimiter ";" -Encoding utf8

foreach ($record in $CoursesData)
{
    switch ($record.level)
    {
        'СПО' {
            createSPO($record) 
            break
        }
        'Специалитет' {
            createHighEdu($record)
            break
        }
        'Аспирантура' {
            createAspirant($record)
            break
        }
        'Ординатура' {
            createOrdinator($record)
            break
        }
        'Бакалавриат' {
            createHighEdu($record)
            break
        }
        'Магистратура' {
            createHighEdu($record)
            break
        }
        default { logRecord($record) }
    }
}

