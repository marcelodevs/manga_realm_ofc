<!DOCTYPE html>
<html lang="pt-br">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <link rel="shortcut icon" href="/img/logo.jpeg" type="image/x-icon">
  <!-- BOOTSTRAP -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
  <link rel="stylesheet" href="/css/templates/navbar.css">
  <link rel="stylesheet" href="/css/@yield('css').css">
  <title>MangáRealm @yield('title')</title>
</head>
<body>
  <header>
    @yield('navbar-primary')
    @yield('navbar-secondary')
  </header>
  <main>
    @yield('main')
  </main>

  @yield('others')
  
  <div class="container">
    <footer class="py-3 my-4">
      <ul class="nav justify-content-center border-bottom pb-3 mb-3">
        <li class="nav-item"><a href="/" class="nav-link px-2 text-muted">Home</a></li>
        <li class="nav-item"><a href="/create" class="nav-link px-2 text-muted">Criar</a></li>
        <li class="nav-item"><a href="/authors" class="nav-link px-2 text-muted">Autores</a></li>
        <li class="nav-item"><a href="/help" class="nav-link px-2 text-muted">Ajuda</a></li>
        <li class="nav-item"><a href="/about" class="nav-link px-2 text-muted">Sobre nós</a></li>
      </ul>
      <p class="text-center text-muted">&copy; 2024 -  MangáRealm</p>
    </footer>
  </div>

  <!-- BOOTSTRAP -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
  <!-- JQuery -->
  <script src="/js/jquery-3.7.1.min.js"></script>
  <script @yield('scripts')></script>
  <script @yield('scripts2')></script>
  <script>
    // Tempo restante em segundos antes do timeout da sessão (vindo do Laravel)
    var sessionTimeout = {{ config('session.lifetime') * 60 }}; // Converte minutos em segundos

    // Função para exibir alerta quando o tempo estiver prestes a expirar
    function exibirAlertaTimeout() {
      alert("Sua sessão está expirada! Por favor, copie seu rascunho e atualize a página para continuar escrevendo sem perder seu progresso.");
    }

    // Ativa o alerta 5 minutos antes do tempo de expiração da sessão
    setTimeout(exibirAlertaTimeout, (sessionTimeout - 300) * 1000); // 300 segundos = 5 minutos
  </script>
</body>
</html>
