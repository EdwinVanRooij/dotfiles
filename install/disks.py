class Partition(object):
    """Partition class."""

    def __init__(self, number, start, end, size, file_system, name, flags):
        self.number = number
        self.start = start
        self.end = end
        self.size = size
        self.file_system = file_system
        self.name = name
        self.flags = flags

    def __str__(self):
        return "Partition '{number}' ({file_system}): {size}".format(
            number=self.number,
            file_system=self.file_system,
            size=self.size,
        )


class Disk(object):
    """Disk class."""

    def __init__(self, model, location, size, sector_size, partition_table, flags, partitions):
        self.model = model
        self.location = location
        self.size = size
        self.sector_size = sector_size
        self.partition_table = partition_table
        self.flags = flags
        self.partitions = partitions

    def get_partition_by_number(self, number):
        for p in self.partitions:
            if p.number == number:
                return p

    def get_partition_numbers(self):
        numbers = []
        for p in self.partitions:
            numbers.append(p.number)
        return numbers


    def __str__(self):
        return "Disk '{model}' ({location}): {size} ({partitions} partitions)".format(
            model=self.model,
            location=self.location,
            size=self.size,
            partitions=len(self.partitions),
        )


def parse_disks(parted_output):
    """
    Parses output from 'sudo parted -l' into Disk objects.
    :param parted_output:
    :return:
    """
    disks_raw = parted_output.split("Model: ")[1:]
    result = []
    for d in disks_raw:
        result.append(parse_disk(d))
    return result


def parse_partition(partition_raw):
    words = partition_raw.split()
    number = None
    start = None
    end = None
    size = None
    file_system = None
    name = None
    i = 0
    for w in words:
        if i == 0:
            number = words[i]
        elif i == 1:
            start = words[i]
        elif i == 2:
            end = words[i]
        elif i == 3:
            size = words[i]
        elif i == 4:
            file_system = words[i]
        elif i == 5:
            name = words[i]
        i += 1
    p = Partition(number, start, end, size, file_system, name, None)
    return p


def parse_partitions(partitions_raw):
    partitions = []
    if isinstance(partitions_raw, list):
        for partition_raw in partitions_raw:
            if partition_raw:
                partitions.append(parse_partition(partition_raw))

    return partitions


def parse_disk(disk_raw):
    lines = disk_raw.splitlines()

    model = lines[0]
    location = lines[1].split()[1][:-1]
    size = lines[1].split()[-1]
    sector_size = lines[2].split()[-1]
    partition_table = lines[3].split()[-1]
    flags = lines[4]
    partitions = parse_partitions(lines[7:])

    return Disk(model, location, size, sector_size, partition_table, flags, partitions)
