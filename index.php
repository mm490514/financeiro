<?php
require_once("conexao.php");


//CRIAR O USUÁRIO ADMINISTRADOR CASO ELE NÃO EXISTA
$query = $pdo->query("SELECT * from usuarios");
$res = $query->fetchAll(PDO::FETCH_ASSOC);
$total_reg = @count($res);

//CRIAR O NÍVEL ADMINISTRADOR CASO ELE NÃO EXISTA
$query2 = $pdo->query("SELECT * from niveis where nivel = 'Administrador' ");
$res2 = $query2->fetchAll(PDO::FETCH_ASSOC);
$total_reg2 = @count($res2);

if ($total_reg == 0) {
    $pdo->query("INSERT INTO usuarios SET nome = '$nome_admin', email = '$email_adm', senha = '123', nivel = 'Administrador' ");
}

if ($total_reg2 == 0) {
    $pdo->query("INSERT INTO niveis SET nivel = 'Administrador'");
}


//CRIAR UM CLIENTE DIVERSOS DE ID 1
$query = $pdo->query("SELECT * from clientes where id = 1 ");
$res = $query->fetchAll(PDO::FETCH_ASSOC);
$total_reg_cli = @count($res);

if ($total_reg_cli == 0) {
    $pdo->query("INSERT INTO clientes SET id = 1, nome = 'Diversos', email = 'cliente@cliente.com', pessoa = 'Física', doc = '000.000.000-50', ativo = 'Sim', data = curDate() ");
}




//CRIAR UM FORNECEDOR DIVERSOS DE ID 1
$query = $pdo->query("SELECT * from fornecedores where id = 1 ");
$res = $query->fetchAll(PDO::FETCH_ASSOC);
$total_reg_cli = @count($res);

if ($total_reg_cli == 0) {
    $pdo->query("INSERT INTO fornecedores SET id = 1, nome = 'Diversos', email = 'fornecedor@fornecedor.com', pessoa = 'Física', doc = '000.000.000-60', ativo = 'Sim', data = curDate() ");
}


//ROTINA PARA GERAR AS COBRANÇAS POR EMAIL
$query_cob = $pdo->query("SELECT * from cobrancas where data = curDate()");
$res_cob = $query_cob->fetchAll(PDO::FETCH_ASSOC);
if (@count($res_cob) == 0) {

    $query = $pdo->query("SELECT * from contas_receber where vencimento = curDate() and status = 'Pendente' ");
    $res = $query->fetchAll(PDO::FETCH_ASSOC);
    $linhas_cob = @count($res);
    if ($linhas_cob > 0) {
        for ($i = 0; $i < @count($res); $i++) {
            foreach ($res[$i] as $key => $value) {
            }
            $cliente = $res[$i]['cliente'];
            $descricao = $res[$i]['descricao'];
            $valor = $res[$i]['valor'];
            $valor = number_format($valor, 2, ',', '.');

            $query1 = $pdo->query("SELECT * from clientes where id = '$cliente' ");
            $res1 = $query1->fetchAll(PDO::FETCH_ASSOC);
            if (@count($res1) > 0) {
                $nome_cliente = $res1[0]['nome'];
                $email_cliente = $res1[0]['email'];

                $destinatario = $email_cliente;
                $assunto = $nome_sistema . ' - Sua conta vence Hoje';
                $mensagem = utf8_decode('Olá ' . $nome_cliente . "\r\n" . "\r\n" . 'Sua conta ' . $descricao . ' no valor de ' . $valor . ' está vencendo hoje, se já pagou ignore nosso email! ');
                $cabecalhos = "From: " . $email_adm;
                @mail($destinatario, $assunto, $mensagem, $cabecalhos);
            }
        }
    }

    $pdo->query("INSERT INTO cobrancas set data = curDate(), quantidade = '$linhas_cob' ");
}

?>
<!DOCTYPE html>
<html>

<head>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="Hugo Vasconcelos">

    <link href="img/icone.png" rel="shortcut icon" type="image/x-icon">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">

    <link href="css/estilo-login.css" rel="stylesheet">


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>

    <title><?php echo $nome_sistema ?></title>
</head>

<body class="bg-light">






    <section class="vh-100">
        <div class="container-fluid h-custom">
            <div class="row d-flex justify-content-center align-items-center h-100">
                <div class="col-md-9 col-lg-6 col-xl-5">
                    <img src="img/logoqbonita2.png" class="img-fluid" alt="Sample image">
                </div>
                <div class="col-md-8 col-lg-6 col-xl-4 offset-xl-1">
                    <form method="post" action="autenticar.php">
                        <!-- Email input -->
                        <div class="form-outline mb-4">
                            <input type="email" name="email" id="form3Example3" class="form-control form-control-lg" placeholder="Digite seu endereço de email" />
                            <label class="form-label" for="form3Example3">Endereço de Email</label>
                        </div>

                        <!-- Password input -->
                        <div class="form-outline mb-3">
                            <input type="password" name="senha" id="form3Example4" class="form-control form-control-lg" placeholder="Digite sua senha" />
                            <label class="form-label" for="form3Example4">Senha</label>
                        </div>

                        <div class="text-center text-lg-start mt-4 pt-2">
                        <button type="submit" class="btn btn-lg" style="padding-left: 2.5rem; padding-right: 2.5rem; background-color: #b46b6c; color: white;">Login</button>

                        </div>

                    </form>
                </div>
            </div>
        </div>

    </section>




</body>

</html>