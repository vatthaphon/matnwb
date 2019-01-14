function id = getBaseType(type)
switch type
    case 'types.untyped.ObjectView'
        id = 'H5T_STD_REF_OBJ';
    case 'types.untyped.RegionView'
        id = 'H5T_STD_REF_DSETREG';
    case {'char' 'cell' 'datetime'}
        %modify id to set the proper size
        id = H5T.copy('H5T_C_S1');
        H5T.set_size(id, 'H5T_VARIABLE');
    case 'double'
        id = 'H5T_NATIVE_DOUBLE';
    case {'int64' 'uint64'}
        id = 'H5T_NATIVE_LLONG';
%    pynwb currently doesn't check for uint64 values
%    case 'uint64'
%        id = 'H5T_NATIVE_ULLONG';
    case 'int32'
        id = 'H5T_NATIVE_INT';
    case 'single'
        id = 'H5T_NATIVE_FLOAT';
    case 'logical'
        id = 'H5T_NATIVE_HBOOL';
    otherwise
        error('Type `%s` is not a support raw type', type);
end
end