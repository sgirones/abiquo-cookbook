name "abiquo-host"
run_list "recipe[selinux::disabled]"

override_attributes(
  "repo" => {
    "abiquo-ee" => {
      "url" => "http://mirror.bcn.abiquo.com/1.8-rolling/",
      "key" => "RPM-GPG-KEY-Abiquo"
    },
    "abiquo" => {
      "url" => "http://mirror.abiquo.com/abiquo/1.8.5/os/x86_64",
      "key" => "RPM-GPG-KEY-Abiquo"
    }
  }
)

