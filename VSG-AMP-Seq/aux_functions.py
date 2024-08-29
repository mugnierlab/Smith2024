"""VSG-AMP-Seq: additional functions
   Smith 2024
   Author: Jaclyn Smith
"""


def read_in_primers(primers):
    """Primer Read in

    This reads in primers from file into a dictionary; also creates dictionary for
    vsg predicted sequences

    Args:
        primers: tab delimited file with primer names followed by sequences followed by
        the predicted 150 bp sequence from the VSG of interest
    """
    # dict with primers
    primer_dictionary = {}
    # dict with predicted seq
    pred_seq_dict = {}
    with open(primers, "r") as primer_file:
        for entry in primer_file:
            primer = entry.strip().split("\t")
            # key = sequence, value = primer name
            primer_dictionary[primer[1]] = primer[0]
            pred_seq_dict[primer[0]] = primer[2]
    return primer_dictionary, pred_seq_dict


def main():
    """Execute the functions"""
    print("none")


if __name__ == '__main__':
    main()