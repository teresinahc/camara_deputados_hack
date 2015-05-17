function [ str_param ] = parametros_url_post(name,value )
% Prepara o url_parametros a ser utilizado no metodo post. 
%
% [ str_param ] = parametros_url_post(name,value )
str_param='';
    for i=1:length(name)
        str_aux=[name{i},'=',value{i},'&'];
        str_param=strcat(str_param,str_aux);
    end
    str_param=str_param(1:end-1);

end

