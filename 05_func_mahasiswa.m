function func_mahasiswa(nama)
    fprintf('Halo, nama saya %s!\n', nama);
    call_info(nama);
end

function call_info(nama)
    fprintf('Nama "%s" memiliki panjang %d karakter.\n', nama, length(nama));
end
