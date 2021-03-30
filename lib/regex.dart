final RegExp emailRegex = new RegExp(
    r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
    r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$"
);

final RegExp passwordRegex = new RegExp(
  r"^(?=.*[0-9])(?=.*[a-zA-Z])([a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+){6,}$"
);