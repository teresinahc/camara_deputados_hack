function msg_ret=lista_doadores_candidato_especifico(sqCand,sgUe,nome,numero,partido)
% retorna uma string html contendo a lista de doadores de um dado candidato
% especifico. Funcao requer o envio de parametros especificos para
% funcionar, veja see_also
% 
% msg_ret=lista_doadores_candidato_especifico(sqCand,sgUe,nome,numero,partido)
% 
% 
% teste
% sqCandidato='190000001444';
% sgUe='RJ';
% nmCandidato='JAIR MESSIAS BOLSONARO';
sqCandidato=sqCand;
rb1='on';
rbTipo='on';
tipoEntrega='0';
nrCandidato=numero;
nmCandidato=nome;
sgUfMunicipio='';
sgPartido=partido;
nomeDoador='';
cpfCnpjDoador='';
act='Resumo';

name={'sqCandidato','sgUe','rb1','rbTipo','tipoEntrega','nrCandidato','nmCandidato','sgUfMunicipio','sgPartido','nomeDoador','cpfCnpjDoador','action:resumoReceitasByCandidato'};
value={sqCandidato,sgUe,rb1,rbTipo,tipoEntrega,nrCandidato,nmCandidato,sgUfMunicipio,sgPartido,nomeDoador,cpfCnpjDoador,act};
url=['http://inter01.tse.jus.br/spceweb.consulta.receitasdespesas2014/abrirTelaReceitasCandidato.action'];
%executa um metodo post e le o html de retorno.
msg_ret=urlread(url,'post',{'sqCandidato',sqCandidato,'sgUe',sgUe,'rb1',rb1,'rbTipo',rbTipo,'tipoEntrega',tipoEntrega,'nrCandidato',nrCandidato,'nmCandidato',nmCandidato,'sgUfMunicipio',sgUfMunicipio,'sgPartido',sgPartido,'nomeDoador',nomeDoador,'cpfCnpjDoador',cpfCnpjDoador,'action:resumoReceitasByCandidato',act});