# nix hash mismatches reproducer

## setup

Clone both repositories into a common folder on machine A:

``` bash
mkdir hashes
cd hashes
git clone git@github.com:dkuettel/hashes-main.git main
git clone git@github.com:dkuettel/hashes-dep.git dep
```

Clone only one on machine B:

``` bash
mkdir hashes
cd hashes
git clone git@github.com:dkuettel/hashes-main.git main
```

In main on machine A run `go`:

``` bash
cd hashes/main
./go
```

In main on machine B, run `try`:

``` bash
cd hashes/main
./try
```

You should see hash mismatches. This seems to happen as long as on machine A in `go` you do _any_ one of the `nix * ...` commands.
