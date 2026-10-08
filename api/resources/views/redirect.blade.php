<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="refresh" content="0; url={{ $url }}">
    <title>Redirecionando...</title>
</head>
<body>
    Redirecionando... <a href="{{ $url }}">clique aqui</a>
    <script>
        window.location.replace('{{ $url }}');
    </script>
</body>
</html>
