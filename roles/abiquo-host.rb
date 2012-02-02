name "abiquo-host"
run_list "recipe[selinux::disabled]"

override_attributes(
  "repo" => {
    "abiquo-ee" => {
      "url" => "http://mirror.bcn.abiquo.com/2.0/",
      "key" => "RPM-GPG-KEY-Abiquo"
    },
    "abiquo" => {
      "url" => "http://mirror.abiquo.com/abiquo/2.0/os/x86_64",
      "key" => "RPM-GPG-KEY-Abiquo"
    }
  }
)

