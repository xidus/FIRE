"""
Kommandoliniebrugergrænsefladen (en command-line interface, CLI) til FIREs API.

"""

import click

from fire.api import FireDb

firedb = FireDb()
_show_colors = True


def _set_monochrome(ctx, param, value):
    """
    Anvend værdien af --monokrom og sæt den globale værdi af _show_colors.
    """
    global _show_colors
    _show_colors = not value


def _set_debug(ctx, param, value):
    """
    Ændrer debug tilstand på firedb object vha --debug.
    """
    global firedb
    firedb.engine.echo = value


def _set_database(ctx, param, value):
    """
    Vælg en specifik databaseforbindelse.
    """
    if value is not None:
        new_firedb = FireDb(db=str(value).lower())
        override_firedb(new_firedb)


_default_options = [
    click.option(
        "--db",
        type=click.Choice(["prod", "test"]),
        default=None,
        callback=_set_database,
        help="Vælg en specifik databaseforbindelse - default_connection i fire.ini bruges hvis intet vælges.",
    ),
    click.option(
        "-m",
        "--monokrom",
        is_flag=True,
        callback=_set_monochrome,
        help="Vis ikke farver i terminalen",
    ),
    click.option(
        "--debug",
        is_flag=True,
        callback=_set_debug,
        help="Vis debug output fra FIRE-databasen.",
    ),
    click.help_option(help="Vis denne hjælp tekst"),
]


def default_options(**kwargs):
    """Create decorator that handles all default options"""

    def _add_options(func):
        # Click-produced help text shows arguments and options
        # in the order they were added.
        # Reversing the order to have it shown in same order in
        # the help text as items were defined in the list.
        for option in reversed(_default_options):
            func = option(func)
        return func

    return _add_options


def print(*args, **kwargs):
    """
    FIRE-specifik print funktion baseret på click.secho.

    Tilsidesætter farven når --monokrom parameteren anvendes i
    kommandolinjekald.
    """

    kwargs["color"] = _show_colors
    click.secho(*args, **kwargs)


def override_firedb(new_firedb: FireDb):
    """
    Tillad at bruge en anden firedb end den der oprettes automatisk af
    fire.cli.
    """
    global firedb
    firedb = new_firedb
