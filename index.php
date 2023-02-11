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

if($total_reg == 0){
  $pdo->query("INSERT INTO usuarios SET nome = '$nome_admin', email = '$email_adm', senha = '123', nivel = 'Administrador' ");  
}

if($total_reg2 == 0){
  $pdo->query("INSERT INTO niveis SET nivel = 'Administrador'");  
}


//CRIAR UM CLIENTE DIVERSOS DE ID 1
$query = $pdo->query("SELECT * from clientes where id = 1 ");
$res = $query->fetchAll(PDO::FETCH_ASSOC);
$total_reg_cli = @count($res);

if($total_reg_cli == 0){
  $pdo->query("INSERT INTO clientes SET id = 1, nome = 'Diversos', email = 'cliente@cliente.com', pessoa = 'Física', doc = '000.000.000-50', ativo = 'Sim', data = curDate() ");  
}




//CRIAR UM FORNECEDOR DIVERSOS DE ID 1
$query = $pdo->query("SELECT * from fornecedores where id = 1 ");
$res = $query->fetchAll(PDO::FETCH_ASSOC);
$total_reg_cli = @count($res);

if($total_reg_cli == 0){
  $pdo->query("INSERT INTO fornecedores SET id = 1, nome = 'Diversos', email = 'fornecedor@fornecedor.com', pessoa = 'Física', doc = '000.000.000-60', ativo = 'Sim', data = curDate() ");  
}


//ROTINA PARA GERAR AS COBRANÇAS POR EMAIL
$query_cob = $pdo->query("SELECT * from cobrancas where data = curDate()");
$res_cob = $query_cob->fetchAll(PDO::FETCH_ASSOC);
if(@count($res_cob) == 0){

$query = $pdo->query("SELECT * from contas_receber where vencimento = curDate() and status = 'Pendente' ");
    $res = $query->fetchAll(PDO::FETCH_ASSOC);
    $linhas_cob = @count($res);
    if($linhas_cob > 0){
        for($i=0; $i < @count($res); $i++){
            foreach ($res[$i] as $key => $value){} 
                $cliente = $res[$i]['cliente'];
                $descricao = $res[$i]['descricao'];
                $valor = $res[$i]['valor'];
                $valor = number_format($valor, 2, ',', '.');

            $query1 = $pdo->query("SELECT * from clientes where id = '$cliente' ");
            $res1 = $query1->fetchAll(PDO::FETCH_ASSOC);
            if(@count($res1) > 0){
                $nome_cliente = $res1[0]['nome'];
                $email_cliente = $res1[0]['email'];
                
                $destinatario = $email_cliente;
                $assunto = $nome_sistema . ' - Sua conta vence Hoje';
                $mensagem = utf8_decode('Olá '.$nome_cliente. "\r\n"."\r\n" . 'Sua conta '.$descricao. ' no valor de '.$valor. ' está vencendo hoje, se já pagou ignore nosso email! ');
                $cabecalhos = "From: ".$email_adm;
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


<div class="container">
    <div class="row">
        <div class="">
           
            <div class="account-wall">
                <img class="profile-img" src="img/logo.png"
                    alt="">
                    <form>
  <!-- Email input -->
  <div class="form-outline mb-4">
    <input type="email" id="form2Example1" class="form-control" />
    <label class="form-label" for="form2Example1">Email address</label>
  </div>

  <!-- Password input -->
  <div class="form-outline mb-4">
    <input type="password" id="form2Example2" class="form-control" />
    <label class="form-label" for="form2Example2">Password</label>
  </div>

  <!-- 2 column grid layout for inline styling -->
  <div class="row mb-4">
    <div class="col d-flex justify-content-center">
      <!-- Checkbox -->
      <div class="form-check">
        <input class="form-check-input" type="checkbox" value="" id="form2Example31" checked />
        <label class="form-check-label" for="form2Example31"> Remember me </label>
      </div>
    </div>

    <div class="col">
      <!-- Simple link -->
      <a href="#!">Forgot password?</a>
    </div>
  </div>

  <!-- Submit button -->
  <button type="button" class="btn btn-primary btn-block mb-4">Sign in</button>

  <!-- Register buttons -->
  <div class="text-center">
    <p>Not a member? <a href="#!">Register</a></p>
    <p>or sign up with:</p>
    <button type="button" class="btn btn-link btn-floating mx-1">
      <i class="fab fa-facebook-f"></i>
    </button>

    <button type="button" class="btn btn-link btn-floating mx-1">
      <i class="fab fa-google"></i>
    </button>

    <button type="button" class="btn btn-link btn-floating mx-1">
      <i class="fab fa-twitter"></i>
    </button>

    <button type="button" class="btn btn-link btn-floating mx-1">
      <i class="fab fa-github"></i>
    </button>
  </div>
</form>
            </div>
           
        </div>
    </div>
</div>

</body>
</html>