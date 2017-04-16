function msg_ret=candidato_por_estado(cargo,uf)
% funcao que retorna todos os candidatos a um dado cargo em um determinado
% estado. O retorno é uma string.
% 
% msg_ret=candidato_por_estado(cargo,uf)
url=['http://inter01.tse.jus.br/spceweb.consulta.receitasdespesas2014/candidatoAutoComplete.do?noCandLimpo=&sgUe=',uf,'&cdCargo=',num2str(cargo),'&orderBy=cand.NM_CANDIDATO'];
% msg_ret=urlread(url);
msg_ret=urlread(url);

