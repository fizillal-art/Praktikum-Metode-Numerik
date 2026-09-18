% Fungsi dengan perintah return di dalamnya
function result = cek_pembagian(param)
    result = 0;
    if param == 0
        disp('Angka nol tidak bisa menjadi pembagi!');
        return;
    end
    result = 100 / param;
end
