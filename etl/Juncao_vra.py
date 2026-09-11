import glob
import os
import pandas as pd

PASTA_BASE = os.path.dirname(os.path.abspath(__file__))  #pasta onde o script está (Processed)
PASTA_VRA = os.path.join(PASTA_BASE, "..", "raw")         #onde estão os 12 CSVs (RAW)
ARQUIVO_SAIDA = os.path.join(PASTA_BASE, "vra_2024_completo.csv")  #onde salvar o resultado


def carregar_csv(caminho):
    for encoding in ("utf-8-sig", "latin1", "cp1252"):
        try:
            return pd.read_csv(caminho, sep=";", encoding=encoding, dtype=str)
        except (UnicodeDecodeError, UnicodeError):
            continue
    raise ValueError(f"Não consegui ler {caminho} com nenhuma codificação testada.")

def main():
    arquivos = sorted(glob.glob(os.path.join(PASTA_VRA, "*.csv")))
    arquivos = [a for a in arquivos if os.path.basename(a) != os.path.basename(ARQUIVO_SAIDA)]

    if not arquivos:
        print(f"Nenhum arquivo .csv encontrado em: {PASTA_VRA}")
        return

    print(f"Encontrados {len(arquivos)} arquivos:")
    for a in arquivos:
        print(f"  - {os.path.basename(a)}")

    dataframes = []
    for arquivo in arquivos:
        df = carregar_csv(arquivo)
        df["arquivo_origem"] = os.path.basename(arquivo)
        dataframes.append(df)
        print(f"  ✓ {os.path.basename(arquivo)}: {len(df)} linhas")

    df_final = pd.concat(dataframes, ignore_index=True)
    df_final.to_csv(ARQUIVO_SAIDA, sep=";", index=False, encoding="utf-8-sig")

    print(f"\nPronto! {len(df_final)} linhas no total.")
    print(f"Arquivo salvo em: {ARQUIVO_SAIDA}")

if __name__ == "__main__":
    main()
