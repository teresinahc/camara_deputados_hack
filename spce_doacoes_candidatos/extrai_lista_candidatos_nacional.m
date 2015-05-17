function extrai_lista_candidatos_nacional()
% Funcao que percorre todos os estados e obtem a lista de candidatos por
% estado. O SPCE retorna um arquivo xml contendo essa informação. Ficar
% atento com o encoding desse retorno, pois só funcionou plenamente após eu
% alterar a urlread para usar encode 'latin-1'
% 
%  extrai_lista_candidatos_nacional()



% url='http://inter01.tse.jus.br/spceweb.consulta.receitasdespesas2014/abrirTelaReceitasCandidato.action';
% msg_ret=urlread(url)
% url_js='/spceweb.consulta.receitasdespesas2014/candidatoAutoComplete.do?noCandLimpo=&sgUe=AC&cdCargo=6&orderBy=cand.NM_CANDIDATO';
% url='http://inter01.tse.jus.br/spceweb.consulta.receitasdespesas2014/candidatoAutoComplete.do?noCandLimpo=&sgUe=AC&cdCargo=6&orderBy=cand.NM_CANDIDATO';
% msg_ret=urlread(url)


lista_ufs={'AC','AL','AM','AP','BA','CE','DF','ES','GO','MA','MG','MS','MT','PA','PB','PE','PI','PR','RJ','RN','RO','RR','RS','SC','SE','SP','TO'};

for i=1:length(lista_ufs)
  uf=lista_ufs{i};
   msg_ret=candidato_por_estado(6,uf);
    fid=fopen(strcat('candidatos_',uf,'.xml'),'w');
    fwrite(fid,msg_ret);
    fclose(fid);
end
