# пароль
$password = 'password' 
# логин
$user = 'domainName.local\user' 
# имя компьютера
$computerName = 'computerName'
# имя задачи в планировщике заданий Windows
$taskName = 'taskName'

$pw = convertto-securestring -AsPlainText -Force -String $password
$cred = new-object -typename System.Management.Automation.PSCredential -argumentlist ($user, $pw)

$session = new-pssession -computerName $computerName -Credential $cred
invoke-command -session $session -scriptblock {param ($taskName)
  Get-ScheduledTask -TaskName $taskName | Start-ScheduledTask
} -Arg $taskName # передаём параметр в удаленную сессию
