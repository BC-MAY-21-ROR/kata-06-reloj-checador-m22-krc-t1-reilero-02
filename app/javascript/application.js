// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import { Turbo } from '@hotwired/turbo-rails';
import 'bootstrap';
import 'controllers';
import 'jquery';
import 'popper';
import './clock';

Turbo.session.drive = false;
