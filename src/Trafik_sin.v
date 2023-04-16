module trafik_sinyalizasyon(input clk, 
    output reg kirmizi, output reg sari, output reg yesil );


parameter kirmizi_isik = 60;
parameter sari_isik = 3;
parameter yesil_isik = 20;

reg [3:0] isik = 0;

always @(posedge clk)
begin
    case (isik)
        0:
            kirmizi <= 1;
            sari <= 0;
            yesil <= 0; 
            if (kirmizi_isik) isik <= 1;
        1:  kirmizi <= 1; 
            sari <= 1;
            yesil <= 0; 
            if (sari_isik) isik <= 2;
        2:  kirmizi <= 0; 
            sari <= 0;
            yesil <= 1;
            if (yesil_isik) isik <= 3;
        3:  kirmizi <= 0; 
            sari <= 1; 
            yesil <= 0; 
            if (sari_isik) isik <= 0;
    endcase
end

endmodule