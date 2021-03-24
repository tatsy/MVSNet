import os
import re
import shutil
import argparse

point_dir = 'points'
point_path = 'final3d_model.ply'
methods = ['mvsnet']

def main(src, dst):
    pat = re.compile('scan([0-9]{1,3})')
    scans = sorted(os.listdir(src))
    for scan in scans:
        mat = pat.search(scan)
        if mat is None:
            continue

        idx = int(mat.group(1))
        for method in methods:
            target = os.path.join(src, scan, method, point_dir, point_path)
            if os.path.isfile(target):
                out_path = '{:s}{:03d}_l3.ply'.format(method, idx)
                output = os.path.join(dst, method, out_path)
                if not os.path.exists(os.path.dirname(output)):
                    os.makedirs(os.path.dirname(output))

                shutil.copyfile(target, output)
                print(output)


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='Deploy MVSNet and MVIRNet results for evaluation')
    parser.add_argument('-s', '--source', type=str, required=True,
                        help='Directory where the MVS results stored')
    parser.add_argument('-d', '--dest', type=str, required=True,
                        help='Destination directory')
    args = parser.parse_args()

    main(args.source, args.dest)
