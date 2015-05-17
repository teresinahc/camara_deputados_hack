function str_out= remove_caracteres_indesejados(str_in)
% funcao que remove caracteres indesejados, tal como line-feed, entre
% outros
% 
% str_out= remove_caracteres_indesejados(str_in)

str_out=strrep(str_in,sprintf('\n'),'');
% str_out=strrep(str_out,sprintf(' '),'');