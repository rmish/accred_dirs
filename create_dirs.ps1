Function createSPO ($data)
{
    # общий префикс для всех каталогов
    $dirprefix = '\\?\c:\Temp\accred\accred_dirs\'+$data.faculty+'\'+$data.level+'\'+$data.speciality
    [void](New-Item -force -itemtype directory -Path "$dirprefix")
    
    # пользователь для установки прав доступа
    $identity = 'moose'
    # общий объект для раздачи прав на модификацию подкаталогов
    $newAcl = Get-Acl $dirprefix
    $fsAList = $identity, 'FullControl', 'ContainerInherit,ObjectInherit', 'InheritOnly', 'Allow'
    $fsa = New-Object -TypeName System.Security.AccessControl.FileSystemAccessRule -ArgumentList $fsAList
    $newAcl.SetAccessRule($fsa)
    # Шаблон команды для расстановки прав
    # Set-Acl -LiteralPath "$tdir" -AclObject $newAcl

    $years = 2015..2020
    foreach ($year in $years)
    {
        # п.1. ООП
        $tdir = $dirprefix+'\п01 ООП\'+$data.profile+'\'+$year+'\РПД '+$data.profile+' '+$year
        [void](New-Item -force -itemtype directory -Path "$tdir")
        Set-Acl -LiteralPath "$tdir" -AclObject $newAcl
        $tdir = $dirprefix+'\п01 ООП\'+$data.profile+'\'+$year+'\РП модулей '+$data.profile+' '+$year
        [void](New-Item -force -itemtype directory -Path "$tdir")
        Set-Acl -LiteralPath "$tdir" -AclObject $newAcl
        $tdir = $dirprefix+'\п01 ООП\'+$data.profile+'\'+$year+'\методические материалы'+$data.profile+' '+$year
        [void](New-Item -force -itemtype directory -Path "$tdir")
        Set-Acl -LiteralPath "$tdir" -AclObject $newAcl
        $tdir = $dirprefix+'\п01 ООП\'+$data.profile+'\'+$year+'\иные материалы'+$data.profile+' '+$year
        [void](New-Item -force -itemtype directory -Path "$tdir")
        Set-Acl -LiteralPath "$tdir" -AclObject $newAcl
        $tdir = $dirprefix+'\п01 ООП\'+$data.profile+'\'+$year
        Set-Acl -LiteralPath "$tdir" -AclObject $newAcl
        # п.2. расписания
        $tdir = $dirprefix+'\п02 Расписания\'+$data.profile+'\'+$year
        [void](New-Item -force -itemtype directory -Path "$tdir")
        Set-Acl -LiteralPath "$tdir" -AclObject $newAcl
        # п.3. Расписания промежуточных аттестаций ГИА(ИА)
        $tdir = $dirprefix+'\п03 Расписания промежуточных аттестаций, ГИА(ИА)\'+$data.profile+'\'+$year
        [void](New-Item -force -itemtype directory -Path "$tdir")
        Set-Acl -LiteralPath "$tdir" -AclObject $newAcl
        # п.5. Программы практик
        $tdir = $dirprefix+'\п05 Программы практик\'+$data.profile+'\'+$year
        [void](New-Item -force -itemtype directory -Path "$tdir")
        Set-Acl -LiteralPath "$tdir" -AclObject $newAcl
        # п07 Документы содержащие информацию об индивидуальном учёте результатов освоения обучающимися ОП предусмотренные ЛНА ВГУ 
        $tdir = $dirprefix+'\п07 Документы содержащие информацию об индивидуальном учёте результатов освоения обучающимися ОП предусмотренные ЛНА ВГУ\'+$data.profile+'\'+$year+'\Зачётные книжки'
        [void](New-Item -force -itemtype directory -Path "$tdir")
        Set-Acl -LiteralPath "$tdir" -AclObject $newAcl
        $tdir = $dirprefix+'\п07 Документы содержащие информацию об индивидуальном учёте результатов освоения обучающимися ОП предусмотренные ЛНА ВГУ\'+$data.profile+'\'+$year+'\Личные карточки'
        [void](New-Item -force -itemtype directory -Path "$tdir")
        Set-Acl -LiteralPath "$tdir" -AclObject $newAcl
        $tdir = $dirprefix+'\п07 Документы содержащие информацию об индивидуальном учёте результатов освоения обучающимися ОП предусмотренные ЛНА ВГУ\'+$data.profile+'\'+$year
        Set-Acl -LiteralPath "$tdir" -AclObject $newAcl
        # п08 Отчётность обучающихся по практикам оценочные материалы и результаты аттестации по практикам 
        $tdir = $dirprefix+'\п08 Отчётность обучающихся по практикам оценочные материалы и результаты аттестации по практикам\'+$data.profile+'\'+$year+'\Дневники практик'
        [void](New-Item -force -itemtype directory -Path "$tdir")
        Set-Acl -LiteralPath "$tdir" -AclObject $newAcl
        $tdir = $dirprefix+'\п08 Отчётность обучающихся по практикам оценочные материалы и результаты аттестации по практикам\'+$data.profile+'\'+$year+'\Отчёты'
        [void](New-Item -force -itemtype directory -Path "$tdir")
        Set-Acl -LiteralPath "$tdir" -AclObject $newAcl
        $tdir = $dirprefix+'\п08 Отчётность обучающихся по практикам оценочные материалы и результаты аттестации по практикам\'+$data.profile+'\'+$year+'\Аттестационные листы'
        [void](New-Item -force -itemtype directory -Path "$tdir")
        Set-Acl -LiteralPath "$tdir" -AclObject $newAcl
        $tdir = $dirprefix+'\п08 Отчётность обучающихся по практикам оценочные материалы и результаты аттестации по практикам\'+$data.profile+'\'+$year+'\Характеристики обучающегося по практике'
        #[void](New-Item -force -itemtype directory -Path "$tdir")
        #write-output $tdir
        New-Item -force -itemtype directory -Path "$tdir"
        Set-Acl -LiteralPath "$tdir" -AclObject $newAcl
    }
    # п.4. Программа ГИА требования ВКР критерии оценк 
    $tdir = $dirprefix+'\п04 Программа ГИА требования ВКР критерии оценк\'
    [void](New-Item -force -itemtype directory -Path "$tdir")
    Set-Acl -LiteralPath "$tdir" -AclObject $newAcl
    # п06 Документы подтверждающие разработку ОП ВГУ совместно с заинтересованным работодателем 
    $tdir = $dirprefix+'\п06 Документы подтверждающие разработку ОП ВГУ совместно с заинтересованным работодателем'
    [void](New-Item -force -itemtype directory -Path "$tdir")
    Set-Acl -LiteralPath "$tdir" -AclObject $newAcl
    # п09 Индивидуальные УП обучающихся
    $tdir = $dirprefix+'\п09 Индивидуальные УП обучающихся\'+$data.profile
    [void](New-Item -force -itemtype directory -Path "$tdir")
    Set-Acl -LiteralPath "$tdir" -AclObject $newAcl
    # п10 ВКР 
    $tdir = $dirprefix+'\п10 ВКР\'+$data.profile
    [void](New-Item -force -itemtype directory -Path "$tdir")
    Set-Acl -LiteralPath "$tdir" -AclObject $newAcl
    # п11 Протоколы заседания ГЭК 
    $tdir = $dirprefix+'\п11 Протоколы заседания ГЭК\'+$data.profile
    [void](New-Item -force -itemtype directory -Path "$tdir")
    Set-Acl -LiteralPath "$tdir" -AclObject $newAcl
    #  п12 Заключение председателя ГЭК о соблюдении процедурных вопросов при проведении ГЭ и защите ВКР
    $tdir = $dirprefix+'\п12 Заключение председателя ГЭК о соблюдении процедурных вопросов при проведении ГЭ и защите ВКР\'+$data.profile
    [void](New-Item -force -itemtype directory -Path "$tdir")
    Set-Acl -LiteralPath "$tdir" -AclObject $newAcl
    # п13 Документы предусмотренные ЛНА ВГУ устанавливающие порядок и форму проведения ИА по не имеющим ГА ОП 
    $tdir = $dirprefix+'\п13 Документы предусмотренные ЛНА ВГУ устанавливающие порядок и форму проведения ИА по не имеющим ГА ОП\'+$data.profile
    [void](New-Item -force -itemtype directory -Path "$tdir")
    Set-Acl -LiteralPath "$tdir" -AclObject $newAcl
    #  п14 Договоры об организации и проведении производственной практики между ВГУ и организациями осуществляющими деятельность по профилю ОП
    $tdir = $dirprefix+'\п14 Договоры об организации и проведении производственной практики между ВГУ и организациями осуществляющими деятельность по профилю ОП'
    [void](New-Item -force -itemtype directory -Path "$tdir")
    Set-Acl -LiteralPath "$tdir" -AclObject $newAcl
    #  п15 Договоры о сетевой форме реализации ОП
    $tdir = $dirprefix+'\п15 Договоры о сетевой форме реализации ОП'
    [void](New-Item -force -itemtype directory -Path "$tdir")
    Set-Acl -LiteralPath "$tdir" -AclObject $newAcl
    #  п16 Штатное расписание и личные дела НПР
    $tdir = $dirprefix+'\п16 Штатное расписание и личные дела НПР'
    [void](New-Item -force -itemtype directory -Path "$tdir")
    Set-Acl -LiteralPath "$tdir" -AclObject $newAcl
    $tdir = $dirprefix+'\п16 Штатное расписание и личные дела НПР\Личные дела'
    [void](New-Item -force -itemtype directory -Path "$tdir")
    Set-Acl -LiteralPath "$tdir" -AclObject $newAcl
    #  п17 Документы подтверждающие наличие или право использования в ВГУ ЭБС и ЭИОС соответствующих требованиям ФГОС
    $tdir = $dirprefix+'\п17 Документы подтверждающие наличие или право использования в ВГУ ЭБС и ЭИОС соответствующих требованиям ФГОС'
    [void](New-Item -force -itemtype directory -Path "$tdir")
    Set-Acl -LiteralPath "$tdir" -AclObject $newAcl
    #  п18 Документы подтверждающие соответствие требованиям ФГОС укомплектование библиотечного фонда ВГУ печатными и (или) электронными изданиями 
    $tdir = $dirprefix+'\п18 Документы подтверждающие соответствие требованиям ФГОС укомплектование библиотечного фонда ВГУ печатными и (или) электронными изданиями'
    [void](New-Item -force -itemtype directory -Path "$tdir")
    Set-Acl -LiteralPath "$tdir" -AclObject $newAcl
    #  п19 Документы подтверждающие наличие в ВГУ маттех базы соответствующей требованиям ФГОС
    $tdir = $dirprefix+'\п19 Документы подтверждающие наличие в ВГУ маттех базы соответствующей требованиям ФГОС'
    [void](New-Item -force -itemtype directory -Path "$tdir")
    Set-Acl -LiteralPath "$tdir" -AclObject $newAcl
    #  п20 Договора базовые
    $tdir = $dirprefix+'\п20 Договора базовые'
    [void](New-Item -force -itemtype directory -Path "$tdir")
    Set-Acl -LiteralPath "$tdir" -AclObject $newAcl
    #  п21 Документы подтверждающие общественную аккредитацию ВГУ и ПОА ОП реализуемые в ВГУ
    $tdir = $dirprefix+'\п21 Документы подтверждающие общественную аккредитацию ВГУ и ПОА ОП реализуемые в ВГУ'
    [void](New-Item -force -itemtype directory -Path "$tdir")
    Set-Acl -LiteralPath "$tdir" -AclObject $newAcl
    #  п23 Результаты НОК подготовки обучающихся
    $tdir = $dirprefix+'\п23 Результаты НОК подготовки обучающихся'
    [void](New-Item -force -itemtype directory -Path "$tdir")
    Set-Acl -LiteralPath "$tdir" -AclObject $newAcl
    #  п24 ЛНА
    $tdir = $dirprefix+'\п24 ЛНА'
    [void](New-Item -force -itemtype directory -Path "$tdir")
    Set-Acl -LiteralPath "$tdir" -AclObject $newAcl
    #  п25 Распорядительные акты
    $tdir = $dirprefix+'\п25 Распорядительные акты\О приёме'
    [void](New-Item -force -itemtype directory -Path "$tdir")
    Set-Acl -LiteralPath "$tdir" -AclObject $newAcl
    $tdir = $dirprefix+'\п25 Распорядительные акты\Об обучении по ИУП в том числе ускоренное'
    [void](New-Item -force -itemtype directory -Path "$tdir")
    Set-Acl -LiteralPath "$tdir" -AclObject $newAcl
    $tdir = $dirprefix+'\п25 Распорядительные акты\О переводе обучающихся для получения образования по другому профилю специальности или форме обучения'
    [void](New-Item -force -itemtype directory -Path "$tdir")
    Set-Acl -LiteralPath "$tdir" -AclObject $newAcl
    $tdir = $dirprefix+'\п25 Распорядительные акты\О зачислении в в качестве экстернов в ВГУ для прохождения промежуточных и ГИА по имеющей ГА ОП лиц обучавшихся по соответствующей ОО не имеющей ГА'
    [void](New-Item -force -itemtype directory -Path "$tdir")
    Set-Acl -LiteralPath "$tdir" -AclObject $newAcl
    $tdir = $dirprefix+'\п25 Распорядительные акты\О направлении на практику обучающихся'
    [void](New-Item -force -itemtype directory -Path "$tdir")
    Set-Acl -LiteralPath "$tdir" -AclObject $newAcl
    $tdir = $dirprefix+'\п25 Распорядительные акты\О допуске обучающихся к ГИА'
    [void](New-Item -force -itemtype directory -Path "$tdir")
    Set-Acl -LiteralPath "$tdir" -AclObject $newAcl
    $tdir = $dirprefix+'\п25 Распорядительные акты\Об утверждении состава ГЭК'
    [void](New-Item -force -itemtype directory -Path "$tdir")
    Set-Acl -LiteralPath "$tdir" -AclObject $newAcl
    $tdir = $dirprefix+'\п25 Распорядительные акты\О закреплении за студентами тем ВКР и назначению руководителей и консультантов'
    [void](New-Item -force -itemtype directory -Path "$tdir")
    Set-Acl -LiteralPath "$tdir" -AclObject $newAcl
    $tdir = $dirprefix+'\п25 Распорядительные акты\Об отчислении обучающихся по ОП из ВГУ'
    [void](New-Item -force -itemtype directory -Path "$tdir")
    Set-Acl -LiteralPath "$tdir" -AclObject $newAcl
}

Function createAspirant ($data)
{
    # общий префикс для всех каталогов
    $dirprefix = '\\?\c:\Temp\accred\accred_dirs\'+$data.faculty+'\'+$data.level+'\'+$data.speciality
    [void](New-Item -force -itemtype directory -Path "$dirprefix")
    
    # пользователь для установки прав доступа
    $identity = 'moose'
    # общий объект для раздачи прав на модификацию подкаталогов
    $newAcl = Get-Acl $dirprefix
    $fsAList = $identity, 'FullControl', 'ContainerInherit,ObjectInherit', 'InheritOnly', 'Allow'
    $fsa = New-Object -TypeName System.Security.AccessControl.FileSystemAccessRule -ArgumentList $fsAList
    $newAcl.SetAccessRule($fsa)
    # Шаблон команды для расстановки прав
    # Set-Acl -LiteralPath "$tdir" -AclObject $newAcl

    $years = 2015..2020
    foreach ($year in $years)
    {
        # п.1. ООП
        $tdir = $dirprefix+'\п01 ООП\'+$data.profile+'\'+$data.form+'\'+$year+'\РПД '+$data.profile+' '+$year
        [void](New-Item -force -itemtype directory -Path "$tdir")
        Set-Acl -LiteralPath "$tdir" -AclObject $newAcl
        $tdir = $dirprefix+'\п01 ООП\'+$data.profile+'\'+$data.form+'\'+$year+'\РПП '+$data.profile+' '+$year
        [void](New-Item -force -itemtype directory -Path "$tdir")
        Set-Acl -LiteralPath "$tdir" -AclObject $newAcl
        $tdir = $dirprefix+'\п01 ООП\'+$data.profile+'\'+$data.form+'\'+$year+'\методические материалы'+$data.profile+' '+$year
        [void](New-Item -force -itemtype directory -Path "$tdir")
        Set-Acl -LiteralPath "$tdir" -AclObject $newAcl
        $tdir = $dirprefix+'\п01 ООП\'+$data.profile+'\'+$data.form+'\'+$year+'\иные материалы'+$data.profile+' '+$year
        [void](New-Item -force -itemtype directory -Path "$tdir")
        Set-Acl -LiteralPath "$tdir" -AclObject $newAcl
        $tdir = $dirprefix+'\п01 ООП\'+$data.profile+'\'+$year
        Set-Acl -LiteralPath "$tdir" -AclObject $newAcl
        # п.3. расписания
        $tdir = $dirprefix+'\п03 Расписания\'+$data.profile+'\'+$data.form+'\'+$year
        [void](New-Item -force -itemtype directory -Path "$tdir")
        Set-Acl -LiteralPath "$tdir" -AclObject $newAcl
        # п.4. Расписания промежуточных аттестаций ГИА(ИА)
        $tdir = $dirprefix+'\п04 Расписания промежуточных аттестаций, ГИА(ИА)\'+$data.profile+'\'+$data.form+'\'+$year
        [void](New-Item -force -itemtype directory -Path "$tdir")
        Set-Acl -LiteralPath "$tdir" -AclObject $newAcl
        # п05 Документы содержащие информацию об индивидуальном учёте результатов освоения обучающимися ПА предусмотренные ЛНА ВГУ 
        $tdir = $dirprefix+'\п05 Документы содержащие информацию об индивидуальном учёте результатов освоения обучающимися ПА предусмотренные ЛНА ВГУ\'+$data.profile+'\'+$data.form+'\'+$year+'\Зачётные книжки'
        [void](New-Item -force -itemtype directory -Path "$tdir")
        Set-Acl -LiteralPath "$tdir" -AclObject $newAcl
        $tdir = $dirprefix+'\п05 Документы содержащие информацию об индивидуальном учёте результатов освоения обучающимися ПА предусмотренные ЛНА ВГУ\'+$data.profile+'\'+$data.form+'\'+$year+'\Личные карточки'
        [void](New-Item -force -itemtype directory -Path "$tdir")
        Set-Acl -LiteralPath "$tdir" -AclObject $newAcl
        $tdir = $dirprefix+'\п05 Документы содержащие информацию об индивидуальном учёте результатов освоения обучающимися ПА предусмотренные ЛНА ВГУ\'+$data.profile+'\'+$data.form+'\'+$year
        Set-Acl -LiteralPath "$tdir" -AclObject $newAcl
        # п07 Отчётность обучающихся по практикам оценочные материалы и результаты аттестации по практикам 
        $tdir = $dirprefix+'\п07 Отчётность обучающихся по практикам оценочные материалы и результаты аттестации по практикам\'+$data.profile+'\'+$data.form+'\'+$year+'\Дневники практик'
        [void](New-Item -force -itemtype directory -Path "$tdir")
        Set-Acl -LiteralPath "$tdir" -AclObject $newAcl
        $tdir = $dirprefix+'\п07 Отчётность обучающихся по практикам оценочные материалы и результаты аттестации по практикам\'+$data.profile+'\'+$data.form+'\'+$year+'\Отчёты'
        [void](New-Item -force -itemtype directory -Path "$tdir")
        Set-Acl -LiteralPath "$tdir" -AclObject $newAcl
        $tdir = $dirprefix+'\п07 Отчётность обучающихся по практикам оценочные материалы и результаты аттестации по практикам\'+$data.profile+'\'+$data.form+'\'+$year+'\Аттестации'
        [void](New-Item -force -itemtype directory -Path "$tdir")
        Set-Acl -LiteralPath "$tdir" -AclObject $newAcl
    }
    # п02 Индивидуальные УП обучающихся
    $tdir = $dirprefix+'\п02 Индивидуальные УП обучающихся\'+$data.profile
    [void](New-Item -force -itemtype directory -Path "$tdir")
    Set-Acl -LiteralPath "$tdir" -AclObject $newAcl
    # n.6. Док-ты и матер. о рез. НИР обуч. (патенты, св-ва, науч. статьи, дипломы выставок, конкурсов) 
    $tdir = $dirprefix+'\п06 Док-ты и матер. о рез. НИР обуч. (патенты, св-ва, науч. статьи, дипломы выставок, конкурсов)'
    [void](New-Item -force -itemtype directory -Path "$tdir")
    Set-Acl -LiteralPath "$tdir" -AclObject $newAcl
    #  п08 Договоры об организации и проведении производственной практики между ВГУ и организациями осуществляющими деятельность по профилю ОП
    $tdir = $dirprefix+'\п08 Договоры об организации и проведении производственной практики между ВГУ и организациями осуществляющими деятельность по профилю ОП'
    [void](New-Item -force -itemtype directory -Path "$tdir")
    Set-Acl -LiteralPath "$tdir" -AclObject $newAcl
    # n.9. Науч. докл. об осн. рез. подг. обуч. НКР (дис.)
    $tdir = $dirprefix+'\п09 Науч. докл. об осн. рез. подг. обуч. НКР (дис.)'
    [void](New-Item -force -itemtype directory -Path "$tdir")
    Set-Acl -LiteralPath "$tdir" -AclObject $newAcl
    # n10 Протоколы засед ГЭК (папка)
    $tdir = $dirprefix+'\п10 Протоколы засед ГЭК (папка)'
    [void](New-Item -force -itemtype directory -Path "$tdir")
    Set-Acl -LiteralPath "$tdir" -AclObject $newAcl
    # п11 Документы предусмотренные ЛНА ВГУ устанавливающие порядок и форму проведения ИА по не имеющим ГА ПА 
    $tdir = $dirprefix+'\п11 Документы предусмотренные ЛНА ВГУ устанавливающие порядок и форму проведения ИА по не имеющим ГА ПА\'+$data.profile
    [void](New-Item -force -itemtype directory -Path "$tdir")
    Set-Acl -LiteralPath "$tdir" -AclObject $newAcl
    #  п12 Договоры о сетевой форме реализации ОП
    $tdir = $dirprefix+'\п12 Договоры о сетевой форме реализации ОП'
    [void](New-Item -force -itemtype directory -Path "$tdir")
    Set-Acl -LiteralPath "$tdir" -AclObject $newAcl
    #  п13 Штатное расписание и личные дела НПР
    $tdir = $dirprefix+'\п13 Штатное расписание и личные дела НПР'
    [void](New-Item -force -itemtype directory -Path "$tdir")
    Set-Acl -LiteralPath "$tdir" -AclObject $newAcl
    $tdir = $dirprefix+'\п13 Штатное расписание и личные дела НПР\Личные дела'
    [void](New-Item -force -itemtype directory -Path "$tdir")
    Set-Acl -LiteralPath "$tdir" -AclObject $newAcl
    #  п14 Индивидуальные планы работы НПР
    $tdir = $dirprefix+'\п14 Индивидуальные планы работы НПР'
    [void](New-Item -force -itemtype directory -Path "$tdir")
    Set-Acl -LiteralPath "$tdir" -AclObject $newAcl
    #  п15 Документы подтверждающие наличие или право использования в ВГУ ЭБС и ЭИОС соответствующих требованиям ФГОС
    $tdir = $dirprefix+'\п15 Документы подтверждающие наличие или право использования в ВГУ ЭБС и ЭИОС соответствующих требованиям ФГОС'
    [void](New-Item -force -itemtype directory -Path "$tdir")
    Set-Acl -LiteralPath "$tdir" -AclObject $newAcl
    #  п16 Документы подтверждающие наличие в ВГУ маттех базы соответствующей требованиям ФГОС
    $tdir = $dirprefix+'\п16 Документы подтверждающие наличие в ВГУ маттех базы соответствующей требованиям ФГОС'
    [void](New-Item -force -itemtype directory -Path "$tdir")
    Set-Acl -LiteralPath "$tdir" -AclObject $newAcl
    #  п17 Договоры о создании в ВГУ лабораторий осуществляющих научную научно-исследовательскую или научно-техническую деятельность
    $tdir = $dirprefix+'\п17 Договоры о создании в ВГУ лабораторий осуществляющих научную научно-исследовательскую или научно-техническую деятельность'
    [void](New-Item -force -itemtype directory -Path "$tdir")
    Set-Acl -LiteralPath "$tdir" -AclObject $newAcl
    #  п18 Договоры о создании ВГУ в научных и иных организациях осуществляющих научно исследовательскую деятельность кафедр осуществляющих образовательную деятельность
    $tdir = $dirprefix+'\п18 Договоры о создании ВГУ в научных и иных организациях осуществляющих научно исследовательскую деятельность кафедр осуществляющих образовательную деятельность'
    [void](New-Item -force -itemtype directory -Path "$tdir")
    Set-Acl -LiteralPath "$tdir" -AclObject $newAcl
    #  п19 Договор о создании в ВГУ кафедр и иных структурных подразделений обеспечивающих практическую подготовку обучающихся на базе иных организаций осуществляющих деятельность по профилю ОП
    $tdir = $dirprefix+'\п19 Договор о создании в ВГУ кафедр и иных структурных подразделений обеспечивающих практическую подготовку обучающихся на базе иных организаций осуществляющих деятельность по профилю ОП'
    [void](New-Item -force -itemtype directory -Path "$tdir")
    Set-Acl -LiteralPath "$tdir" -AclObject $newAcl
    # п20 Документы подтверждающие реализацию ОП требующих особого порядка реализации в связи с использованием сведений составляющих гостайну 
    $tdir = $dirprefix+'\п20 Документы подтверждающие реализацию ОП требующих особого порядка реализации в связи с использованием сведений составляющих гостайну'
    [void](New-Item -force -itemtype directory -Path "$tdir")
    Set-Acl -LiteralPath "$tdir" -AclObject $newAcl
    #  п21 Документы подтверждающие общественную аккредитацию ВГУ и ПОА ПА реализуемые в ВГУ
    $tdir = $dirprefix+'\п21 Документы подтверждающие общественную аккредитацию ВГУ и ПОА ОП реализуемые в ВГУ'
    [void](New-Item -force -itemtype directory -Path "$tdir")
    Set-Acl -LiteralPath "$tdir" -AclObject $newAcl
    #  п22 Результаты НОК подготовки обучающихся
    $tdir = $dirprefix+'\п22 Результаты НОК подготовки обучающихся'
    [void](New-Item -force -itemtype directory -Path "$tdir")
    Set-Acl -LiteralPath "$tdir" -AclObject $newAcl
    #  п23 ЛНА
    $tdir = $dirprefix+'\п23 ЛНА'
    [void](New-Item -force -itemtype directory -Path "$tdir")
    Set-Acl -LiteralPath "$tdir" -AclObject $newAcl
    #  п24 Распорядительные акты
    $tdir = $dirprefix+'\п24 Распорядительные акты\О приёме'
    [void](New-Item -force -itemtype directory -Path "$tdir")
    Set-Acl -LiteralPath "$tdir" -AclObject $newAcl
    $tdir = $dirprefix+'\п24 Распорядительные акты\Об обучении по ИУП в том числе ускоренное'
    [void](New-Item -force -itemtype directory -Path "$tdir")
    Set-Acl -LiteralPath "$tdir" -AclObject $newAcl
    $tdir = $dirprefix+'\п24 Распорядительные акты\О переводе обучающихся для получения образования по другому профилю специальности или форме обучения'
    [void](New-Item -force -itemtype directory -Path "$tdir")
    Set-Acl -LiteralPath "$tdir" -AclObject $newAcl
    $tdir = $dirprefix+'\п24 Распорядительные акты\О зачислении в в качестве экстернов в ВГУ для прохождения промежуточных и ГИА по имеющей ГА ОП лиц обучавшихся по соответствующей ОО не имеющей ГА'
    [void](New-Item -force -itemtype directory -Path "$tdir")
    Set-Acl -LiteralPath "$tdir" -AclObject $newAcl
    $tdir = $dirprefix+'\п24 Распорядительные акты\О направлении на практику обучающихся'
    [void](New-Item -force -itemtype directory -Path "$tdir")
    Set-Acl -LiteralPath "$tdir" -AclObject $newAcl
    $tdir = $dirprefix+'\п24 Распорядительные акты\О допуске обучающихся к ГИА'
    [void](New-Item -force -itemtype directory -Path "$tdir")
    Set-Acl -LiteralPath "$tdir" -AclObject $newAcl
    $tdir = $dirprefix+'\п24 Распорядительные акты\Об утверждении состава ГЭК'
    [void](New-Item -force -itemtype directory -Path "$tdir")
    Set-Acl -LiteralPath "$tdir" -AclObject $newAcl
    $tdir = $dirprefix+'\п24 Распорядительные акты\О закреплении за студентами тем ВКР и назначению руководителей и консультантов'
    [void](New-Item -force -itemtype directory -Path "$tdir")
    Set-Acl -LiteralPath "$tdir" -AclObject $newAcl
    $tdir = $dirprefix+'\п24 Распорядительные акты\Об отчислении обучающихся по ОП из ВГУ'
    [void](New-Item -force -itemtype directory -Path "$tdir")
    Set-Acl -LiteralPath "$tdir" -AclObject $newAcl

}

Function createOrdinator ($data)
{
    # общий префикс для всех каталогов
    $dirprefix = '\\?\c:\Temp\accred\accred_dirs\'+$data.faculty+'\'+$data.level+'\'+$data.speciality
    [void](New-Item -force -itemtype directory -Path "$dirprefix")
    
    # пользователь для установки прав доступа
    $identity = 'moose'
    # общий объект для раздачи прав на модификацию подкаталогов
    $newAcl = Get-Acl $dirprefix
    $fsAList = $identity, 'FullControl', 'ContainerInherit,ObjectInherit', 'InheritOnly', 'Allow'
    $fsa = New-Object -TypeName System.Security.AccessControl.FileSystemAccessRule -ArgumentList $fsAList
    $newAcl.SetAccessRule($fsa)
    # Шаблон команды для расстановки прав
    # Set-Acl -LiteralPath "$tdir" -AclObject $newAcl

    $years = 2015..2020
    foreach ($year in $years)
    {
        # п.1. ООП
        $tdir = $dirprefix+'\п01 ООП\'+$year+'\РПД '+$year
        [void](New-Item -force -itemtype directory -Path "$tdir")
        Set-Acl -LiteralPath "$tdir" -AclObject $newAcl
        $tdir = $dirprefix+'\п01 ООП\'+$year+'\РПП '+$year
        [void](New-Item -force -itemtype directory -Path "$tdir")
        Set-Acl -LiteralPath "$tdir" -AclObject $newAcl
        $tdir = $dirprefix+'\п01 ООП\'+$year+'\методические материалы'+$year
        [void](New-Item -force -itemtype directory -Path "$tdir")
        Set-Acl -LiteralPath "$tdir" -AclObject $newAcl
        $tdir = $dirprefix+'\п01 ООП\'+$year+'\иные материалы'+$year
        [void](New-Item -force -itemtype directory -Path "$tdir")
        Set-Acl -LiteralPath "$tdir" -AclObject $newAcl
        $tdir = $dirprefix+'\п01 ООП\'+$year
        Set-Acl -LiteralPath "$tdir" -AclObject $newAcl
        # п.2. расписания
        $tdir = $dirprefix+'\п02 Расписания\'+$year
        [void](New-Item -force -itemtype directory -Path "$tdir")
        Set-Acl -LiteralPath "$tdir" -AclObject $newAcl
        # п.3. Расписания промежуточных аттестаций ГИА(ИА)
        $tdir = $dirprefix+'\п03 Расписания промежуточных аттестаций, ГИА(ИА)\'+$year
        [void](New-Item -force -itemtype directory -Path "$tdir")
        Set-Acl -LiteralPath "$tdir" -AclObject $newAcl
        # п04 Документы содержащие информацию об индивидуальном учёте результатов освоения обучающимися ПА предусмотренные ЛНА ВГУ 
        $tdir = $dirprefix+'\п04 Документы содержащие информацию об индивидуальном учёте результатов освоения обучающимися ПА предусмотренные ЛНА ВГУ\'+$year+'\Зачётные книжки'
        [void](New-Item -force -itemtype directory -Path "$tdir")
        Set-Acl -LiteralPath "$tdir" -AclObject $newAcl
        $tdir = $dirprefix+'\п04 Документы содержащие информацию об индивидуальном учёте результатов освоения обучающимися ПА предусмотренные ЛНА ВГУ\'+$year+'\Личные карточки'
        [void](New-Item -force -itemtype directory -Path "$tdir")
        Set-Acl -LiteralPath "$tdir" -AclObject $newAcl
        $tdir = $dirprefix+'\п04 Документы содержащие информацию об индивидуальном учёте результатов освоения обучающимися ПА предусмотренные ЛНА ВГУ\'+$year
        Set-Acl -LiteralPath "$tdir" -AclObject $newAcl
        # п06 Отчётность обучающихся по практикам оценочные материалы и результаты аттестации по практикам 
        $tdir = $dirprefix+'\п06 Отчётность обучающихся по практикам оценочные материалы и результаты аттестации по практикам\'+$year+'\Дневники практик'
        [void](New-Item -force -itemtype directory -Path "$tdir")
        Set-Acl -LiteralPath "$tdir" -AclObject $newAcl
        $tdir = $dirprefix+'\п06 Отчётность обучающихся по практикам оценочные материалы и результаты аттестации по практикам\'+$year+'\Отчёты'
        [void](New-Item -force -itemtype directory -Path "$tdir")
        Set-Acl -LiteralPath "$tdir" -AclObject $newAcl
        $tdir = $dirprefix+'\п06 Отчётность обучающихся по практикам оценочные материалы и результаты аттестации по практикам\'+$year+'\Аттестационные листы'
        [void](New-Item -force -itemtype directory -Path "$tdir")
        Set-Acl -LiteralPath "$tdir" -AclObject $newAcl
    }
    # п05 Индивидуальные УП обучающихся
    $tdir = $dirprefix+'\п05 Индивидуальные УП обучающихся\'
    [void](New-Item -force -itemtype directory -Path "$tdir")
    Set-Acl -LiteralPath "$tdir" -AclObject $newAcl
    # n7 Протоколы засед ГЭК (папка)
    $tdir = $dirprefix+'\п07 Протоколы засед ГЭК (папка)'
    [void](New-Item -force -itemtype directory -Path "$tdir")
    Set-Acl -LiteralPath "$tdir" -AclObject $newAcl
    # п08 Документы предусмотренные ЛНА ВГУ устанавливающие порядок и форму проведения ИА по не имеющим ГА ПО 
    $tdir = $dirprefix+'\п08 Документы предусмотренные ЛНА ВГУ устанавливающие порядок и форму проведения ИА по не имеющим ГА ПО\'
    [void](New-Item -force -itemtype directory -Path "$tdir")
    Set-Acl -LiteralPath "$tdir" -AclObject $newAcl
    # n9 Договоры об орг и провед практ между ВГУ и орг-и осущ деят-ть по профилю ПО
    $tdir = $dirprefix+'\п09 Договоры об орг и провед практ между ВГУ и орг-и осущ деят-ть по профилю ПО'
    [void](New-Item -force -itemtype directory -Path "$tdir")
    Set-Acl -LiteralPath "$tdir" -AclObject $newAcl
    #  п10 Договоры о сетевой форме реализации ОП
    $tdir = $dirprefix+'\п10 Договоры о сетевой форме реализации ОП'
    [void](New-Item -force -itemtype directory -Path "$tdir")
    Set-Acl -LiteralPath "$tdir" -AclObject $newAcl
    #  п11 Штатное расписание и личные дела НПР
    $tdir = $dirprefix+'\п11 Штатное расписание и личные дела НПР'
    [void](New-Item -force -itemtype directory -Path "$tdir")
    Set-Acl -LiteralPath "$tdir" -AclObject $newAcl
    $tdir = $dirprefix+'\п11 Штатное расписание и личные дела НПР\Личные дела'
    [void](New-Item -force -itemtype directory -Path "$tdir")
    Set-Acl -LiteralPath "$tdir" -AclObject $newAcl
    #  п12 Индивидуальные планы работы НПР
    $tdir = $dirprefix+'\п12 Индивидуальные планы работы НПР'
    [void](New-Item -force -itemtype directory -Path "$tdir")
    Set-Acl -LiteralPath "$tdir" -AclObject $newAcl
    #  п13 Документы подтверждающие наличие или право использования в ВГУ ЭБС и ЭИОС соответствующих требованиям ФГОС
    $tdir = $dirprefix+'\п15 Документы подтверждающие наличие или право использования в ВГУ ЭБС и ЭИОС соответствующих требованиям ФГОС'
    [void](New-Item -force -itemtype directory -Path "$tdir")
    Set-Acl -LiteralPath "$tdir" -AclObject $newAcl
    #  п14 Документы подтверждающие наличие в ВГУ маттех базы соответствующей требованиям ФГОС
    $tdir = $dirprefix+'\п16 Документы подтверждающие наличие в ВГУ маттех базы соответствующей требованиям ФГОС'
    [void](New-Item -force -itemtype directory -Path "$tdir")
    Set-Acl -LiteralPath "$tdir" -AclObject $newAcl
    #  п15 Договоры о создании в ВГУ лабораторий осуществляющих научную научно-исследовательскую или научно-техническую деятельность
    $tdir = $dirprefix+'\п15 Договоры о создании в ВГУ лабораторий осуществляющих научную научно-исследовательскую или научно-техническую деятельность'
    [void](New-Item -force -itemtype directory -Path "$tdir")
    Set-Acl -LiteralPath "$tdir" -AclObject $newAcl
    #  п16 Договоры о создании ВГУ в научных и иных организациях осуществляющих научно исследовательскую деятельность кафедр осуществляющих образовательную деятельность
    $tdir = $dirprefix+'\п16 Договоры о создании ВГУ в научных и иных организациях осуществляющих научно исследовательскую деятельность кафедр осуществляющих образовательную деятельность'
    [void](New-Item -force -itemtype directory -Path "$tdir")
    Set-Acl -LiteralPath "$tdir" -AclObject $newAcl
    #  п17 Договор о создании в ВГУ кафедр и иных структурных подразделений обеспечивающих практическую подготовку обучающихся на базе иных организаций осуществляющих деятельность по профилю ОП
    $tdir = $dirprefix+'\п17 Договор о создании в ВГУ кафедр и иных структурных подразделений обеспечивающих практическую подготовку обучающихся на базе иных организаций осуществляющих деятельность по профилю ОП'
    [void](New-Item -force -itemtype directory -Path "$tdir")
    Set-Acl -LiteralPath "$tdir" -AclObject $newAcl
    #  п18 Документы подтверждающие общественную аккредитацию ВГУ и ПОА ПА реализуемые в ВГУ
    $tdir = $dirprefix+'\п18 Документы подтверждающие общественную аккредитацию ВГУ и ПОА ОП реализуемые в ВГУ'
    [void](New-Item -force -itemtype directory -Path "$tdir")
    Set-Acl -LiteralPath "$tdir" -AclObject $newAcl
    #  п19 Результаты НОК подготовки обучающихся
    $tdir = $dirprefix+'\п19 Результаты НОК подготовки обучающихся'
    [void](New-Item -force -itemtype directory -Path "$tdir")
    Set-Acl -LiteralPath "$tdir" -AclObject $newAcl
    #  п20 ЛНА
    $tdir = $dirprefix+'\п20 ЛНА'
    [void](New-Item -force -itemtype directory -Path "$tdir")
    Set-Acl -LiteralPath "$tdir" -AclObject $newAcl
    #  п21 Распорядительные акты
    $tdir = $dirprefix+'\п21 Распорядительные акты\О приёме'
    [void](New-Item -force -itemtype directory -Path "$tdir")
    Set-Acl -LiteralPath "$tdir" -AclObject $newAcl
    $tdir = $dirprefix+'\п21 Распорядительные акты\Об обучении по ИУП в том числе ускоренное'
    [void](New-Item -force -itemtype directory -Path "$tdir")
    Set-Acl -LiteralPath "$tdir" -AclObject $newAcl
    $tdir = $dirprefix+'\п21 Распорядительные акты\О переводе обучающихся для получения образования по другому профилю специальности или форме обучения'
    [void](New-Item -force -itemtype directory -Path "$tdir")
    Set-Acl -LiteralPath "$tdir" -AclObject $newAcl
    $tdir = $dirprefix+'\п21 Распорядительные акты\О зачислении в в качестве экстернов в ВГУ для прохождения промежуточных и ГИА по имеющей ГА ОП лиц обучавшихся по соответствующей ОО не имеющей ГА'
    [void](New-Item -force -itemtype directory -Path "$tdir")
    Set-Acl -LiteralPath "$tdir" -AclObject $newAcl
    $tdir = $dirprefix+'\п21 Распорядительные акты\О направлении на практику обучающихся'
    [void](New-Item -force -itemtype directory -Path "$tdir")
    Set-Acl -LiteralPath "$tdir" -AclObject $newAcl
    $tdir = $dirprefix+'\п21 Распорядительные акты\О допуске обучающихся к ГИА'
    [void](New-Item -force -itemtype directory -Path "$tdir")
    Set-Acl -LiteralPath "$tdir" -AclObject $newAcl
    $tdir = $dirprefix+'\п21 Распорядительные акты\Об утверждении состава ГЭК'
    [void](New-Item -force -itemtype directory -Path "$tdir")
    Set-Acl -LiteralPath "$tdir" -AclObject $newAcl
    $tdir = $dirprefix+'\п21 Распорядительные акты\О закреплении за студентами тем ВКР и назначению руководителей и консультантов'
    [void](New-Item -force -itemtype directory -Path "$tdir")
    Set-Acl -LiteralPath "$tdir" -AclObject $newAcl
    $tdir = $dirprefix+'\п21 Распорядительные акты\Об отчислении обучающихся по ОП из ВГУ'
    [void](New-Item -force -itemtype directory -Path "$tdir")
    Set-Acl -LiteralPath "$tdir" -AclObject $newAcl

}

Function createHighEdu ($data)
{
    # общий префикс для всех каталогов
    $dirprefix = '\\?\c:\Temp\accred\accred_dirs\'+$data.faculty+'\'+$data.level+'\'+$data.speciality
    [void](New-Item -force -itemtype directory -Path "$dirprefix")
    
    # пользователь для установки прав доступа
    $identity = 'moose'
    # общий объект для раздачи прав на модификацию подкаталогов
    $newAcl = Get-Acl $dirprefix
    $fsAList = $identity, 'FullControl', 'ContainerInherit,ObjectInherit', 'InheritOnly', 'Allow'
    $fsa = New-Object -TypeName System.Security.AccessControl.FileSystemAccessRule -ArgumentList $fsAList
    $newAcl.SetAccessRule($fsa)
    # Шаблон команды для расстановки прав
    # Set-Acl -LiteralPath "$tdir" -AclObject $newAcl

    $years = 2015..2020
    foreach ($year in $years)
    {
        # п.1. ООП
        $tdir = $dirprefix+'\п01 ООП\'+$data.profile+'\'+$data.form+'\'+$year+'\РПД '+$data.profile+' '+$year
        [void](New-Item -force -itemtype directory -Path "$tdir")
        Set-Acl -LiteralPath "$tdir" -AclObject $newAcl
        $tdir = $dirprefix+'\п01 ООП\'+$data.profile+'\'+$data.form+'\'+$year+'\РПП '+$data.profile+' '+$year
        [void](New-Item -force -itemtype directory -Path "$tdir")
        Set-Acl -LiteralPath "$tdir" -AclObject $newAcl
        $tdir = $dirprefix+'\п01 ООП\'+$data.profile+'\'+$data.form+'\'+$year+'\методические материалы'+$data.profile+' '+$year
        [void](New-Item -force -itemtype directory -Path "$tdir")
        Set-Acl -LiteralPath "$tdir" -AclObject $newAcl
        $tdir = $dirprefix+'\п01 ООП\'+$data.profile+'\'+$data.form+'\'+$year+'\иные материалы'+$data.profile+' '+$year
        [void](New-Item -force -itemtype directory -Path "$tdir")
        Set-Acl -LiteralPath "$tdir" -AclObject $newAcl
        $tdir = $dirprefix+'\п01 ООП\'+$data.profile+'\'+$year
        Set-Acl -LiteralPath "$tdir" -AclObject $newAcl
        # п.2. расписания
        $tdir = $dirprefix+'\п02 Расписания\'+$data.profile+'\'+$data.form+'\'+$year
        [void](New-Item -force -itemtype directory -Path "$tdir")
        Set-Acl -LiteralPath "$tdir" -AclObject $newAcl
        # п.3. Расписания промежуточных аттестаций ГИА(ИА)
        $tdir = $dirprefix+'\п03 Расписания промежуточных аттестаций, ГИА(ИА)\'+$data.profile+'\'+$data.form+'\'+$year
        [void](New-Item -force -itemtype directory -Path "$tdir")
        Set-Acl -LiteralPath "$tdir" -AclObject $newAcl
        # п05 Документы содержащие информацию об индивидуальном учёте результатов освоения обучающимися ОП предусмотренные ЛНА ВГУ 
        $tdir = $dirprefix+'\п05 Документы содержащие информацию об индивидуальном учёте результатов освоения обучающимися ОП предусмотренные ЛНА ВГУ\'+$data.profile+'\'+$data.form+'\'+$year+'\Зачётные книжки'
        [void](New-Item -force -itemtype directory -Path "$tdir")
        Set-Acl -LiteralPath "$tdir" -AclObject $newAcl
        $tdir = $dirprefix+'\п05 Документы содержащие информацию об индивидуальном учёте результатов освоения обучающимися ОП предусмотренные ЛНА ВГУ\'+$data.profile+'\'+$data.form+'\'+$year+'\Личные карточки'
        [void](New-Item -force -itemtype directory -Path "$tdir")
        Set-Acl -LiteralPath "$tdir" -AclObject $newAcl
        $tdir = $dirprefix+'\п05 Документы содержащие информацию об индивидуальном учёте результатов освоения обучающимися ОП предусмотренные ЛНА ВГУ\'+$data.profile+'\'+$data.form+'\'+$year
        Set-Acl -LiteralPath "$tdir" -AclObject $newAcl
        # п07 Отчётность обучающихся по практикам оценочные материалы и результаты аттестации по практикам 
        $tdir = $dirprefix+'\п07 Отчётность обучающихся по практикам оценочные материалы и результаты аттестации по практикам\'+$data.profile+'\'+$data.form+'\'+$year+'\Дневники практик'
        [void](New-Item -force -itemtype directory -Path "$tdir")
        Set-Acl -LiteralPath "$tdir" -AclObject $newAcl
        $tdir = $dirprefix+'\п07 Отчётность обучающихся по практикам оценочные материалы и результаты аттестации по практикам\'+$data.profile+'\'+$data.form+'\'+$year+'\Отчёты'
        [void](New-Item -force -itemtype directory -Path "$tdir")
        Set-Acl -LiteralPath "$tdir" -AclObject $newAcl
        $tdir = $dirprefix+'\п07 Отчётность обучающихся по практикам оценочные материалы и результаты аттестации по практикам\'+$data.profile+'\'+$data.form+'\'+$year+'\Аттестационные листы'
        [void](New-Item -force -itemtype directory -Path "$tdir")
        Set-Acl -LiteralPath "$tdir" -AclObject $newAcl
    }
    # п04 Индивидуальные УП обучающихся
    $tdir = $dirprefix+'\п04 Индивидуальные УП обучающихся\'+$data.profile
    [void](New-Item -force -itemtype directory -Path "$tdir")
    Set-Acl -LiteralPath "$tdir" -AclObject $newAcl
    # п06 Документы и материалы о результатах НИР обучающихся
    $tdir = $dirprefix+'\п06 Документы и материалы о результатах НИР обучающихся\'
    [void](New-Item -force -itemtype directory -Path "$tdir")
    Set-Acl -LiteralPath "$tdir" -AclObject $newAcl
    # п08 ВКР 
    $tdir = $dirprefix+'\п08 ВКР\'+$data.profile
    [void](New-Item -force -itemtype directory -Path "$tdir")
    Set-Acl -LiteralPath "$tdir" -AclObject $newAcl
    # п09 Протоколы заседания ГЭК 
    $tdir = $dirprefix+'\п09 Протоколы заседания ГЭК\'+$data.profile
    [void](New-Item -force -itemtype directory -Path "$tdir")
    Set-Acl -LiteralPath "$tdir" -AclObject $newAcl
    # п10 Отзывы руководителей ВКР 
    $tdir = $dirprefix+'\п10 Отзывы руководителей ВКР\'+$data.profile
    [void](New-Item -force -itemtype directory -Path "$tdir")
    Set-Acl -LiteralPath "$tdir" -AclObject $newAcl
    # п11 Рецензии на ВКР 
    $tdir = $dirprefix+'\п11 Рецензии на ВКР\'+$data.profile
    [void](New-Item -force -itemtype directory -Path "$tdir")
    Set-Acl -LiteralPath "$tdir" -AclObject $newAcl
    # п12 Документы предусмотренные ЛНА ВГУ устанавливающие порядок и форму проведения ИА по не имеющим ГА ОП 
    $tdir = $dirprefix+'\п12 Документы предусмотренные ЛНА ВГУ устанавливающие порядок и форму проведения ИА по не имеющим ГА ОП\'+$data.profile
    [void](New-Item -force -itemtype directory -Path "$tdir")
    Set-Acl -LiteralPath "$tdir" -AclObject $newAcl
    #  п13 Договоры об организации и проведении практик между ВГУ и организациями осуществляющими деятельность по профилю ОП
    $tdir = $dirprefix+'\п13 Договоры об организации и проведении практик между ВГУ и организациями осуществляющими деятельность по профилю ОП'
    [void](New-Item -force -itemtype directory -Path "$tdir")
    Set-Acl -LiteralPath "$tdir" -AclObject $newAcl
    #  п14 Договоры о сетевой форме реализации ОП
    $tdir = $dirprefix+'\п14 Договоры о сетевой форме реализации ОП'
    [void](New-Item -force -itemtype directory -Path "$tdir")
    Set-Acl -LiteralPath "$tdir" -AclObject $newAcl
    #  п15 Штатное расписание и личные дела НПР
    $tdir = $dirprefix+'\п15 Штатное расписание и личные дела НПР'
    [void](New-Item -force -itemtype directory -Path "$tdir")
    Set-Acl -LiteralPath "$tdir" -AclObject $newAcl
    $tdir = $dirprefix+'\п15 Штатное расписание и личные дела НПР\Личные дела'
    [void](New-Item -force -itemtype directory -Path "$tdir")
    Set-Acl -LiteralPath "$tdir" -AclObject $newAcl
    #  п16 Индивидуальные планы работы НПР
    $tdir = $dirprefix+'\п16 Индивидуальные планы работы НПР'
    [void](New-Item -force -itemtype directory -Path "$tdir")
    Set-Acl -LiteralPath "$tdir" -AclObject $newAcl
    #  п17 Документы подтверждающие наличие или право использования в ВГУ ЭБС и ЭИОС соответствующих требованиям ФГОС
    $tdir = $dirprefix+'\п17 Документы подтверждающие наличие или право использования в ВГУ ЭБС и ЭИОС соответствующих требованиям ФГОС'
    [void](New-Item -force -itemtype directory -Path "$tdir")
    Set-Acl -LiteralPath "$tdir" -AclObject $newAcl
    #  п18 Документы подтверждающие наличие в ВГУ маттех базы соответствующей требованиям ФГОС
    $tdir = $dirprefix+'\п18 Документы подтверждающие наличие в ВГУ маттех базы соответствующей требованиям ФГОС'
    [void](New-Item -force -itemtype directory -Path "$tdir")
    Set-Acl -LiteralPath "$tdir" -AclObject $newAcl
    #  п19 Договоры о создании в ВГУ лабораторий осуществляющих научную научно-исследовательскую или научно-техническую деятельность
    $tdir = $dirprefix+'\п19 Договоры о создании в ВГУ лабораторий осуществляющих научную научно-исследовательскую или научно-техническую деятельность'
    [void](New-Item -force -itemtype directory -Path "$tdir")
    Set-Acl -LiteralPath "$tdir" -AclObject $newAcl
    #  п20 Договоры о создании ВГУ в научных и иных организациях осуществляющих научно исследовательскую деятельность кафедр осуществляющих образовательную деятельность
    $tdir = $dirprefix+'\п20 Договоры о создании ВГУ в научных и иных организациях осуществляющих научно исследовательскую деятельность кафедр осуществляющих образовательную деятельность'
    [void](New-Item -force -itemtype directory -Path "$tdir")
    Set-Acl -LiteralPath "$tdir" -AclObject $newAcl
    #  п21 Договор о создании в ВГУ кафедр и иных структурных подразделений обеспечивающих практическую подготовку обучающихся на базе иных организаций осуществляющих деятельность по профилю ОП
    $tdir = $dirprefix+'\п21 Договор о создании в ВГУ кафедр и иных структурных подразделений обеспечивающих практическую подготовку обучающихся на базе иных организаций осуществляющих деятельность по профилю ОП'
    [void](New-Item -force -itemtype directory -Path "$tdir")
    Set-Acl -LiteralPath "$tdir" -AclObject $newAcl
    # п22 Документы подтверждающие реализацию ОП требующих особого порядка реализации в связи с использованием сведений составляющих гостайну 
    $tdir = $dirprefix+'\п22 Документы подтверждающие реализацию ОП требующих особого порядка реализации в связи с использованием сведений составляющих гостайну'
    [void](New-Item -force -itemtype directory -Path "$tdir")
    Set-Acl -LiteralPath "$tdir" -AclObject $newAcl
    #  п23 Документы подтверждающие общественную аккредитацию ВГУ и ПОА ОП реализуемые в ВГУ
    $tdir = $dirprefix+'\п23 Документы подтверждающие общественную аккредитацию ВГУ и ПОА ОП реализуемые в ВГУ'
    [void](New-Item -force -itemtype directory -Path "$tdir")
    Set-Acl -LiteralPath "$tdir" -AclObject $newAcl
    #  п24 Результаты НОК подготовки обучающихся
    $tdir = $dirprefix+'\п24 Результаты НОК подготовки обучающихся'
    [void](New-Item -force -itemtype directory -Path "$tdir")
    Set-Acl -LiteralPath "$tdir" -AclObject $newAcl
    #  п25 ЛНА
    $tdir = $dirprefix+'\п25 ЛНА'
    [void](New-Item -force -itemtype directory -Path "$tdir")
    Set-Acl -LiteralPath "$tdir" -AclObject $newAcl
    #  п26 Распорядительные акты
    $tdir = $dirprefix+'\п26 Распорядительные акты\О приёме'
    [void](New-Item -force -itemtype directory -Path "$tdir")
    Set-Acl -LiteralPath "$tdir" -AclObject $newAcl
    $tdir = $dirprefix+'\п26 Распорядительные акты\Об обучении по ИУП в том числе ускоренное'
    [void](New-Item -force -itemtype directory -Path "$tdir")
    Set-Acl -LiteralPath "$tdir" -AclObject $newAcl
    $tdir = $dirprefix+'\п26 Распорядительные акты\О переводе обучающихся для получения образования по другому профилю специальности или форме обучения'
    [void](New-Item -force -itemtype directory -Path "$tdir")
    Set-Acl -LiteralPath "$tdir" -AclObject $newAcl
    $tdir = $dirprefix+'\п26 Распорядительные акты\О зачислении в в качестве экстернов в ВГУ для прохождения промежуточных и ГИА по имеющей ГА ОП лиц обучавшихся по соответствующей ОО не имеющей ГА'
    [void](New-Item -force -itemtype directory -Path "$tdir")
    Set-Acl -LiteralPath "$tdir" -AclObject $newAcl
    $tdir = $dirprefix+'\п26 Распорядительные акты\О направлении на практику обучающихся'
    [void](New-Item -force -itemtype directory -Path "$tdir")
    Set-Acl -LiteralPath "$tdir" -AclObject $newAcl
    $tdir = $dirprefix+'\п26 Распорядительные акты\О допуске обучающихся к ГИА'
    [void](New-Item -force -itemtype directory -Path "$tdir")
    Set-Acl -LiteralPath "$tdir" -AclObject $newAcl
    $tdir = $dirprefix+'\п26 Распорядительные акты\Об утверждении состава ГЭК'
    [void](New-Item -force -itemtype directory -Path "$tdir")
    Set-Acl -LiteralPath "$tdir" -AclObject $newAcl
    $tdir = $dirprefix+'\п26 Распорядительные акты\О закреплении за студентами тем ВКР и назначению руководителей и консультантов'
    [void](New-Item -force -itemtype directory -Path "$tdir")
    Set-Acl -LiteralPath "$tdir" -AclObject $newAcl
    $tdir = $dirprefix+'\п26 Распорядительные акты\Об отчислении обучающихся по ОП из ВГУ'
    [void](New-Item -force -itemtype directory -Path "$tdir")
    Set-Acl -LiteralPath "$tdir" -AclObject $newAcl
}

Function logRecord($data)
{
    write-output($data)
}


$CoursesData = Import-Csv -LiteralPath '.\regdata\test_reestr.csv' -Delimiter ';' -Encoding utf8

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

