Badge.delete_all

badges = [
  {
    name: "Apprentice",
    description: "For Reaching Level 5",
    based_on: "Level",
    based_at: 5
  },
  {
    name: "Apedt",
    description: "For Reaching Level 10",
    based_on: "Level",
    based_at: 10
  },
  {
    name: "Expert",
    description: "For Reaching Level 15",
    based_on: "Level",
    based_at: 15
  },
  {
    name: "Master",
    description: "For Reaching Level 20",
    based_on: "Level",
    based_at: 20
  }
]

badges.each do |badge|
  Badge.create(badge)
end
