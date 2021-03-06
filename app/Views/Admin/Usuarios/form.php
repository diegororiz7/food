<div class="form-row">
    <div class="form-group col-md-4">
        <label for="nome">Nome</label>
        <input name="nome" type="text" class="form-control" id="nome" value="<?php echo old('nome', esc($usuario->nome)); ?>">
    </div>

    
    <div class="form-group col-md-2">
        <label for="cpf">CPF</label>
        <input name="cpf" type="text" class="form-control cpf" id="cpf" value="<?php echo old('cpf', esc($usuario->cpf)); ?>">
    </div>

    
    <div class="form-group col-md-3">
        <label for="telefone">Telefone</label>
        <input name="telefone" type="text" class="form-control sp_celphones" id="telefone" value="<?php echo old('telefone', esc($usuario->telefone)); ?>">
    </div>

    <div class="form-group col-md-3">
        <label for="email">E-mail</label>
        <input name="email" type="email" class="form-control" id="email" value="<?php echo old('email', esc($usuario->email)); ?>">
    </div>
</div>

<div class="form-row">

    <div class="form-group col-md-3">
        <label for="password">Senha</label>
        <input type="password" class="form-control" name="password" id="password">
    </div>
    
    <div class="form-group col-md-3">
        <label for="password_confirmation">Confirmação de Senha</label>
        <input type="password" class="form-control" name="password_confirmation" id="password_confirmation">
    </div>

</div>

<div class="form-check form-check-flat form-check-primary mb-2">

    <label for="ativo" class="form-check-label">

        <input type="hidden" value="0" name="ativo">

        <input type="checkbox" class="form-check-input" id="ativo" name="ativo" value="1" <?php if(old('ativo', $usuario->ativo)) : ?> checked="" <?php endif; ?>>
        Ativo

    </label>

</div>

<div class="form-check form-check-flat form-check-primary mb-4">

    <label for="is_admin" class="form-check-label">

        <input type="hidden" value="0" name="is_admin">

        <input type="checkbox" class="form-check-input" id="is_admin" name="is_admin" value="1" <?php if(old('is_admin', $usuario->is_admin)) : ?> checked="" <?php endif; ?>>
        Administrador

    </label>

</div>

<button type="submit" class="btn btn-primary mr-2 btn-sm">Salvar
    <i class="mdi mdi-checkbox-marked-circle btn-icon-prepend"></i>
</button>