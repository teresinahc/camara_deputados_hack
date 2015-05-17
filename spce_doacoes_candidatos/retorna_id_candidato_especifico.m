function msg_ret=retorna_id_candidato_especifico(nome,cargo,uf)
% retorna os identificadores unicos de um dado politico
% 
% msg_ret=retorna_id_candidato_especifico(nome,cargo,uf)

nome_url=urlencode(nome);
url=['http://inter01.tse.jus.br/spceweb.consulta.receitasdespesas2014/candidatoAutoComplete.do?noCandLimpo=',nome_url,'&sgUe=',uf,'&cdCargo=',num2str(cargo),'&orderBy=cand.NM_CANDIDATO'];
msg_ret=urlread(url);
